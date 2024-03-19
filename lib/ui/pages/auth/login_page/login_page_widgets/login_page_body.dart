import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ptbrofit/core/appCode.dart';
import 'package:ptbrofit/core/color.dart';
import 'package:ptbrofit/core/move.dart';
import 'package:ptbrofit/core/size.dart';
import 'package:ptbrofit/data/dto/user_request_dto.dart';
import 'package:ptbrofit/data/store/session_viewmodel.dart';
import 'package:ptbrofit/ui/pages/main_page.dart';
import 'package:ptbrofit/utils/custom_util.dart';

class LoginPageBody extends StatelessWidget {
  const LoginPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email =
        TextEditingController(text: "darksen7693@gmail.com");
    TextEditingController password = TextEditingController(text: "!Dpaqktm123");

    return Consumer(
      builder: (context, ref, child) {
        return ListView(
          children: [
            Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          child: Center(
                            child: Text(
                              "회원 서비스 이용을 위해 로그인 해주세요",
                              style:
                                  TextStyle(color: k52Color, fontSize: size15),
                            ),
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.04),
                        TextFormField(
                          controller: email,
                          style: TextStyle(decorationThickness: 0),
                          decoration: InputDecoration(
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
                          ),
                        ),
                        // TextFormField(
                        //   style:
                        //       TextStyle(decorationThickness: 0, fontSize: size13),
                        //   decoration: InputDecoration(
                        //     border: InputBorder.none,
                        //     hintText: "아이디(이메일)",
                        //     hintStyle: TextStyle(
                        //       color: kA9Color,
                        //       fontSize: size13,
                        //     ),
                        //     focusedBorder: UnderlineInputBorder(
                        //       borderSide: BorderSide(color: kB9Color),
                        //     ),
                        //     enabledBorder: UnderlineInputBorder(
                        //       borderSide: BorderSide(color: kB9Color),
                        //     ),
                        //   ),
                        // ),
                        TextFormField(
                          controller: password,
                          obscureText: true,
                          style: TextStyle(decorationThickness: 0),
                          decoration: InputDecoration(
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
                        // TextFormField(
                        //   style:
                        //       TextStyle(decorationThickness: 0, fontSize: size13),
                        //   obscureText: true,
                        //   decoration: InputDecoration(
                        //     border: InputBorder.none,
                        //     hintText: "비밀번호",
                        //     hintStyle: TextStyle(
                        //       color: kA9Color,
                        //       fontSize: size13,
                        //     ),
                        //     focusedBorder: UnderlineInputBorder(
                        //       borderSide: BorderSide(color: kB9Color),
                        //     ),
                        //     enabledBorder: UnderlineInputBorder(
                        //       borderSide: BorderSide(color: kB9Color),
                        //     ),
                        //   ),
                        // ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.04),
                        //찾기 및 회원가입
                        Container(
                          height: MediaQuery.of(context).size.height * 0.03,
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, Move.findIdPage);
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  child: Center(
                                    child: Text(
                                      "아이디 찾기",
                                      style: TextStyle(
                                          color: kA9Color, fontSize: size13),
                                    ),
                                  ),
                                ),
                              ),
                              VerticalDivider(color: kB9Color, thickness: 1),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, Move.findPWPage);
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  child: Center(
                                    child: Text(
                                      "비밀번호 찾기",
                                      style: TextStyle(
                                          color: kA9Color, fontSize: size13),
                                    ),
                                  ),
                                ),
                              ),
                              VerticalDivider(color: kB9Color, thickness: 1),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed(Move.joinPage);
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  child: Center(
                                    child: Text(
                                      "회원가입",
                                      style: TextStyle(
                                          color: kA9Color, fontSize: size13),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.04),
                        //로그인
                        InkWell(
                          onTap: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MainPage()),
                                (route) => false);
                          },
                          child: Container(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.075,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: kMainColor,
                            ),
                            child: Center(
                              child: Text(
                                "로그인",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: size15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.1),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 1,
                            color: kB9Color,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text(
                            "간편 로그인",
                            style: TextStyle(color: k70Color, fontSize: size13),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 1,
                            color: kB9Color,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: SvgPicture.asset(
                        "assets/images/sns/googles.svg",
                        width: MediaQuery.of(context).size.width * 0.13,
                        height: MediaQuery.of(context).size.height * 0.08,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: SvgPicture.asset(
                        "assets/images/sns/kakaos.svg",
                        width: MediaQuery.of(context).size.width * 0.13,
                        height: MediaQuery.of(context).size.height * 0.08,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: SvgPicture.asset(
                        "assets/images/sns/navers.svg",
                        width: MediaQuery.of(context).size.width * 0.13,
                        height: MediaQuery.of(context).size.height * 0.08,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.06),
                InkWell(
                  onTap: () {},
                  child: Text(
                    "나중에 할게요",
                    style: TextStyle(
                      color: k70Color,
                      fontSize: size13,
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.06),
              ],
            ),
          ],
        );
      },
    );
  }
}
