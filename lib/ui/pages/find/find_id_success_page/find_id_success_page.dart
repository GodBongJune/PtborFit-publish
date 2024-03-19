import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ptbrofit/ui/pages/find/find_id_success_page/find_id_success_page_widgets/find_id_success_page_body.dart';

class FindIdSuccessPage extends StatelessWidget {
  const FindIdSuccessPage({super.key});

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
      ),
      body: FindIdSuccessPageBody(),
    );
  }
}
