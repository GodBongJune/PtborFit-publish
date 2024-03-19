import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ptbrofit/core/move.dart';
import 'package:ptbrofit/core/size.dart';
import 'package:ptbrofit/ui/pages/recommend_page/recommend_page_widgets/recommend_page_yoga.dart';

import '../../../../core/color.dart';

class RecommendPageBody extends StatefulWidget {
  const RecommendPageBody({super.key});

  @override
  State<RecommendPageBody> createState() => _RecommendPageBodyState();
}

class _RecommendPageBodyState extends State<RecommendPageBody> {
  // bool yoga10 = false;
  // bool yoga20 = false;
  // bool yoga30 = false;

  bool neck = true;
  bool back = false;
  bool waist = false;
  bool pelvis = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: 30),
        Container(
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("현재상태"),
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                child: Container(
                  width: MediaQuery.of(context).size.height * 0.05,
                  height: MediaQuery.of(context).size.width * 0.05,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1),
                    color: kMainColor,
                  ),
                  child: Center(
                    child: Text(
                      "안전",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Text("입니다"),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.grey[200],
            ),
            child: Center(
              child: Text(
                "현재 상태에 대한 설명과 추천이 왜 필요한지에 대한 텍스트",
                style: TextStyle(fontSize: size13),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.6,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Stack(
                      children: [
                        Center(
                          child: SvgPicture.asset(
                            "assets/images/trash/person1.svg",
                            fit: BoxFit.fill,
                          ),
                        ),
                        Positioned(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.33,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.33,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.03),
                                      Spacer(),
                                      InkWell(
                                          onTap: () {
                                            setState(() {
                                              neck = true;
                                              back = false;
                                              waist = false;
                                              pelvis = false;
                                            });
                                          },
                                          child: Icon(
                                              CupertinoIcons.circle_fill,
                                              color: neck
                                                  ? Colors.red
                                                  : kB9Color)),
                                      Spacer(),
                                      InkWell(
                                          onTap: () {
                                            setState(() {
                                              neck = false;
                                              back = true;
                                              waist = false;
                                              pelvis = false;
                                            });
                                          },
                                          child: Icon(
                                              CupertinoIcons.circle_fill,
                                              color: back
                                                  ? Colors.red
                                                  : kB9Color)),
                                      Spacer(),
                                      InkWell(
                                          onTap: () {
                                            setState(() {
                                              neck = false;
                                              back = false;
                                              waist = true;
                                              pelvis = false;
                                            });
                                          },
                                          child: Icon(
                                              CupertinoIcons.circle_fill,
                                              color: waist
                                                  ? Colors.red
                                                  : kB9Color)),
                                      Spacer(),
                                      InkWell(
                                          onTap: () {
                                            setState(() {
                                              neck = false;
                                              back = false;
                                              waist = false;
                                              pelvis = true;
                                            });
                                          },
                                          child: Icon(
                                              CupertinoIcons.circle_fill,
                                              color: pelvis
                                                  ? Colors.red
                                                  : kB9Color)),
                                      Spacer(),
                                    ],
                                  ),
                                ),
                                Container(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: neck
                      ? NeckExercise()
                      : back
                          ? BackExercise()
                          : waist
                              ? WaistExercise()
                              : pelvis
                                  ? PlevisExercise()
                                  : Container(),
                ),
              ],
            ),
          ),
        ),
        //요가 영상
        // YogaComponent(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            children: [
              Text(
                "다른 방법도 알아보고 싶어요 !",
                style: TextStyle(
                  color: Colors.green,
                  fontSize: size13,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Spacer(),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, Move.centerReservationPage);
                    },
                    child: Row(
                      children: [
                        Icon(
                          CupertinoIcons.plus_circle_fill,
                          color: kMainColor,
                        ),
                        Column(
                          children: [
                            Icon(
                              CupertinoIcons.person_solid,
                              color: k59Color,
                              size: 30,
                            ),
                            Text(
                              "센터 예약",
                              style: TextStyle(
                                color: k59Color,
                                fontSize: size13,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 30),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                          context, Move.hospitalReservationPage);
                    },
                    child: Row(
                      children: [
                        Icon(
                          CupertinoIcons.plus_circle_fill,
                          color: kMainColor,
                        ),
                        Column(
                          children: [
                            Icon(
                              Icons.medication_liquid,
                              color: k59Color,
                              size: 30,
                            ),
                            Text(
                              "병원 예약",
                              style: TextStyle(
                                color: k59Color,
                                fontSize: size13,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 30),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Icon(
                          CupertinoIcons.plus_circle_fill,
                          color: kMainColor,
                        ),
                        Column(
                          children: [
                            Icon(
                              Icons.local_hospital,
                              color: k59Color,
                              size: 30,
                            ),
                            Text(
                              "주변 병원",
                              style: TextStyle(
                                color: k59Color,
                                fontSize: size13,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class NeckExercise extends StatelessWidget {
  const NeckExercise({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "목 운동",
            style: TextStyle(
                color: Colors.black,
                fontSize: size15,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.015),
          Container(
            height: MediaQuery.of(context).size.height * 0.55,
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.14,
                    color: Colors.red,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class BackExercise extends StatelessWidget {
  const BackExercise({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "등 운동",
            style: TextStyle(
                color: Colors.black,
                fontSize: size15,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.015),
          Container(
            height: MediaQuery.of(context).size.height * 0.55,
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.14,
                    color: Colors.red,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class WaistExercise extends StatelessWidget {
  const WaistExercise({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "허리 운동",
            style: TextStyle(
                color: Colors.black,
                fontSize: size15,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.015),
          Container(
            height: MediaQuery.of(context).size.height * 0.55,
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.14,
                    color: Colors.red,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class PlevisExercise extends StatelessWidget {
  const PlevisExercise({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "골반 운동",
            style: TextStyle(
                color: Colors.black,
                fontSize: size15,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.015),
          Container(
            height: MediaQuery.of(context).size.height * 0.55,
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.14,
                    color: Colors.red,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
