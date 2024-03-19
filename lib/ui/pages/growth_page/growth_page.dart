import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ptbrofit/core/color.dart';
import 'package:ptbrofit/ui/pages/growth_page/growth_page_remake/growth_page_body_neck.dart';
import 'package:ptbrofit/ui/pages/growth_page/growth_page_remake/growth_page_total_score.dart';
import 'package:ptbrofit/ui/pages/growth_page/growth_page_widgets/growth_page_body.dart';

import '../../../core/move.dart';
import '../../../core/size.dart';

class GrowthPage extends StatelessWidget {
  const GrowthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
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
      // body: GrowthPageBody(),
      body: GrowthPageTotalScore(),
    );
  }
}
