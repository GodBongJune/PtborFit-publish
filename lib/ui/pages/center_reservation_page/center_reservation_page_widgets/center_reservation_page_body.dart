import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ptbrofit/core/color.dart';
import 'package:ptbrofit/core/move.dart';
import 'package:ptbrofit/core/size.dart';

class CenterReservationPageBody extends StatelessWidget {
  const CenterReservationPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, Move.centerReservationDetailPage);
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 0.1,
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/trash/yoga1.jpeg",
                    fit: BoxFit.fill,
                  ),
                  SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "00 요가",
                        style: TextStyle(
                          color: k59Color,
                          fontSize: size15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.02,
                            child: Row(
                              children: [
                                Text(
                                  "영업중",
                                  style: TextStyle(
                                      color: k59Color, fontSize: size13),
                                ),
                                SizedBox(width: 5),
                                Text("04시에 영업 시작",
                                    style: TextStyle(
                                        color: k59Color, fontSize: size13)),
                              ],
                            ),
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Text(
                                "2.3km",
                                style: TextStyle(
                                    color: k59Color, fontSize: size13),
                              ),
                              SizedBox(width: 5),
                              Text("OO OO구 OO동 OOOO",
                                  style: TextStyle(
                                      color: k59Color, fontSize: size13)),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Text(
                        "자세히",
                        style: TextStyle(color: k59Color, fontSize: size13),
                      ),
                      Icon(CupertinoIcons.right_chevron, size: size13),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return Divider();
      },
      itemCount: 10,
    );
  }
}
