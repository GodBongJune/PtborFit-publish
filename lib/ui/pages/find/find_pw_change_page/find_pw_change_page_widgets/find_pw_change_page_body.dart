import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ptbrofit/core/color.dart';
import 'package:ptbrofit/core/size.dart';

class FindPWChangePageBody extends StatefulWidget {
  const FindPWChangePageBody({super.key});

  @override
  State<FindPWChangePageBody> createState() => _FindPWChangePageBodyState();
}

class _FindPWChangePageBodyState extends State<FindPWChangePageBody> {
  TextEditingController password = TextEditingController();
  TextEditingController passwordCheck = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
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
                Spacer(),
                //비밀번호 변경버튼
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          title: Row(
                            children: [
                              Spacer(),
                              Text(
                                "비밀번호가 변경되었습니다.",
                                style: TextStyle(
                                    color: k70Color, fontSize: size15),
                              ),
                              Spacer(),
                            ],
                          ),
                          actions: [
                            Row(
                              children: [
                                Spacer(),
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.03,
                                    width: MediaQuery.of(context).size.width *
                                        0.15,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      color: kMainColor,
                                    ),
                                    child: Center(
                                      child: Text(
                                        "확인",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: size15,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Spacer(),
                              ],
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.075,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(49),
                      color: kMainColor,
                    ),
                    child: Center(
                      child: Text(
                        "비밀번호 변경",
                        style: TextStyle(color: Colors.white, fontSize: size15),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
