import 'package:flutter/material.dart';
import 'package:ptbrofit/core/color.dart';
import 'package:ptbrofit/core/size.dart';

MaterialColor primaryWhite = MaterialColor(
  0xFFFFFFFF,
  <int, Color>{
    50: Color(0xFFFFFFFF),
    100: Color(0xFFFFFFFF),
    200: Color(0xFFFFFFFF),
    300: Color(0xFFFFFFFF),
    400: Color(0xFFFFFFFF),
    500: Color(0xFFFFFFFF),
    600: Color(0xFFFFFFFF),
    700: Color(0xFFFFFFFF),
    800: Color(0xFFFFFFFF),
    900: Color(0xFFFFFFFF),
  },
);
ThemeData theme() {
  return ThemeData(
    appBarTheme: appBarTheme(),
    primarySwatch: primaryWhite,
    scaffoldBackgroundColor: primaryWhite,
    textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.black),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    titleTextStyle: TextStyle(
      fontSize: size15,
      fontWeight: FontWeight.bold,
      color: k3DColor,
    ),
    centerTitle: true,
    elevation: 0,
  );
}
