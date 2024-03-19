import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ptbrofit/core/color.dart';
import 'package:ptbrofit/core/move.dart';
import 'package:ptbrofit/core/size.dart';

class FindIdSuccessPageBody extends StatelessWidget {
  const FindIdSuccessPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    final String email = ModalRoute.of(context)!.settings.arguments as String;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                Column(
                  children: [
                    Text(
                      "입력된 정보가 일치하는 아이디를 찾았습니다.",
                      style: TextStyle(
                          color: k59Color,
                          fontSize: size15,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: kEDColor,
                      ),
                      child: Column(
                        children: [
                          Spacer(),
                          Text(
                            "${email}",
                            style: TextStyle(
                                color: k3DColor,
                                fontSize: size20,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.01),
                          Text(
                            // "YYYY.MM.DD 가입",
                            "",
                            style: TextStyle(
                              color: kB9Color,
                              fontSize: size15,
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Spacer(),
                //비밀번호찾기 버튼
                InkWell(
                  onTap: () {
                    Navigator.popAndPushNamed(context, Move.findPWPage);
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.075,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(49),
                      color: kB9Color,
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
                //로그인하러가기 버튼
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.075,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(49),
                      color: kMainColor,
                    ),
                    child: Center(
                      child: Text(
                        "로그인 하러가기",
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
