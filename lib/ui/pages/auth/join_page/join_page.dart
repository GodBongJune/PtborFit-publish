import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ptbrofit/core/size.dart';
import 'package:ptbrofit/ui/pages/auth/join_page/join_page_widgets/join_page_body.dart';

class JoinPage extends StatelessWidget {
  const JoinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(CupertinoIcons.back),
        ),
        title: SvgPicture.asset(
          "assets/images/logo/appbarLogo.svg",
          fit: BoxFit.fill,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(CupertinoIcons.person),
                Text("LOGIN", style: TextStyle(fontSize: size10)),
              ],
            ),
          )
        ],
      ),
      body: JoinPageBody(),
    );
  }
}
