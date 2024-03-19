import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ptbrofit/core/size.dart';
import 'package:ptbrofit/ui/pages/auth/login_page/login_page_widgets/login_page_body.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
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
      body: LoginPageBody(),
    );
  }
}
