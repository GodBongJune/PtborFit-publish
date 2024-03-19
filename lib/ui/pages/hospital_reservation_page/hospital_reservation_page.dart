import 'package:flutter/material.dart';

import 'hospital_reservation_page_widgets/hospital_reservation_page_body.dart';

class HospitalReservationPage extends StatelessWidget {
  const HospitalReservationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("병원 예약"),
      ),
      body: HospitalReservationPageBody(),
    );
  }
}
