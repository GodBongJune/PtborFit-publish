import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ptbrofit/core/color.dart';
import 'package:ptbrofit/core/size.dart';

class CenterReservationSuccessPage extends StatelessWidget {
  const CenterReservationSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("센터 예약"),
      ),
      body: Column(
        children: [
          Spacer(),
          Column(
            children: [
              Icon(CupertinoIcons.check_mark_circled_solid,
                  color: kMainColor, size: 100),
              Text(
                "예약 완료",
                style: TextStyle(color: k59Color, fontSize: size20),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  "예약 신청확인은 내 정보에서 확인하고 일정표에 기록해 건강을 체크해보세요!",
                  style: TextStyle(color: k59Color, fontSize: size15),
                ),
              ),
            ],
          ),
          Spacer(),
          Container(
            height: MediaQuery.of(context).size.height * 0.08,
          ),
        ],
      ),
    );
  }
}
