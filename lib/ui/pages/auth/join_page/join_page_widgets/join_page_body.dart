import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ptbrofit/core/appCode.dart';
import 'package:ptbrofit/core/color.dart';
import 'package:ptbrofit/core/move.dart';
import 'package:ptbrofit/core/size.dart';
import 'package:ptbrofit/data/dto/user_request_dto.dart';
import 'package:ptbrofit/data/store/session_viewmodel.dart';
import 'package:ptbrofit/ui/pages/auth/join_page/join_page_widgets/join_page_agree.dart';
import 'package:ptbrofit/utils/custom_util.dart';

enum Gender { man, woman }

class JoinPageBody extends StatefulWidget {
  const JoinPageBody({super.key});

  @override
  State<JoinPageBody> createState() => _JoinPageBodyState();
}

class _JoinPageBodyState extends State<JoinPageBody> {
  TextEditingController email = TextEditingController();
  TextEditingController emailCheck = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController passwordCheck = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController birth = TextEditingController();

  bool lockEmail = false;
  bool lockEmailCheck = false;

  bool man = true;
  bool woman = false;

  bool agreeCheckAll = false;
  bool agreeCheck1 = false;
  bool agreeCheck2 = false;
  bool agreeCheck3 = false;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  //이메일
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "아이디(이메일)",
                        style: TextStyle(color: k70Color, fontSize: size15),
                      ),
                      Container(
                        child: TextFormField(
                          controller: email,
                          readOnly: lockEmail,
                          style: TextStyle(decorationThickness: 0),
                          decoration: InputDecoration(
                            isDense: true,
                            border: InputBorder.none,
                            hintText: "이메일 주소",
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
                              onTap: lockEmail
                                  ? null
                                  : () {
                                      customDialog(context, "인증번호 전송중입니다");

                                      JoinEmailReqDTO requestDTO =
                                          JoinEmailReqDTO(
                                        appCode: GlobalAppCode().appCode,
                                        appMemberEmail: email.text,
                                        emailAuthType: "JOIN",
                                      );
                                      ref.watch(sessionProvider).joinEmail(
                                          requestDTO, context, (bool success) {
                                        if (!success) {
                                          Navigator.pop(context);
                                          return;
                                        }
                                        setState(() {
                                          lockEmail = true;
                                        });
                                        Navigator.pop(context);
                                      });
                                    },
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.2,
                                height:
                                    MediaQuery.of(context).size.height * 0.023,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: lockEmail ? kMainColor : kD9Color,
                                ),
                                child: Center(
                                  child: Text(
                                    "중복확인",
                                    style: TextStyle(
                                      color: k65Color,
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
                        controller: emailCheck,
                        readOnly: lockEmailCheck,
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
                            suffix: InkWell(
                              onTap: lockEmailCheck
                                  ? null
                                  : () {
                                      customDialog(context, "인증번호 확인중입니다");

                                      JoinEmailAuthReqDTO requestDTO =
                                          JoinEmailAuthReqDTO(
                                              appCode: GlobalAppCode().appCode,
                                              appMemberEmail: email.text,
                                              emailAuthType: "JOIN",
                                              authCode: emailCheck.text);

                                      ref.watch(sessionProvider).joinEmailAuth(
                                          requestDTO, context, (bool success) {
                                        if (!success) {
                                          Navigator.pop(context);
                                          return;
                                        }
                                        setState(() {
                                          lockEmailCheck = true;
                                        });
                                        Navigator.pop(context);
                                      });
                                    },
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.2,
                                height:
                                    MediaQuery.of(context).size.height * 0.023,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: lockEmailCheck ? kMainColor : kD9Color,
                                ),
                                child: Center(
                                  child: Text(
                                    "인증확인",
                                    style: TextStyle(
                                      color: k65Color,
                                      fontSize: size12,
                                    ),
                                  ),
                                ),
                              ),
                            )),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  //비밀번호
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "비밀번호",
                        style: TextStyle(color: k70Color, fontSize: size15),
                      ),
                      TextFormField(
                        onChanged: (value) {
                          setState(() {});
                        },
                        controller: password,
                        obscureText: true,
                        style: TextStyle(decorationThickness: 0),
                        decoration: InputDecoration(
                          isDense: true,
                          border: InputBorder.none,
                          hintText: "비밀번호",
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
                  //비밀번호 확인
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "비밀번호 확인",
                        style: TextStyle(color: k70Color, fontSize: size15),
                      ),
                      TextFormField(
                        controller: passwordCheck,
                        onChanged: (value) {
                          setState(() {});
                        },
                        obscureText: true,
                        style: TextStyle(decorationThickness: 0),
                        decoration: InputDecoration(
                          isDense: true,
                          suffix: Icon(
                            CupertinoIcons.check_mark_circled_solid,
                            color: password.text == passwordCheck.text
                                ? kMainColor
                                : k70Color,
                          ),
                          border: InputBorder.none,
                          hintText: "비밀번호 확인",
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
                  //이름
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "이름",
                        style: TextStyle(color: k70Color, fontSize: size15),
                      ),
                      TextFormField(
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
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  //휴대폰 번호
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "휴대폰 번호",
                        style: TextStyle(color: k70Color, fontSize: size15),
                      ),
                      Container(
                        child: TextFormField(
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
                            // suffix: Container(
                            //   width: MediaQuery.of(context).size.width * 0.25,
                            //   height: MediaQuery.of(context).size.height * 0.03,
                            //   decoration: BoxDecoration(
                            //     borderRadius: BorderRadius.circular(7),
                            //     color: kD9Color,
                            //   ),
                            //   child: Center(
                            //     child: Text(
                            //       "인증번호 전송",
                            //       style: TextStyle(
                            //         color: k65Color,
                            //         fontSize: size12,
                            //       ),
                            //     ),
                            //   ),
                            // ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  //     // Expanded(
                  //     //   flex: 2,
                  //     //   child: InkWell(
                  //     //     onTap: () {
                  //     //       showDialog(
                  //     //         context: context,
                  //     //         builder: (BuildContext context) {
                  //     //           return AlertDialog(
                  //     //             shape: RoundedRectangleBorder(
                  //     //               borderRadius: BorderRadius.circular(15),
                  //     //             ),
                  //     //             content: Container(
                  //     //               height:
                  //     //                   MediaQuery.of(context).size.height *
                  //     //                       0.1,
                  //     //               width: MediaQuery.of(context).size.width *
                  //     //                   1.3,
                  //     //               child: Column(
                  //     //                 mainAxisAlignment:
                  //     //                     MainAxisAlignment.spaceAround,
                  //     //                 children: [
                  //     //                   Text(
                  //     //                     "인증번호 전송 완료",
                  //     //                     style: TextStyle(
                  //     //                       color: k70Color,
                  //     //                       fontSize: size15,
                  //     //                     ),
                  //     //                   ),
                  //     //                   SizedBox(height: 10),
                  //     //                   InkWell(
                  //     //                     onTap: () {
                  //     //                       Navigator.pop(context);
                  //     //                     },
                  //     //                     child: Container(
                  //     //                       width: MediaQuery.of(context)
                  //     //                               .size
                  //     //                               .width *
                  //     //                           0.15,
                  //     //                       height: MediaQuery.of(context)
                  //     //                               .size
                  //     //                               .height *
                  //     //                           0.05,
                  //     //                       decoration: BoxDecoration(
                  //     //                         borderRadius:
                  //     //                             BorderRadius.circular(7),
                  //     //                         color: kMainColor,
                  //     //                       ),
                  //     //                       child: Center(
                  //     //                         child: Text(
                  //     //                           "확인",
                  //     //                           style: TextStyle(
                  //     //                             color: Colors.white,
                  //     //                             fontSize: size13,
                  //     //                           ),
                  //     //                         ),
                  //     //                       ),
                  //     //                     ),
                  //     //                   ),
                  //     //                 ],
                  //     //               ),
                  //     //             ),
                  //     //           );
                  //     //         },
                  //     //       );
                  //     //     },
                  //     //     child: Container(
                  //     //       decoration: BoxDecoration(
                  //     //         borderRadius: BorderRadius.circular(7),
                  //     //         color: kD9Color,
                  //     //       ),
                  //     //       child: Center(
                  //     //         child: Text(
                  //     //           "인증번호 전송",
                  //     //           style: TextStyle(
                  //     //             color: k65Color,
                  //     //             fontSize: size10,
                  //     //           ),
                  //     //         ),
                  //     //       ),
                  //     //     ),
                  //     //   ),
                  //     // ),
                  //   ],
                  // ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  //생년월일
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "생년월일",
                        style: TextStyle(color: k70Color, fontSize: size15),
                      ),
                      TextFormField(
                        controller: birth,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        style: TextStyle(decorationThickness: 0),
                        decoration: InputDecoration(
                          isDense: true,
                          border: InputBorder.none,
                          hintText: "8자리 입력",
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
                  //성별
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "성별",
                          style: TextStyle(
                            color: k70Color,
                            fontSize: size15,
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  man = true;
                                  woman = false;
                                });
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.radio_button_checked,
                                    color: man ? kMainColor : kC0Color,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "남성",
                                    style: TextStyle(
                                      fontSize: size13,
                                      color: k70Color,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 30),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  man = false;
                                  woman = true;
                                });
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.radio_button_checked,
                                    color: woman ? kMainColor : kC0Color,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "여성",
                                    style: TextStyle(
                                      fontSize: size13,
                                      color: k70Color,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  //약관동의
                  Container(
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              agreeCheckAll = !agreeCheckAll;
                              if (agreeCheckAll) {
                                agreeCheck1 = true;
                                agreeCheck2 = true;
                                agreeCheck3 = true;
                              } else {
                                agreeCheck1 = false;
                                agreeCheck2 = false;
                                agreeCheck3 = false;
                              }
                            });
                          },
                          child: Container(
                            child: Row(
                              children: [
                                Icon(
                                  agreeCheckAll
                                      ? Icons.radio_button_on
                                      : Icons.radio_button_off,
                                  color: agreeCheckAll ? kMainColor : kC0Color,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "아래 약관에 모두 동의합니다.",
                                  style: TextStyle(
                                    color: k3DColor,
                                    fontSize: size15,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Divider(color: kB9Color, thickness: 1),
                        Column(
                          children: [
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      agreeCheck1 = !agreeCheck1;
                                    });
                                  },
                                  child: Row(
                                    children: [
                                      Icon(
                                        agreeCheck1
                                            ? Icons.radio_button_on
                                            : Icons.radio_button_off,
                                        color:
                                            agreeCheck1 ? kMainColor : kC0Color,
                                      ),
                                      SizedBox(width: 2),
                                      Text(
                                        "이용약관 동의",
                                        style: TextStyle(
                                            color: k70Color, fontSize: size13),
                                      ),
                                    ],
                                  ),
                                ),
                                Spacer(),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                JoinAgreePage()));
                                  },
                                  child: Text(
                                    "보기",
                                    style: TextStyle(
                                      color: k70Color,
                                      fontSize: size13,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      agreeCheck2 = !agreeCheck2;
                                    });
                                  },
                                  child: Row(
                                    children: [
                                      Icon(
                                        agreeCheck2
                                            ? Icons.radio_button_on
                                            : Icons.radio_button_off,
                                        color:
                                            agreeCheck2 ? kMainColor : kC0Color,
                                      ),
                                      SizedBox(width: 2),
                                      Text(
                                        "개인정보취급방침 동의",
                                        style: TextStyle(
                                            color: k70Color, fontSize: size13),
                                      ),
                                    ],
                                  ),
                                ),
                                Spacer(),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                JoinAgreePage()));
                                  },
                                  child: Text(
                                    "보기",
                                    style: TextStyle(
                                      color: k70Color,
                                      fontSize: size13,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      agreeCheck3 = !agreeCheck3;
                                    });
                                  },
                                  child: Row(
                                    children: [
                                      Icon(
                                        agreeCheck3
                                            ? Icons.radio_button_on
                                            : Icons.radio_button_off,
                                        color:
                                            agreeCheck3 ? kMainColor : kC0Color,
                                      ),
                                      SizedBox(width: 2),
                                      Text(
                                        "마케팅 정보 수신 동의",
                                        style: TextStyle(
                                            color: k70Color, fontSize: size13),
                                      ),
                                    ],
                                  ),
                                ),
                                Spacer(),
                                InkWell(
                                  onTap: () {},
                                  child: Text(
                                    "보기",
                                    style: TextStyle(
                                      color: k70Color,
                                      fontSize: size13,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  //가입하기 버튼
                  Center(
                    child: Container(
                      // width:
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.075,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: k94Color,
                      ),
                      child: InkWell(
                        onTap: () {
                          // if (email.text == null ||
                          //     email.text.isEmpty ||
                          //     emailCheck.text == null ||
                          //     emailCheck.text.isEmpty ||
                          //     password.text == null ||
                          //     passwordCheck.text.isEmpty ||
                          //     name.text == null ||
                          //     name.text.isEmpty ||
                          //     phone.text == null ||
                          //     phone.text.isEmpty ||
                          //     birth.text == null ||
                          //     birth.text.isEmpty) {
                          //   customSnackbar(context, "공백을 채워주세요");
                          //   return;
                          // }
                          // if (lockEmail == false) {
                          //   customSnackbar(context, "이메일 중복확인을 해주세요");
                          //   return;
                          // }
                          // if (lockEmailCheck == false) {
                          //   customSnackbar(context, "이메일 인증을 해주세요");
                          //   return;
                          // }
                          // if (password.text != passwordCheck.text) {
                          //   customSnackbar(context, "비밀번호가 일치하지 않습니다");
                          // }
                          //
                          // if (!agreeCheck1 || !agreeCheck2) {
                          //   customSnackbar(context, "이용약관에 동의해 주세요");
                          //   return;
                          // }
                          customDialog(context, "회원가입중입니다");

                          JoinReqDTO requestDTO = JoinReqDTO(
                            appCode: GlobalAppCode().appCode,
                            appMemberEmail: email.text,
                            appMemberPassword: passwordCheck.text,
                            appMemberType: "GENERAL",
                            appMemberName: name.text,
                            appMemberPhone: phone.text,
                            appMemberPrivateAgree: "Y",
                            birthDate: birth.text,
                            gender: man ? "MALE" : "FEMALE",
                          );
                          ref.watch(sessionProvider).join(requestDTO, context);
                        },
                        child: Center(
                          child: Text(
                            "가입하기",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: size15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
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
    );
  }
}

//본인인증 넣을때

// SizedBox(height: MediaQuery.of(context).size.height * 0.02),
// //아이디
// Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(
// "아이디(이메일)",
// style: TextStyle(color: k70Color, fontSize: size15),
// ),
// Container(
// child: TextFormField(
// controller: email,
// style: TextStyle(decorationThickness: 0),
// decoration: InputDecoration(
// isDense: true,
// border: InputBorder.none,
// hintText: "이메일 주소",
// hintStyle: TextStyle(
// color: kA9Color,
// fontSize: size13,
// ),
// focusedBorder: UnderlineInputBorder(
// borderSide: BorderSide(color: kB9Color),
// ),
// enabledBorder: UnderlineInputBorder(
// borderSide: BorderSide(color: kB9Color),
// ),
// suffix: Container(
// width: MediaQuery.of(context).size.width * 0.2,
// height: MediaQuery.of(context).size.height * 0.03,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(7),
// color: kD9Color,
// ),
// child: Center(
// child: Text(
// "중복확인",
// style: TextStyle(
// color: k65Color,
// fontSize: size12,
// ),
// ),
// ),
// ),
// ),
// ),
// ),
// ],
// ),
// SizedBox(height: MediaQuery.of(context).size.height * 0.02),
// //비밀번호
// Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(
// "비밀번호",
// style: TextStyle(color: k70Color, fontSize: size15),
// ),
// TextFormField(
// onChanged: (value) {
// setState(() {});
// },
// controller: password,
// obscureText: true,
// style: TextStyle(decorationThickness: 0),
// decoration: InputDecoration(
// isDense: true,
// border: InputBorder.none,
// hintText: "비밀번호",
// hintStyle: TextStyle(
// color: kA9Color,
// fontSize: size13,
// ),
// focusedBorder: UnderlineInputBorder(
// borderSide: BorderSide(color: kB9Color),
// ),
// enabledBorder: UnderlineInputBorder(
// borderSide: BorderSide(color: kB9Color),
// ),
// ),
// ),
// ],
// ),
// SizedBox(height: MediaQuery.of(context).size.height * 0.02),
// //비밀번호 확인
// Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(
// "비밀번호 확인",
// style: TextStyle(color: k70Color, fontSize: size15),
// ),
// TextFormField(
// controller: passwordCheck,
// onChanged: (value) {
// setState(() {});
// },
// obscureText: true,
// style: TextStyle(decorationThickness: 0),
// decoration: InputDecoration(
// isDense: true,
// suffix: Icon(
// CupertinoIcons.check_mark_circled_solid,
// color: password.text == passwordCheck.text
// ? kMainColor
//     : k70Color,
// ),
// border: InputBorder.none,
// hintText: "비밀번호 확인",
// hintStyle: TextStyle(
// color: kA9Color,
// fontSize: size13,
// ),
// focusedBorder: UnderlineInputBorder(
// borderSide: BorderSide(color: kB9Color),
// ),
// enabledBorder: UnderlineInputBorder(
// borderSide: BorderSide(color: kB9Color),
// ),
// ),
// ),
// ],
// ),
// SizedBox(height: MediaQuery.of(context).size.height * 0.02),
// //이름
// Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(
// "이름",
// style: TextStyle(color: k70Color, fontSize: size15),
// ),
// TextFormField(
// controller: name,
// style: TextStyle(decorationThickness: 0),
// decoration: InputDecoration(
// isDense: true,
// border: InputBorder.none,
// hintText: "실명을 입력하세요",
// hintStyle: TextStyle(
// color: kA9Color,
// fontSize: size13,
// ),
// focusedBorder: UnderlineInputBorder(
// borderSide: BorderSide(color: kB9Color),
// ),
// enabledBorder: UnderlineInputBorder(
// borderSide: BorderSide(color: kB9Color),
// ),
// ),
// ),
// ],
// ),
// SizedBox(height: MediaQuery.of(context).size.height * 0.02),
// //휴대폰 번호
// Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(
// "휴대폰 번호",
// style: TextStyle(color: k70Color, fontSize: size15),
// ),
// Container(
// child: TextFormField(
// controller: phone,
// keyboardType: TextInputType.number,
// inputFormatters: [FilteringTextInputFormatter.digitsOnly],
// style: TextStyle(decorationThickness: 0),
// decoration: InputDecoration(
// isDense: true,
// border: InputBorder.none,
// hintText: "'-' 구분없이 입력",
// hintStyle: TextStyle(
// color: kA9Color,
// fontSize: size13,
// ),
// focusedBorder: UnderlineInputBorder(
// borderSide: BorderSide(color: kB9Color),
// ),
// enabledBorder: UnderlineInputBorder(
// borderSide: BorderSide(color: kB9Color),
// ),
// suffix: Container(
// width: MediaQuery.of(context).size.width * 0.25,
// height: MediaQuery.of(context).size.height * 0.03,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(7),
// color: kD9Color,
// ),
// child: Center(
// child: Text(
// "인증번호 전송",
// style: TextStyle(
// color: k65Color,
// fontSize: size12,
// ),
// ),
// ),
// ),
// ),
// ),
// ),
// ],
// ),
// //     // Expanded(
// //     //   flex: 2,
// //     //   child: InkWell(
// //     //     onTap: () {
// //     //       showDialog(
// //     //         context: context,
// //     //         builder: (BuildContext context) {
// //     //           return AlertDialog(
// //     //             shape: RoundedRectangleBorder(
// //     //               borderRadius: BorderRadius.circular(15),
// //     //             ),
// //     //             content: Container(
// //     //               height:
// //     //                   MediaQuery.of(context).size.height *
// //     //                       0.1,
// //     //               width: MediaQuery.of(context).size.width *
// //     //                   1.3,
// //     //               child: Column(
// //     //                 mainAxisAlignment:
// //     //                     MainAxisAlignment.spaceAround,
// //     //                 children: [
// //     //                   Text(
// //     //                     "인증번호 전송 완료",
// //     //                     style: TextStyle(
// //     //                       color: k70Color,
// //     //                       fontSize: size15,
// //     //                     ),
// //     //                   ),
// //     //                   SizedBox(height: 10),
// //     //                   InkWell(
// //     //                     onTap: () {
// //     //                       Navigator.pop(context);
// //     //                     },
// //     //                     child: Container(
// //     //                       width: MediaQuery.of(context)
// //     //                               .size
// //     //                               .width *
// //     //                           0.15,
// //     //                       height: MediaQuery.of(context)
// //     //                               .size
// //     //                               .height *
// //     //                           0.05,
// //     //                       decoration: BoxDecoration(
// //     //                         borderRadius:
// //     //                             BorderRadius.circular(7),
// //     //                         color: kMainColor,
// //     //                       ),
// //     //                       child: Center(
// //     //                         child: Text(
// //     //                           "확인",
// //     //                           style: TextStyle(
// //     //                             color: Colors.white,
// //     //                             fontSize: size13,
// //     //                           ),
// //     //                         ),
// //     //                       ),
// //     //                     ),
// //     //                   ),
// //     //                 ],
// //     //               ),
// //     //             ),
// //     //           );
// //     //         },
// //     //       );
// //     //     },
// //     //     child: Container(
// //     //       decoration: BoxDecoration(
// //     //         borderRadius: BorderRadius.circular(7),
// //     //         color: kD9Color,
// //     //       ),
// //     //       child: Center(
// //     //         child: Text(
// //     //           "인증번호 전송",
// //     //           style: TextStyle(
// //     //             color: k65Color,
// //     //             fontSize: size10,
// //     //           ),
// //     //         ),
// //     //       ),
// //     //     ),
// //     //   ),
// //     // ),
// //   ],
// // ),
// SizedBox(height: MediaQuery.of(context).size.height * 0.02),
// //인증번호
// Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(
// "인증번호",
// style: TextStyle(color: k70Color, fontSize: size15),
// ),
// TextFormField(
// controller: phoneCheck,
// keyboardType: TextInputType.number,
// inputFormatters: [FilteringTextInputFormatter.digitsOnly],
// style: TextStyle(decorationThickness: 0),
// decoration: InputDecoration(
// isDense: true,
// border: InputBorder.none,
// hintText: "인증번호 입력",
// hintStyle: TextStyle(
// color: kA9Color,
// fontSize: size13,
// ),
// focusedBorder: UnderlineInputBorder(
// borderSide: BorderSide(color: kB9Color),
// ),
// enabledBorder: UnderlineInputBorder(
// borderSide: BorderSide(color: kB9Color),
// ),
// ),
// ),
// ],
// ),
// SizedBox(height: MediaQuery.of(context).size.height * 0.02),
// //생년월일
// Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(
// "생년월일",
// style: TextStyle(color: k70Color, fontSize: size15),
// ),
// TextFormField(
// controller: birth,
// keyboardType: TextInputType.number,
// inputFormatters: [FilteringTextInputFormatter.digitsOnly],
// style: TextStyle(decorationThickness: 0),
// decoration: InputDecoration(
// isDense: true,
// border: InputBorder.none,
// hintText: "8자리 입력",
// hintStyle: TextStyle(
// color: kA9Color,
// fontSize: size13,
// ),
// focusedBorder: UnderlineInputBorder(
// borderSide: BorderSide(color: kB9Color),
// ),
// enabledBorder: UnderlineInputBorder(
// borderSide: BorderSide(color: kB9Color),
// ),
// ),
// ),
// ],
// ),
// SizedBox(height: MediaQuery.of(context).size.height * 0.02),
// //성별
// Container(
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(
// "성별",
// style: TextStyle(
// color: k70Color,
// fontSize: size15,
// ),
// ),
// SizedBox(height: 20),
// Row(
// children: [
// InkWell(
// onTap: () {
// setState(() {
// man = true;
// woman = false;
// });
// },
// child: Row(
// children: [
// Icon(
// Icons.radio_button_checked,
// color: man ? kMainColor : kC0Color,
// ),
// SizedBox(width: 10),
// Text(
// "남성",
// style: TextStyle(
// fontSize: size13,
// color: k70Color,
// ),
// ),
// ],
// ),
// ),
// SizedBox(width: 30),
// InkWell(
// onTap: () {
// setState(() {
// man = false;
// woman = true;
// });
// },
// child: Row(
// children: [
// Icon(
// Icons.radio_button_checked,
// color: woman ? kMainColor : kC0Color,
// ),
// SizedBox(width: 10),
// Text(
// "여성",
// style: TextStyle(
// fontSize: size13,
// color: k70Color,
// ),
// ),
// ],
// ),
// ),
// ],
// ),
// ],
// ),
// ),
// SizedBox(height: MediaQuery.of(context).size.height * 0.02),
// //약관동의
// Container(
// child: Column(
// children: [
// Container(
// child: Row(
// children: [
// InkWell(
// onTap: () {
// setState(() {
// agreeCheckAll = !agreeCheckAll;
// if (agreeCheckAll) {
// agreeCheck1 = true;
// agreeCheck2 = true;
// agreeCheck3 = true;
// } else {
// agreeCheck1 = false;
// agreeCheck2 = false;
// agreeCheck3 = false;
// }
// });
// },
// child: Icon(
// agreeCheckAll
// ? Icons.radio_button_on
//     : Icons.radio_button_off,
// color: agreeCheckAll ? kMainColor : kC0Color,
// ),
// ),
// SizedBox(width: 10),
// Text(
// "아래 약관에 모두 동의합니다.",
// style: TextStyle(
// color: k3DColor,
// fontSize: size15,
// ),
// )
// ],
// ),
// ),
// Divider(color: kB9Color, thickness: 1),
// Column(
// children: [
// Row(
// children: [
// InkWell(
// onTap: () {
// setState(() {
// agreeCheck1 = true;
// });
// },
// child: Icon(
// agreeCheck1
// ? Icons.radio_button_on
//     : Icons.radio_button_off,
// color: agreeCheck1 ? kMainColor : kC0Color,
// ),
// ),
// SizedBox(width: 2),
// Text(
// "이용약관 동의",
// style:
// TextStyle(color: k70Color, fontSize: size13),
// ),
// Spacer(),
// InkWell(
// onTap: () {
// Navigator.push(
// context,
// MaterialPageRoute(
// builder: (context) => JoinAgreePage()));
// },
// child: Text(
// "보기",
// style: TextStyle(
// color: k70Color,
// fontSize: size13,
// ),
// ),
// ),
// ],
// ),
// SizedBox(height: 5),
// Row(
// children: [
// InkWell(
// onTap: () {
// setState(() {
// agreeCheck2 = true;
// });
// },
// child: Icon(
// agreeCheck2
// ? Icons.radio_button_on
//     : Icons.radio_button_off,
// color: agreeCheck2 ? kMainColor : kC0Color,
// ),
// ),
// SizedBox(width: 2),
// Text(
// "개인정보취급방침 동의",
// style:
// TextStyle(color: k70Color, fontSize: size13),
// ),
// Spacer(),
// InkWell(
// onTap: () {
// Navigator.push(
// context,
// MaterialPageRoute(
// builder: (context) => JoinAgreePage()));
// },
// child: Text(
// "보기",
// style: TextStyle(
// color: k70Color,
// fontSize: size13,
// ),
// ),
// ),
// ],
// ),
// SizedBox(height: 5),
// Row(
// children: [
// InkWell(
// onTap: () {
// setState(() {
// agreeCheck3 = true;
// });
// },
// child: Icon(
// agreeCheck3
// ? Icons.radio_button_on
//     : Icons.radio_button_off,
// color: agreeCheck3 ? kMainColor : kC0Color,
// ),
// ),
// SizedBox(width: 2),
// Text(
// "마케팅 정보 수신 동의",
// style:
// TextStyle(color: k70Color, fontSize: size13),
// ),
// Spacer(),
// InkWell(
// onTap: () {},
// child: Text(
// "보기",
// style: TextStyle(
// color: k70Color,
// fontSize: size13,
// ),
// ),
// ),
// ],
// ),
// ],
// ),
// ],
// ),
// ),
// SizedBox(height: MediaQuery.of(context).size.height * 0.02),
// //가입하기 버튼
// Center(
// child: Container(
// // width:
// width: double.infinity,
// height: MediaQuery.of(context).size.height * 0.075,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(50),
// color: k94Color,
// ),
// child: InkWell(
// onTap: () {
// Navigator.of(context)
//     .popAndPushNamed(Move.joinSuccessPage);
// },
// child: Center(
// child: Text(
// "가입하기",
// style: TextStyle(
// color: Colors.white,
// fontSize: size15,
// fontWeight: FontWeight.bold,
// ),
// ),
// ),
// ),
// ),
// ),
// SizedBox(height: MediaQuery.of(context).size.height * 0.02),
