import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:ptbrofit/core/appCode.dart';
import 'package:ptbrofit/core/theme.dart';
import 'package:ptbrofit/ui/pages/auth/login_page/login_page.dart';

import 'core/move.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // runApp(const Ptbro());
  runApp(ProviderScope(child: Ptbro()));

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
  ));

  await GlobalAppCode().init();
}

class Ptbro extends StatelessWidget {
  const Ptbro({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
            child: child!,
          );
        },
        debugShowCheckedModeBanner: false,
        routes: getRouters(),
        home: LoginPage(),
        theme: theme(),
      ),
    );
  }
}
