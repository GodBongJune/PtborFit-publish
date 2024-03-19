import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ptbrofit/ui/pages/calendar_page/calendar_page_widgets/calendar_page_body.dart';

import '../../../core/color.dart';
import '../../../core/move.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

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
      body: CalendarPageBody(),
    );
  }
}
