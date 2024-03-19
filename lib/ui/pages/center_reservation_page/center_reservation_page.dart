import 'package:flutter/material.dart';

import 'center_reservation_page_widgets/center_reservation_page_body.dart';

class CenterReservationPage extends StatelessWidget {
  const CenterReservationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("센터 예약"),
      ),
      body: CenterReservationPageBody(),
    );
  }
}
