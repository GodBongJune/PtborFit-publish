import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ptbrofit/core/color.dart';
import 'package:ptbrofit/core/size.dart';

class JoinSuccessPage extends StatelessWidget {
  const JoinSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(CupertinoIcons.back),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/logo/logo.png"),
            SizedBox(width: 10),
            Text("PTBRO FIT"),
          ],
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
      body: Center(
        child: Column(
          children: [
            Spacer(),
            Icon(CupertinoIcons.check_mark_circled_solid,
                color: kMainColor, size: 100),
            Text(
              "회원가입 완료",
              style: TextStyle(color: k52Color, fontSize: size20),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.075,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: kMainColor,
                  ),
                  child: Center(
                    child: Text(
                      "로그인",
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
      ),
    );
  }
}
