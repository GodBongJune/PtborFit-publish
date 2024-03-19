import 'package:flutter/material.dart';

import '../../../../core/color.dart';

class Yoga20Page extends StatelessWidget {
  const Yoga20Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("20분 요가 영상"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: 50, // Replace with your actual item count
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: k84Color,
              ),
              child: Center(
                child: Text("영상 $index"),
              ),
            );
          },
        ),
      ),
    );
  }
}
