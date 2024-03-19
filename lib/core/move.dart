import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:ptbrofit/ui/pages/auth/join_page/join_page.dart';
import 'package:ptbrofit/ui/pages/auth/join_page/join_page_widgets/join_page_success.dart';
import 'package:ptbrofit/ui/pages/auth/login_page/login_page.dart';
import 'package:ptbrofit/ui/pages/find/find_id_page/find_id_page.dart';
import 'package:ptbrofit/ui/pages/find/find_id_success_page/find_id_success_page.dart';
import 'package:ptbrofit/ui/pages/find/find_pw_change_page/find_pw_change_page.dart';
import 'package:ptbrofit/ui/pages/find/find_pw_page/find_pw_page.dart';
import 'package:ptbrofit/ui/pages/main_page.dart';
import 'package:ptbrofit/ui/pages/map_page/map_page.dart';
import 'package:ptbrofit/ui/pages/my_page/my_page.dart';
import 'package:ptbrofit/ui/pages/recommend_page/recommend_page_widgets/yoga10_page.dart';
import 'package:ptbrofit/ui/pages/recommend_page/recommend_page_widgets/yoga20_page.dart';
import 'package:ptbrofit/ui/pages/recommend_page/recommend_page_widgets/yoga30_page.dart';

import '../ui/pages/center_reservation_page/center_reservation_page.dart';
import '../ui/pages/center_reservation_page/center_reservation_page_widgets/center_reservation_detail_page.dart';
import '../ui/pages/center_reservation_page/center_reservation_page_widgets/center_reservation_success_page.dart';
import '../ui/pages/hospital_reservation_page/hospital_reservation_page.dart';
import '../ui/pages/hospital_reservation_page/hospital_reservation_page_widgets/hospital_reservation_detail_page.dart';
import '../ui/pages/hospital_reservation_page/hospital_reservation_page_widgets/hospital_reservation_success_page.dart';

class Move {
  //메인 페이지
  static String mainPage = "/mainPage";

  //로그인 페이지
  static String loginPage = "/loginPage";

  //아이디 찾기,성공
  static String findIdPage = "/findIdPage";
  static String findIdSuccessPage = "/findIdSuccessPage";

  //비번찾기,변경
  static String findPWPage = "/findPWPage";
  static String findPWChangePage = "/findPWChangePage";

  //회원가입 페이지
  static String joinPage = "/joinPage";
  static String joinSuccessPage = "/joinSuccessPage";

  //마이 페이지
  static String myPage = "/myPage";

  //10,20,30요가 페이지
  static String yoga10Page = "/yoga10Page";
  static String yoga20Page = "/yoga20Page";
  static String yoga30Page = "/yoga30Page";

  //센터예약 페이지
  static String centerReservationPage = "/centerReservationPage";
  static String centerReservationDetailPage = "/centerReservationDetailPage";
  static String centerReservationSuccessPage = "/centerReservationSuccessPage";

  //병원예약 페이지
  static String hospitalReservationPage = "/hospitalReservationPage";
  static String hospitalReservationDetailPage =
      "/hospitalReservationDetailPage";
  static String hospitalReservationSuccessPage =
      "/hospitalReservationSuccessPage";

  //주변 병원 페이지
  static String mapPage = "/mapPage";
}

Map<String, Widget Function(BuildContext)> getRouters() {
  return {
    //메인 페이지
    Move.mainPage: (context) => MainPage(),

    //로그인 페이지
    Move.loginPage: (context) => LoginPage(),

    //아이디 찾기,성공
    Move.findIdPage: (context) => FindIdPage(),
    Move.findIdSuccessPage: (context) => FindIdSuccessPage(),

    //비번찾기,변경
    Move.findPWPage: (context) => FindPWPage(),
    Move.findPWChangePage: (context) => FindPWChangePage(),

    //회원가입 페이지
    Move.joinPage: (context) => JoinPage(),
    Move.joinSuccessPage: (context) => JoinSuccessPage(),

    //마이 페이지
    Move.myPage: (context) => MyPage(),

    //10,20,30요가 페이지
    Move.yoga10Page: (context) => Yoga10Page(),
    Move.yoga20Page: (context) => Yoga20Page(),
    Move.yoga30Page: (context) => Yoga30Page(),

    //병원예약 페이지
    Move.centerReservationPage: (context) => CenterReservationPage(),
    Move.centerReservationDetailPage: (context) =>
        CenterReservationDetailPage(),
    Move.centerReservationSuccessPage: (context) =>
        CenterReservationSuccessPage(),

    //센터예약 페이지
    Move.hospitalReservationPage: (context) => HospitalReservationPage(),
    Move.hospitalReservationDetailPage: (context) =>
        HospitalReservationDetailPage(),
    Move.hospitalReservationSuccessPage: (context) =>
        HospitalReservationSuccessPage(),

    //주변 병원
    Move.mapPage: (context) => MapPage(),
  };
}
