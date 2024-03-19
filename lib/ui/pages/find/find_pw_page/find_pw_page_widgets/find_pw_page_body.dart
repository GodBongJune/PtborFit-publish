import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ptbrofit/core/color.dart';
import 'package:ptbrofit/core/move.dart';
import 'package:ptbrofit/core/size.dart';

class FindPWPageBody extends StatelessWidget {
  const FindPWPageBody({super.key});

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
                //아이디
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "아이디(이메일)",
                      style: TextStyle(color: k70Color, fontSize: size15),
                    ),
                    Container(
                      child: TextFormField(
                        style: TextStyle(decorationThickness: 0),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "이메일 주소",
                          hintStyle: TextStyle(
                            color: kA9Color,
                            fontSize: size13,
                          ),
                          isDense: true,
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
                        style: TextStyle(decorationThickness: 0),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "실명을 입력하세요",
                          hintStyle: TextStyle(
                            color: kA9Color,
                            fontSize: size13,
                          ),
                          isDense: true,
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
                            onTap: () {},
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.25,
                              height: MediaQuery.of(context).size.height * 0.03,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: kD9Color,
                              ),
                              child: Center(
                                child: Text(
                                  "인증번호 전송",
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
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
                //비밀번호 찾기버튼
                InkWell(
                  onTap: () {
                    Navigator.popAndPushNamed(context, Move.findPWChangePage);
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.075,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(49),
                      color: kMainColor,
                    ),
                    child: Center(
                      child: Text(
                        "비밀번호 찾기",
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
