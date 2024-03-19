import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ptbrofit/core/size.dart';

void customDialog(BuildContext context, String message) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          content: Text(message),
        ),
      );
    },
  );
}

void customSnackbar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Container(
        child: Center(
          child: Text(
            message,
            style: TextStyle(fontSize: size15),
          ),
        ),
      ),
      duration: Duration(seconds: 1),
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height * 0.1,
        left: 16,
        right: 16,
      ),
      behavior: SnackBarBehavior.floating,
    ),
  );
}
