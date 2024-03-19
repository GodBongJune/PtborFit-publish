import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ptbrofit/core/color.dart';
import 'package:ptbrofit/core/size.dart';
import 'package:ptbrofit/ui/pages/recommend_page/recommend_page.dart';

import 'calendar_page/calendar_page.dart';
import 'camera_page/camera_page.dart';
import 'growth_page/growth_page.dart';
import 'my_page/my_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late PageController _pageController;

  int _selectedPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedPage);
  }

  void _onNavigateToPage(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: onWillPop,
        child: IndexedStack(
          index: _selectedPage,
          children: [
            CameraPage(onNavigateToPage: _onNavigateToPage),
            GrowthPage(),
            MyPage(key: UniqueKey()),
            CalendarPage(),
            RecommendPage(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedPage,
        selectedItemColor: kMainColor,
        unselectedItemColor: kB0Color,
        selectedFontSize: size10,
        unselectedFontSize: size10,
        elevation: 0,
        onTap: (index) {
          setState(() {
            _selectedPage = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              label: "촬영", icon: Icon(CupertinoIcons.camera_fill)),
          BottomNavigationBarItem(
              label: "성장변화량",
              icon: Icon(CupertinoIcons.arrow_up_right_square_fill)),
          BottomNavigationBarItem(
              label: "내 정보", icon: Icon(CupertinoIcons.person_fill)),
          BottomNavigationBarItem(
              label: "일정", icon: Icon(CupertinoIcons.calendar)),
          BottomNavigationBarItem(
              label: "추천", icon: Icon(CupertinoIcons.plus_app_fill)),
        ],
      ),
    );
  }

  DateTime? currentBackPressTime;

  Future<bool> onWillPop() async {
    DateTime currentTime = DateTime.now();

    if (currentBackPressTime == null ||
        currentTime.difference(currentBackPressTime!) >
            const Duration(seconds: 2)) {
      currentBackPressTime = currentTime;
      Fluttertoast.showToast(
          msg: "'뒤로' 버튼을 한번 더 누르시면 종료됩니다.",
          gravity: ToastGravity.BOTTOM,
          backgroundColor: const Color(0xff6E6E6E),
          fontSize: 15,
          toastLength: Toast.LENGTH_SHORT);
      return false;
    }
    return true;
  }
}
