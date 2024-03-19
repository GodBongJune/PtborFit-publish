import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logger/logger.dart';
import 'package:ptbrofit/core/color.dart';
import 'package:ptbrofit/core/size.dart';
import 'package:ptbrofit/ui/pages/growth_page/growth_page_remake/growth_page_body_neck.dart';

class GrowthPageTotalScore extends StatefulWidget {
  const GrowthPageTotalScore({super.key});

  @override
  State<GrowthPageTotalScore> createState() => _GrowthPageTotalScoreState();
}

class _GrowthPageTotalScoreState extends State<GrowthPageTotalScore> {
  bool total = true;
  bool neck = false;
  bool waist = false;
  bool pelvis = false;
  bool back1 = false;
  bool back2 = false;
  bool back3 = false;

  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        controller: _scrollController,
        children: [
          //총 점수
          if (total)
            Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.height * 0.15,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: k59Color,
                      )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "나의 총 점수",
                        style: TextStyle(
                          color: k59Color,
                          fontSize: size15,
                        ),
                      ),
                      Text(
                        "86",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: k59Color,
                          fontSize: size40,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2), // 그림자 색상
                        spreadRadius: 2, // 그림자 확장 범위
                        blurRadius: 10, // 블러 효과
                        offset: Offset(0, 6), // x, y 축 오프셋
                      ),
                    ],
                  ),
                  child: SvgPicture.asset("assets/images/growth/total.svg",
                      fit: BoxFit.cover),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.15,
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: kD9Color,
                        ),
                        child: Center(
                          child: Text(
                            "이전",
                            style: TextStyle(color: k90Color),
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        setState(() {
                          total = false;
                          neck = true;
                          waist = false;

                          _scrollController.animateTo(0,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeInOut);
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.15,
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: kMainColor,
                        ),
                        child: Center(
                          child: Text(
                            "다음",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          //목
          if (neck)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "OOO님의 목 건강",
                        style: TextStyle(
                          color: k59Color,
                          fontWeight: FontWeight.bold,
                          fontSize: size25,
                        ),
                      ),
                      Text(
                        "촬영하여 분석된 결과를 확인해 보세요.",
                        style: TextStyle(
                          color: k90Color,
                          fontSize: size15,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                //부위 사진과상태
                Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2), // 그림자 색상
                            spreadRadius: 2, // 그림자 확장 범위
                            blurRadius: 10, // 블러 효과
                            offset: Offset(0, 6), // x, y 축 오프셋
                          ),
                        ],
                      ),
                      child: SvgPicture.asset("assets/images/growth/neck.svg",
                          fit: BoxFit.fill),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    SingleChildScrollView(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.18,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2), // 그림자 색상
                              spreadRadius: 2, // 그림자 확장 범위
                              blurRadius: 10, // 블러 효과
                              offset: Offset(0, 6), // x, y 축 오프셋
                            ),
                          ],
                        ),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                SizedBox(height: 10),
                                Text(
                                  "나의 건강 상태는..",
                                  style: TextStyle(
                                      color: k90Color, fontSize: size15),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "안전",
                                  style: TextStyle(
                                    color: kMainColor,
                                    fontSize: size20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "목이 건강하다는 것은 통증이나 불편감 없이 자유롭게 움직일 수 있다는 뜻입니다. 목은 우리 일상 생활에서 매우 중요한부위이므로 건강한 상태를 유지하는 것이 중요합니다.",
                                  style: TextStyle(
                                    color: k59Color,
                                    fontSize: size15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                //각도 변화 기록
                Column(
                  children: [
                    Text("각도 변화 기록",
                        style: TextStyle(
                            color: k59Color,
                            fontSize: size20,
                            fontWeight: FontWeight.bold)),
                    Text(
                      "2024년 2월 18~24일",
                      style: TextStyle(
                        color: k90Color,
                        fontSize: size15,
                      ),
                    ),
                    Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.3,
                          child: SvgPicture.asset(
                            "assets/images/growth/graph.svg",
                            fit: BoxFit.fill,
                          ),
                        ),
                        Positioned(
                          // top: -MediaQuery.of(context).size.height * 0.035,
                          child: Container(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.3,
                            child: LineChart(
                              LineChartData(
                                gridData: FlGridData(
                                  show: false,
                                ),
                                borderData: FlBorderData(
                                  show: true,
                                  border: Border.all(color: Colors.transparent),
                                ),
                                minX: 0,
                                maxX: 9,
                                minY: 0,
                                maxY: 7,
                                lineBarsData: [
                                  LineChartBarData(
                                    spots: [
                                      FlSpot(1, 6),
                                      FlSpot(2, 5),
                                      FlSpot(3, 4),
                                      FlSpot(4, 3),
                                      FlSpot(5, 4.1),
                                      FlSpot(6, 4.9),
                                      FlSpot(7, 4),
                                    ],
                                    isCurved: false,
                                    color: Colors.white,
                                    barWidth: 3,
                                    dotData: FlDotData(
                                      show: true,
                                      getDotPainter:
                                          (spot, percent, barData, index) {
                                        return FlDotCirclePainter(
                                          radius: 6,
                                          color: determineDotColor(spot),
                                        );
                                      },
                                    ), // isStrokeCapRound: true,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          total = true;
                          neck = false;
                          waist = false;

                          _scrollController.animateTo(0,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeInOut);
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.15,
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: kD9Color,
                        ),
                        child: Center(
                          child: Text(
                            "이전",
                            style: TextStyle(color: k90Color),
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        setState(() {
                          total = false;
                          neck = false;
                          waist = true;

                          _scrollController.animateTo(0,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeInOut);
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.15,
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: kMainColor,
                        ),
                        child: Center(
                          child: Text(
                            "다음",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // Container(
                //   width: double.infinity,
                //   height: MediaQuery.of(context).size.height * 0.3,
                //   child: LineChart(
                //     LineChartData(
                //       borderData: FlBorderData(
                //         show: true,
                //         border: Border.all(color: kMainColor),
                //       ),
                //       minX: 0,
                //       maxX: 9,
                //       minY: 0,
                //       maxY: 7,
                //       lineBarsData: [
                //         LineChartBarData(
                //           spots: [
                //             FlSpot(1, 6),
                //             FlSpot(2, 5),
                //             FlSpot(3, 4),
                //             FlSpot(4, 3),
                //             FlSpot(5, 4.1),
                //             FlSpot(6, 4.9),
                //             FlSpot(7, 4),
                //           ],
                //           isCurved: false,
                //           color: Colors.black,
                //           barWidth: 3,
                //           // isStrokeCapRound: true,
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                SizedBox(height: 30),
              ],
            ),
          //허리
          if (waist)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "OOO님의 허리 건강",
                        style: TextStyle(
                          color: k59Color,
                          fontWeight: FontWeight.bold,
                          fontSize: size25,
                        ),
                      ),
                      Text(
                        "촬영하여 분석된 결과를 확인해 보세요.",
                        style: TextStyle(
                          color: k90Color,
                          fontSize: size15,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                //부위 사진과상태
                Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2), // 그림자 색상
                            spreadRadius: 2, // 그림자 확장 범위
                            blurRadius: 10, // 블러 효과
                            offset: Offset(0, 6), // x, y 축 오프셋
                          ),
                        ],
                      ),
                      child: SvgPicture.asset("assets/images/growth/waist.svg",
                          fit: BoxFit.fill),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    SingleChildScrollView(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.18,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2), // 그림자 색상
                              spreadRadius: 2, // 그림자 확장 범위
                              blurRadius: 10, // 블러 효과
                              offset: Offset(0, 6), // x, y 축 오프셋
                            ),
                          ],
                        ),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                SizedBox(height: 10),
                                Text(
                                  "나의 건강 상태는..",
                                  style: TextStyle(
                                      color: k90Color, fontSize: size15),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "안전",
                                  style: TextStyle(
                                    color: kMainColor,
                                    fontSize: size20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "허리는 몸의 중심에서 움직임을 조정하고 지지하는 역할을 합니다.  걷기, 서기, 앉기, 운동 등 일상 생활의 거의 모든 동작에 허리가 관여합니다. 허리가 제대로 기능하지 않으면 우리의 움직임과 균형에 지장을 줄 수 있습니다.",
                                  style: TextStyle(
                                    color: k59Color,
                                    fontSize: size15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                //각도 변화 기록
                Column(
                  children: [
                    Text("각도 변화 기록",
                        style: TextStyle(
                            color: k59Color,
                            fontSize: size20,
                            fontWeight: FontWeight.bold)),
                    Text(
                      "2024년 2월 18~24일",
                      style: TextStyle(
                        color: k90Color,
                        fontSize: size15,
                      ),
                    ),
                    Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.3,
                          child: Image.asset(
                            "assets/images/trash/graph.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                        Positioned(
                          child: Container(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.3,
                            child: LineChart(
                              LineChartData(
                                borderData: FlBorderData(
                                  show: true,
                                  border: Border.all(color: kMainColor),
                                ),
                                minX: 0,
                                maxX: 9,
                                minY: 0,
                                maxY: 7,
                                lineBarsData: [
                                  LineChartBarData(
                                    spots: [
                                      FlSpot(1, 6),
                                      FlSpot(2, 5),
                                      FlSpot(3, 4),
                                      FlSpot(4, 3),
                                      FlSpot(5, 4.1),
                                      FlSpot(6, 4.9),
                                      FlSpot(7, 4),
                                    ],
                                    isCurved: false,
                                    color: Colors.black,
                                    barWidth: 3,
                                    // isStrokeCapRound: true,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          total = false;
                          neck = true;
                          waist = false;

                          _scrollController.animateTo(0,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeInOut);
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.15,
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: kD9Color,
                        ),
                        child: Center(
                          child: Text(
                            "이전",
                            style: TextStyle(color: k90Color),
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        setState(() {
                          total = false;
                          neck = false;
                          waist = false;
                          pelvis = true;

                          _scrollController.animateTo(0,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeInOut);
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.15,
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: kMainColor,
                        ),
                        child: Center(
                          child: Text(
                            "다음",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // Container(
                //   width: double.infinity,
                //   height: MediaQuery.of(context).size.height * 0.3,
                //   child: LineChart(
                //     LineChartData(
                //       borderData: FlBorderData(
                //         show: true,
                //         border: Border.all(color: kMainColor),
                //       ),
                //       minX: 0,
                //       maxX: 9,
                //       minY: 0,
                //       maxY: 7,
                //       lineBarsData: [
                //         LineChartBarData(
                //           spots: [
                //             FlSpot(1, 6),
                //             FlSpot(2, 5),
                //             FlSpot(3, 4),
                //             FlSpot(4, 3),
                //             FlSpot(5, 4.1),
                //             FlSpot(6, 4.9),
                //             FlSpot(7, 4),
                //           ],
                //           isCurved: false,
                //           color: Colors.black,
                //           barWidth: 3,
                //           // isStrokeCapRound: true,
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                SizedBox(height: 30),
              ],
            ),
          //골반
          if (pelvis)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "OOO님의 골반 건강",
                        style: TextStyle(
                          color: k59Color,
                          fontWeight: FontWeight.bold,
                          fontSize: size25,
                        ),
                      ),
                      Text(
                        "촬영하여 분석된 결과를 확인해 보세요.",
                        style: TextStyle(
                          color: k90Color,
                          fontSize: size15,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                //부위 사진과상태
                Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2), // 그림자 색상
                            spreadRadius: 2, // 그림자 확장 범위
                            blurRadius: 10, // 블러 효과
                            offset: Offset(0, 6), // x, y 축 오프셋
                          ),
                        ],
                      ),
                      child: SvgPicture.asset("assets/images/growth/pelvis.svg",
                          fit: BoxFit.fill),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    SingleChildScrollView(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.18,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2), // 그림자 색상
                              spreadRadius: 2, // 그림자 확장 범위
                              blurRadius: 10, // 블러 효과
                              offset: Offset(0, 6), // x, y 축 오프셋
                            ),
                          ],
                        ),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                SizedBox(height: 10),
                                Text(
                                  "나의 건강 상태는..",
                                  style: TextStyle(
                                      color: k90Color, fontSize: size15),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "안전",
                                  style: TextStyle(
                                    color: kMainColor,
                                    fontSize: size20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "몸의 안정을 유지하는 데 가장 중요한 역할을 하는 것은 척추인데, 그것이 서 있는 발판은 골반이다. 골반은 우리 일상 생활에서 매우 중요한  부위이므로 건강한 상태를 유지하는 것이 중요합니다.",
                                  style: TextStyle(
                                    color: k59Color,
                                    fontSize: size15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                //각도 변화 기록
                Column(
                  children: [
                    Text("각도 변화 기록",
                        style: TextStyle(
                            color: k59Color,
                            fontSize: size20,
                            fontWeight: FontWeight.bold)),
                    Text(
                      "2024년 2월 18~24일",
                      style: TextStyle(
                        color: k90Color,
                        fontSize: size15,
                      ),
                    ),
                    Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.3,
                          child: Image.asset(
                            "assets/images/trash/graph.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                        Positioned(
                          child: Container(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.3,
                            child: LineChart(
                              LineChartData(
                                borderData: FlBorderData(
                                  show: true,
                                  border: Border.all(color: kMainColor),
                                ),
                                minX: 0,
                                maxX: 9,
                                minY: 0,
                                maxY: 7,
                                lineBarsData: [
                                  LineChartBarData(
                                    spots: [
                                      FlSpot(1, 6),
                                      FlSpot(2, 5),
                                      FlSpot(3, 4),
                                      FlSpot(4, 3),
                                      FlSpot(5, 4.1),
                                      FlSpot(6, 4.9),
                                      FlSpot(7, 4),
                                    ],
                                    isCurved: false,
                                    color: Colors.black,
                                    barWidth: 3,
                                    // isStrokeCapRound: true,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          total = false;
                          neck = false;
                          waist = true;
                          pelvis = false;

                          _scrollController.animateTo(0,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeInOut);
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.15,
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: kD9Color,
                        ),
                        child: Center(
                          child: Text(
                            "이전",
                            style: TextStyle(color: k90Color),
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        setState(() {
                          total = false;
                          neck = false;
                          waist = false;
                          pelvis = false;
                          back1 = true;

                          _scrollController.animateTo(0,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeInOut);
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.15,
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: kMainColor,
                        ),
                        child: Center(
                          child: Text(
                            "다음",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // Container(
                //   width: double.infinity,
                //   height: MediaQuery.of(context).size.height * 0.3,
                //   child: LineChart(
                //     LineChartData(
                //       borderData: FlBorderData(
                //         show: true,
                //         border: Border.all(color: kMainColor),
                //       ),
                //       minX: 0,
                //       maxX: 9,
                //       minY: 0,
                //       maxY: 7,
                //       lineBarsData: [
                //         LineChartBarData(
                //           spots: [
                //             FlSpot(1, 6),
                //             FlSpot(2, 5),
                //             FlSpot(3, 4),
                //             FlSpot(4, 3),
                //             FlSpot(5, 4.1),
                //             FlSpot(6, 4.9),
                //             FlSpot(7, 4),
                //           ],
                //           isCurved: false,
                //           color: Colors.black,
                //           barWidth: 3,
                //           // isStrokeCapRound: true,
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                SizedBox(height: 30),
              ],
            ),
          //뒷모습1 (양팔 벌어짐)
          if (back1)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "OOO님의 좌우 균형",
                        style: TextStyle(
                          color: k59Color,
                          fontWeight: FontWeight.bold,
                          fontSize: size25,
                        ),
                      ),
                      Text(
                        "촬영하여 분석된 결과를 확인해 보세요.",
                        style: TextStyle(
                          color: k90Color,
                          fontSize: size15,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                //부위 사진과상태
                Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2), // 그림자 색상
                            spreadRadius: 2, // 그림자 확장 범위
                            blurRadius: 10, // 블러 효과
                            offset: Offset(0, 6), // x, y 축 오프셋
                          ),
                        ],
                      ),
                      child: SvgPicture.asset("assets/images/growth/back1.svg",
                          fit: BoxFit.fill),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    SingleChildScrollView(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.18,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2), // 그림자 색상
                              spreadRadius: 2, // 그림자 확장 범위
                              blurRadius: 10, // 블러 효과
                              offset: Offset(0, 6), // x, y 축 오프셋
                            ),
                          ],
                        ),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                SizedBox(height: 10),
                                Text(
                                  "나의 건강 상태는..",
                                  style: TextStyle(
                                      color: k90Color, fontSize: size15),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "안전",
                                  style: TextStyle(
                                    color: kMainColor,
                                    fontSize: size20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "허리는 몸의 중심에서 움직임을 조정하고 지지하는 역할을 합니다.  걷기, 서기, 앉기, 운동 등 일상 생활의 거의 모든 동작에 허리가 관여합니다. 허리가 제대로 기능하지 않으면 우리의 움직임과 균형에 지장을 줄 수 있습니다.",
                                  style: TextStyle(
                                    color: k59Color,
                                    fontSize: size15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                //각도 변화 기록
                Column(
                  children: [
                    Text("각도 변화 기록",
                        style: TextStyle(
                            color: k59Color,
                            fontSize: size20,
                            fontWeight: FontWeight.bold)),
                    Text(
                      "2024년 2월 18~24일",
                      style: TextStyle(
                        color: k90Color,
                        fontSize: size15,
                      ),
                    ),
                    Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.3,
                          child: Image.asset(
                            "assets/images/trash/graph.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                        Positioned(
                          child: Container(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.3,
                            child: LineChart(
                              LineChartData(
                                borderData: FlBorderData(
                                  show: true,
                                  border: Border.all(color: kMainColor),
                                ),
                                minX: 0,
                                maxX: 9,
                                minY: 0,
                                maxY: 7,
                                lineBarsData: [
                                  LineChartBarData(
                                    spots: [
                                      FlSpot(1, 6),
                                      FlSpot(2, 5),
                                      FlSpot(3, 4),
                                      FlSpot(4, 3),
                                      FlSpot(5, 4.1),
                                      FlSpot(6, 4.9),
                                      FlSpot(7, 4),
                                    ],
                                    isCurved: false,
                                    color: Colors.black,
                                    barWidth: 3,
                                    // isStrokeCapRound: true,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          total = false;
                          neck = false;
                          waist = false;
                          pelvis = true;
                          back1 = false;

                          _scrollController.animateTo(0,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeInOut);
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.15,
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: kD9Color,
                        ),
                        child: Center(
                          child: Text(
                            "이전",
                            style: TextStyle(color: k90Color),
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        setState(() {
                          total = false;
                          neck = false;
                          waist = false;
                          pelvis = false;
                          back1 = false;
                          back2 = true;

                          _scrollController.animateTo(0,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeInOut);
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.15,
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: kMainColor,
                        ),
                        child: Center(
                          child: Text(
                            "다음",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // Container(
                //   width: double.infinity,
                //   height: MediaQuery.of(context).size.height * 0.3,
                //   child: LineChart(
                //     LineChartData(
                //       borderData: FlBorderData(
                //         show: true,
                //         border: Border.all(color: kMainColor),
                //       ),
                //       minX: 0,
                //       maxX: 9,
                //       minY: 0,
                //       maxY: 7,
                //       lineBarsData: [
                //         LineChartBarData(
                //           spots: [
                //             FlSpot(1, 6),
                //             FlSpot(2, 5),
                //             FlSpot(3, 4),
                //             FlSpot(4, 3),
                //             FlSpot(5, 4.1),
                //             FlSpot(6, 4.9),
                //             FlSpot(7, 4),
                //           ],
                //           isCurved: false,
                //           color: Colors.black,
                //           barWidth: 3,
                //           // isStrokeCapRound: true,
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                SizedBox(height: 30),
              ],
            ),
          //뒷모습2 (골반? 벌어짐)
          if (back2)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "OOO님의 좌우 균형",
                        style: TextStyle(
                          color: k59Color,
                          fontWeight: FontWeight.bold,
                          fontSize: size25,
                        ),
                      ),
                      Text(
                        "촬영하여 분석된 결과를 확인해 보세요.",
                        style: TextStyle(
                          color: k90Color,
                          fontSize: size15,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                //부위 사진과상태
                Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2), // 그림자 색상
                            spreadRadius: 2, // 그림자 확장 범위
                            blurRadius: 10, // 블러 효과
                            offset: Offset(0, 6), // x, y 축 오프셋
                          ),
                        ],
                      ),
                      child: SvgPicture.asset("assets/images/growth/back2.svg",
                          fit: BoxFit.fill),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    SingleChildScrollView(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.18,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2), // 그림자 색상
                              spreadRadius: 2, // 그림자 확장 범위
                              blurRadius: 10, // 블러 효과
                              offset: Offset(0, 6), // x, y 축 오프셋
                            ),
                          ],
                        ),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                SizedBox(height: 10),
                                Text(
                                  "나의 건강 상태는..",
                                  style: TextStyle(
                                      color: k90Color, fontSize: size15),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "안전",
                                  style: TextStyle(
                                    color: kMainColor,
                                    fontSize: size20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "허리는 몸의 중심에서 움직임을 조정하고 지지하는 역할을 합니다.  걷기, 서기, 앉기, 운동 등 일상 생활의 거의 모든 동작에 허리가 관여합니다. 허리가 제대로 기능하지 않으면 우리의 움직임과 균형에 지장을 줄 수 있습니다.",
                                  style: TextStyle(
                                    color: k59Color,
                                    fontSize: size15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                //각도 변화 기록
                Column(
                  children: [
                    Text("각도 변화 기록",
                        style: TextStyle(
                            color: k59Color,
                            fontSize: size20,
                            fontWeight: FontWeight.bold)),
                    Text(
                      "2024년 2월 18~24일",
                      style: TextStyle(
                        color: k90Color,
                        fontSize: size15,
                      ),
                    ),
                    Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.3,
                          child: Image.asset(
                            "assets/images/trash/graph.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                        Positioned(
                          child: Container(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.3,
                            child: LineChart(
                              LineChartData(
                                borderData: FlBorderData(
                                  show: true,
                                  border: Border.all(color: kMainColor),
                                ),
                                minX: 0,
                                maxX: 9,
                                minY: 0,
                                maxY: 7,
                                lineBarsData: [
                                  LineChartBarData(
                                    spots: [
                                      FlSpot(1, 6),
                                      FlSpot(2, 5),
                                      FlSpot(3, 4),
                                      FlSpot(4, 3),
                                      FlSpot(5, 4.1),
                                      FlSpot(6, 4.9),
                                      FlSpot(7, 4),
                                    ],
                                    isCurved: false,
                                    color: Colors.black,
                                    barWidth: 3,
                                    // isStrokeCapRound: true,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          total = false;
                          neck = false;
                          waist = false;
                          pelvis = false;
                          back1 = true;
                          back2 = false;

                          _scrollController.animateTo(0,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeInOut);
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.15,
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: kD9Color,
                        ),
                        child: Center(
                          child: Text(
                            "이전",
                            style: TextStyle(color: k90Color),
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        setState(() {
                          total = false;
                          neck = false;
                          waist = false;
                          pelvis = false;
                          back1 = false;
                          back2 = false;
                          back3 = true;

                          _scrollController.animateTo(0,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeInOut);
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.15,
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: kMainColor,
                        ),
                        child: Center(
                          child: Text(
                            "다음",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // Container(
                //   width: double.infinity,
                //   height: MediaQuery.of(context).size.height * 0.3,
                //   child: LineChart(
                //     LineChartData(
                //       borderData: FlBorderData(
                //         show: true,
                //         border: Border.all(color: kMainColor),
                //       ),
                //       minX: 0,
                //       maxX: 9,
                //       minY: 0,
                //       maxY: 7,
                //       lineBarsData: [
                //         LineChartBarData(
                //           spots: [
                //             FlSpot(1, 6),
                //             FlSpot(2, 5),
                //             FlSpot(3, 4),
                //             FlSpot(4, 3),
                //             FlSpot(5, 4.1),
                //             FlSpot(6, 4.9),
                //             FlSpot(7, 4),
                //           ],
                //           isCurved: false,
                //           color: Colors.black,
                //           barWidth: 3,
                //           // isStrokeCapRound: true,
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                SizedBox(height: 30),
              ],
            ),
          //뒷모습3 (어깨 양쪽 높이)
          if (back3)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "OOO님의 좌우 균형",
                        style: TextStyle(
                          color: k59Color,
                          fontWeight: FontWeight.bold,
                          fontSize: size25,
                        ),
                      ),
                      Text(
                        "촬영하여 분석된 결과를 확인해 보세요.",
                        style: TextStyle(
                          color: k90Color,
                          fontSize: size15,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                //부위 사진과상태
                Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2), // 그림자 색상
                            spreadRadius: 2, // 그림자 확장 범위
                            blurRadius: 10, // 블러 효과
                            offset: Offset(0, 6), // x, y 축 오프셋
                          ),
                        ],
                      ),
                      child: SvgPicture.asset("assets/images/growth/back3.svg",
                          fit: BoxFit.fill),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    SingleChildScrollView(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.18,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2), // 그림자 색상
                              spreadRadius: 2, // 그림자 확장 범위
                              blurRadius: 10, // 블러 효과
                              offset: Offset(0, 6), // x, y 축 오프셋
                            ),
                          ],
                        ),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                SizedBox(height: 10),
                                Text(
                                  "나의 건강 상태는..",
                                  style: TextStyle(
                                      color: k90Color, fontSize: size15),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "안전",
                                  style: TextStyle(
                                    color: kMainColor,
                                    fontSize: size20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "몸의 안정을 유지하는 데 가장 중요한 역할을 하는 것은 척추인데, 그것이 서 있는 발판은 골반이다. 골반은 우리 일상 생활에서 매우 중요한  부위이므로 건강한 상태를 유지하는 것이 중요합니다.",
                                  style: TextStyle(
                                    color: k59Color,
                                    fontSize: size15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                //각도 변화 기록
                Column(
                  children: [
                    Text("각도 변화 기록",
                        style: TextStyle(
                            color: k59Color,
                            fontSize: size20,
                            fontWeight: FontWeight.bold)),
                    Text(
                      "2024년 2월 18~24일",
                      style: TextStyle(
                        color: k90Color,
                        fontSize: size15,
                      ),
                    ),
                    Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.3,
                          child: Image.asset(
                            "assets/images/trash/graph.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                        Positioned(
                          child: Container(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.3,
                            child: LineChart(
                              LineChartData(
                                borderData: FlBorderData(
                                  show: true,
                                  border: Border.all(color: kMainColor),
                                ),
                                minX: 0,
                                maxX: 9,
                                minY: 0,
                                maxY: 7,
                                lineBarsData: [
                                  LineChartBarData(
                                    spots: [
                                      FlSpot(1, 6),
                                      FlSpot(2, 5),
                                      FlSpot(3, 4),
                                      FlSpot(4, 3),
                                      FlSpot(5, 4.1),
                                      FlSpot(6, 4.9),
                                      FlSpot(7, 4),
                                    ],
                                    isCurved: false,
                                    color: Colors.black,
                                    barWidth: 3,
                                    // isStrokeCapRound: true,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          total = false;
                          neck = false;
                          waist = false;
                          pelvis = false;
                          back1 = false;
                          back2 = true;
                          back3 = false;

                          _scrollController.animateTo(0,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeInOut);
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.15,
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: kD9Color,
                        ),
                        child: Center(
                          child: Text(
                            "이전",
                            style: TextStyle(color: k90Color),
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.15,
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: kMainColor,
                        ),
                        child: Center(
                          child: Text(
                            "다음",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // Container(
                //   width: double.infinity,
                //   height: MediaQuery.of(context).size.height * 0.3,
                //   child: LineChart(
                //     LineChartData(
                //       borderData: FlBorderData(
                //         show: true,
                //         border: Border.all(color: kMainColor),
                //       ),
                //       minX: 0,
                //       maxX: 9,
                //       minY: 0,
                //       maxY: 7,
                //       lineBarsData: [
                //         LineChartBarData(
                //           spots: [
                //             FlSpot(1, 6),
                //             FlSpot(2, 5),
                //             FlSpot(3, 4),
                //             FlSpot(4, 3),
                //             FlSpot(5, 4.1),
                //             FlSpot(6, 4.9),
                //             FlSpot(7, 4),
                //           ],
                //           isCurved: false,
                //           color: Colors.black,
                //           barWidth: 3,
                //           // isStrokeCapRound: true,
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                SizedBox(height: 30),
              ],
            ),
        ],
      ),
    );
  }

  Color determineDotColor(FlSpot spot) {
    // 데이터 포인트의 값에 따라 색상을 결정하는 로직
    if (spot.y > 5) {
      return Colors.red; // 데이터 포인트의 y 값이 5보다 크면 빨간색
    } else if (spot.y > 3) {
      return Colors.orange; // 데이터 포인트의 y 값이 3보다 크면 주황색
    } else {
      return Colors.green; // 그 외의 경우 초록색
    }
  }
}
