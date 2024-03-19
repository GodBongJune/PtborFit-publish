import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:ptbrofit/core/appCode.dart';
import 'package:ptbrofit/core/color.dart';
import 'package:ptbrofit/core/move.dart';
import 'package:ptbrofit/core/size.dart';
import 'package:ptbrofit/data/dto/user_request_dto.dart';
import 'package:ptbrofit/data/store/session_viewmodel.dart';
import 'package:ptbrofit/utils/custom_util.dart';

class FindIdPageBody extends StatefulWidget {
  const FindIdPageBody({super.key});

  @override
  State<FindIdPageBody> createState() => _FindIdPageBodyState();
}

class _FindIdPageBodyState extends State<FindIdPageBody> {
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController authCode = TextEditingController();

  bool lockName = false;
  bool lockPhone = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Consumer(
        builder: (context, ref, child) {
          return CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: [
                    //이름
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "이름",
                          style: TextStyle(color: k70Color, fontSize: size15),
                        ),
                        Container(
                          child: TextFormField(
                            readOnly: lockName,
                            controller: name,
                            style: TextStyle(decorationThickness: 0),
                            decoration: InputDecoration(
                              isDense: true,
                              border: InputBorder.none,
                              hintText: "실명을 입력하세요",
                              hintStyle: TextStyle(
                                color: kA9Color,
                                fontSize: size13,
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: kB9Color),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: kB9Color),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    //번호
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "휴대폰 번호",
                          style: TextStyle(color: k70Color, fontSize: size15),
                        ),
                        Container(
                          child: TextFormField(
                            readOnly: lockPhone,
                            controller: phone,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            style: TextStyle(decorationThickness: 0),
                            decoration: InputDecoration(
                              isDense: true,
                              border: InputBorder.none,
                              hintText: "'-' 구분없이 입력",
                              hintStyle: TextStyle(
                                color: kA9Color,
                                fontSize: size13,
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: kB9Color),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: kB9Color),
                              ),
                              suffix: InkWell(
                                onTap: () {
                                  customDialog(context, "인증번호 전송중입니다");
                                  FindEmailSMSReqDTO requestDTO =
                                      FindEmailSMSReqDTO(
                                    phone: phone.text,
                                    name: name.text,
                                    appCode: GlobalAppCode().appCode,
                                  );
                                  ref.read(sessionProvider).findEmailSMS(
                                      requestDTO, context, (bool success) {
                                    if (!success) {
                                      Navigator.of(context).pop(context);
                                      return;
                                    }
                                    if (success) {
                                      Navigator.of(context).pop(context);
                                      setState(() {
                                        lockName = true;
                                        lockPhone = true;
                                      });
                                    }
                                  });
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  height:
                                      MediaQuery.of(context).size.height * 0.03,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    color: lockPhone ? kMainColor : kD9Color,
                                  ),
                                  child: Center(
                                    child: Text(
                                      "인증번호 전송",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: size12,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    //인증번호
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "인증번호",
                          style: TextStyle(color: k70Color, fontSize: size15),
                        ),
                        TextFormField(
                          controller: authCode,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          style: TextStyle(decorationThickness: 0),
                          decoration: InputDecoration(
                            isDense: true,
                            border: InputBorder.none,
                            hintText: "인증번호 입력",
                            hintStyle: TextStyle(
                              color: kA9Color,
                              fontSize: size13,
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: kB9Color),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: kB9Color),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Spacer(),
                    //아이디찾기버튼
                    InkWell(
                      onTap: () {
                        if (!lockPhone) {
                          customSnackbar(context, "휴대폰 인증을 해주세요");
                          return;
                        }
                        if (authCode.text == null || authCode.text.isEmpty) {
                          customSnackbar(context, "인증번호를 입력해주세요");
                          return;
                        }
                        ref
                            .read(sessionProvider)
                            .findEmailSMSAuth(context, authCode.text);
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.075,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(49),
                          color: kMainColor,
                        ),
                        child: Center(
                          child: Text(
                            "아이디 찾기",
                            style: TextStyle(
                                color: Colors.white, fontSize: size15),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
