import 'package:carousel_slider/carousel_slider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:ptbrofit/core/color.dart';
import 'package:ptbrofit/core/size.dart';

class GrowthPageBodyNeck extends StatelessWidget {
  const GrowthPageBodyNeck({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "OOO님의 부위 건강",
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
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Container(
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
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            "08.13",
            style: TextStyle(
              color: k90Color,
              fontSize: size15,
            ),
          ),
          SizedBox(height: 20),
          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/trash/ruler.png",
                  ),
                  SizedBox(width: 10),
                  Text(
                    "좌 : ",
                    style: TextStyle(color: kMainColor),
                  ),
                  Text("0"),
                  SizedBox(width: 10),
                  Text(
                    "우 : ",
                    style: TextStyle(color: kMainColor),
                  ),
                  Text("0"),
                  SizedBox(width: 10),
                  Text(
                    "뒤틀림 : ",
                    style: TextStyle(color: kMainColor),
                  ),
                  Text("0"),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
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
                        color: kMainColor),
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
          SizedBox(height: 30),
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            height: MediaQuery.of(context).size.height * 0.05,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: kMainColor,
            ),
            child: Center(
              child: Text(
                "일주일 각도 변화 그래프",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Stack(
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
    );
  }
}
