import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';

class MapPageBody extends StatelessWidget {
  const MapPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    final Completer<NaverMapController> mapControllerCompleter = Completer();

    return NaverMap(
      options: NaverMapViewOptions(
        indoorEnable: true,
        locationButtonEnable: true,
        consumeSymbolTapEvents: false,
      ),
      onMapReady: (controller) async {
        mapControllerCompleter.complete(controller);
      },
    );
  }
}
