import 'package:flutter/material.dart';
import 'package:ptbrofit/core/color.dart';
import 'package:ptbrofit/core/move.dart';
import 'package:ptbrofit/core/size.dart';

class HospitalReservationDetailPage extends StatelessWidget {
  const HospitalReservationDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("병원 예약"),
      ),
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.3,
            child: Image.asset(
              "assets/images/trash/hospital1.jpeg",
              fit: BoxFit.fill,
            ),
          ),
          Column(
            children: [
              SizedBox(height: 30),
              Text(
                "튼튼 정형외과",
                style: TextStyle(
                  color: k59Color,
                  fontSize: size20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "OO OO구 OO동 OOOO",
                style: TextStyle(color: k59Color, fontSize: size13),
              ),
              SizedBox(height: 30),
            ],
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.only(left: 24.0, top: 8, bottom: 8),
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: Text(
                    "전화",
                    style: TextStyle(
                      color: k59Color,
                      fontSize: size13,
                    ),
                  ),
                ),
                Text(
                  "051-2222-2222",
                  style: TextStyle(
                    color: k59Color,
                    fontSize: size13,
                  ),
                )
              ],
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.only(left: 24.0, top: 8, bottom: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: Text(
                    "진료시간",
                    style: TextStyle(
                      color: k59Color,
                      fontSize: size13,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "오전 10:00 - 오후 18:00",
                      style: TextStyle(
                        color: k59Color,
                        fontSize: size13,
                      ),
                    ),
                    Text(
                      "오후 13:00 - 14:00 휴게시간",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: size13,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Divider(),
          Padding(
            padding:
                const EdgeInsets.only(left: 24.0, top: 8, bottom: 8, right: 24),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: Text(
                    "병원 정보",
                    style: TextStyle(
                      color: k59Color,
                      fontSize: size13,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    "주차, 무선 인터넷, 남/녀 화장실\n구분저희 정형외과에서는 목, 허리, 무릎, 등, 척추, 관절 등을 수술하지 않고 비수술로 치료하고 있습니다. 개인별 맞춤 치료시스템을 통해 통증치료 및 통증의 근본적인 원인을 해결하기 위해 최선을 다하고 있습니다. ",
                    style: TextStyle(
                      color: k59Color,
                      fontSize: size13,
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Center(
                        child: Column(
                          children: [
                            Text(
                              "'OO병원'",
                              style:
                                  TextStyle(color: k59Color, fontSize: size15),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "예약하시겠습니까?",
                              style: TextStyle(
                                color: k59Color,
                                fontSize: size13,
                              ),
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.popAndPushNamed(context,
                                        Move.hospitalReservationSuccessPage);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: kMainColor,
                                    ),
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    child: Center(
                                      child: Text(
                                        "확인",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: size13,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: kA9Color,
                                    ),
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    child: Center(
                                      child: Text(
                                        "취소",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: size13,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.075,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: kMainColor,
                ),
                child: Center(
                  child: Text(
                    "예약하기",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: size15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
