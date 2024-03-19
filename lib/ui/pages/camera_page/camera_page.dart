import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ptbrofit/core/move.dart';
import 'package:ptbrofit/ui/pages/camera_page/camera_page_widgets/camera_page_body.dart';

import '../../../core/color.dart';

class CameraPage extends StatelessWidget {
  final Function(int) onNavigateToPage;

  const CameraPage({super.key, required this.onNavigateToPage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: SvgPicture.asset(
          "assets/images/logo/appbarLogo.svg",
          fit: BoxFit.fill,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.popAndPushNamed(context, Move.loginPage);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(CupertinoIcons.person_fill, color: kA9Color),
                      Text(
                        "LOG OUT",
                        style: TextStyle(
                          color: kD9Color,
                          fontSize: 8,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: CameraPageBody(
        onNavigateToPage: (index) {
          onNavigateToPage(index);
        },
      ),
    );
  }
}
