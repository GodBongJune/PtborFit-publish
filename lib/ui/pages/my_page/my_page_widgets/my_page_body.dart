import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ptbrofit/core/size.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../core/color.dart';

class MyPageBody extends StatefulWidget {
  const MyPageBody({Key? key}) : super(key: key);

  @override
  State<MyPageBody> createState() => _MyPageBodyState();
}

class _MyPageBodyState extends State<MyPageBody> {
  GlobalKey<_MyPageBodyState> myPageKey = GlobalKey<_MyPageBodyState>();

  List<String> youtubeIds = [
    "4AoFA19gbLo",
    "ceMsPBbcEGg",
    "8sAyPDLorek",
    "xWV71C2kp38",
  ];

  List<YoutubePlayerController> _controllers = [];

  @override
  void initState() {
    super.initState();
    _controllers = youtubeIds.map((id) {
      return YoutubePlayerController(
        initialVideoId: id,
        flags: YoutubePlayerFlags(autoPlay: false),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Stack(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.3,
              color: kE8Color,
            ),
            Positioned(
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(
                        "assets/images/trash/defaultpic.png",
                      ),
                      radius: 35,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text("피티브로 님",
                          style: TextStyle(color: k59Color, fontSize: size20)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "예약내역",
                style: TextStyle(color: k59Color, fontSize: size13),
              ),
            ],
          ),
        ),
        Divider(color: kDDColor),
        Column(
          children: [
            SizedBox(height: 20),
            Text(
              "OO병원 OO월 OO일 오후 OO시 OO분",
              style: TextStyle(
                color: k59Color,
                fontSize: size15,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "에약되어있습니다",
              style: TextStyle(
                color: Colors.green,
                fontSize: size13,
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
        Divider(color: kDDColor),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "최근 시청한 영상",
                style: TextStyle(color: k59Color, fontSize: size13),
              ),
            ],
          ),
        ),
        Divider(color: kDDColor),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 16.0,
            childAspectRatio: 1.5 / 1.2,
          ),
          itemCount: youtubeIds.length,
          itemBuilder: (context, index) {
            return YoutubePlayer(
              controller: _controllers[index],
            );
          },
        ),
      ],
    );
  }
}
