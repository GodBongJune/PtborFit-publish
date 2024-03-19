import 'package:flutter/material.dart';
import 'package:ptbrofit/core/move.dart';

import '../../../../core/color.dart';
import '../../../../core/size.dart';

class YogaComponent extends StatefulWidget {
  const YogaComponent({super.key});

  @override
  State<YogaComponent> createState() => _YogaComponentState();
}

class _YogaComponentState extends State<YogaComponent> {
  bool yoga10 = false;
  bool yoga20 = false;
  bool yoga30 = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // if (yoga10 == true && yoga20 == false && yoga30 == false)
        // Column(
        //   children: [
        //     InkWell(
        //       onTap: () {
        //         // setState(() {
        //         //   yoga10 = false;
        //         // });
        //       },
        //       child: Text(
        //         "10분 요가 영상 외 다른 영상 보기",
        //         style: TextStyle(
        //             color: k59Color,
        //             fontSize: size15,
        //             fontWeight: FontWeight.bold),
        //       ),
        //     ),
        //     SizedBox(height: 20),
        //     Padding(
        //       padding: const EdgeInsets.symmetric(horizontal: 32.0),
        //       child: Container(
        //         height: MediaQuery.of(context).size.height * 0.64,
        //         child: GridView.builder(
        //           shrinkWrap: true,
        //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //             crossAxisCount: 3,
        //             crossAxisSpacing: 16,
        //             mainAxisSpacing: 16,
        //           ),
        //           itemCount: 50, // Replace with your actual item count
        //           itemBuilder: (context, index) {
        //             return Container(
        //               decoration: BoxDecoration(
        //                 borderRadius: BorderRadius.circular(6),
        //                 color: k84Color,
        //               ),
        //               child: Center(
        //                 child: Text("영상 $index"),
        //               ),
        //             );
        //           },
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
        // if (yoga20 == true && yoga10 == false && yoga30 == false)
        // Column(
        //   children: [
        //     InkWell(
        //       onTap: () {
        //         // setState(() {
        //         //   yoga20 = false;
        //         // });
        //       },
        //       child: Text(
        //         "20분 요가 영상 외 다른 영상 보기",
        //         style: TextStyle(
        //             color: k59Color,
        //             fontSize: size15,
        //             fontWeight: FontWeight.bold),
        //       ),
        //     ),
        //     SizedBox(height: 20),
        //     Padding(
        //       padding: const EdgeInsets.symmetric(horizontal: 32.0),
        //       child: Container(
        //         height: MediaQuery.of(context).size.height * 0.64,
        //         child: GridView.builder(
        //           shrinkWrap: true,
        //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //             crossAxisCount: 3,
        //             crossAxisSpacing: 16,
        //             mainAxisSpacing: 16,
        //           ),
        //           itemCount: 50, // Replace with your actual item count
        //           itemBuilder: (context, index) {
        //             return Container(
        //               decoration: BoxDecoration(
        //                 borderRadius: BorderRadius.circular(6),
        //                 color: k84Color,
        //               ),
        //               child: Center(
        //                 child: Text("영상 $index"),
        //               ),
        //             );
        //           },
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
        // if (yoga30 == true && yoga10 == false && yoga20 == false)
        // Column(
        //   children: [
        //     InkWell(
        //       onTap: () {
        //         // setState(() {
        //         //   yoga30 = false;
        //         // });
        //       },
        //       child: Text(
        //         "30분 요가 영상 외 다른 영상 보기",
        //         style: TextStyle(
        //             color: k59Color,
        //             fontSize: size15,
        //             fontWeight: FontWeight.bold),
        //       ),
        //     ),
        //     SizedBox(height: 20),
        //     Padding(
        //       padding: const EdgeInsets.symmetric(horizontal: 32.0),
        //       child: Container(
        //         height: MediaQuery.of(context).size.height * 0.64,
        //         child: GridView.builder(
        //           shrinkWrap: true,
        //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //             crossAxisCount: 3,
        //             crossAxisSpacing: 16,
        //             mainAxisSpacing: 16,
        //           ),
        //           itemCount: 50, // Replace with your actual item count
        //           itemBuilder: (context, index) {
        //             return Container(
        //               decoration: BoxDecoration(
        //                 borderRadius: BorderRadius.circular(6),
        //                 color: k84Color,
        //               ),
        //               child: Center(
        //                 child: Text("영상 $index"),
        //               ),
        //             );
        //           },
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
        // if (yoga10 == false && yoga20 == false && yoga30 == false)
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
              child: InkWell(
                onTap: () {
                  // setState(() {
                  //   yoga10 = true;
                  // });
                  Navigator.pushNamed(context, Move.yoga10Page);
                },
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "10분 요가/스트레칭 영상",
                          style: TextStyle(
                            color: k59Color,
                            fontSize: size15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(
                          Icons.keyboard_double_arrow_right,
                          color: k59Color,
                          size: 20,
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.38,
                            height: MediaQuery.of(context).size.height * 0.15,
                            child: Image.asset(
                              "assets/images/yoga/yoga1.jpeg",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Spacer(),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.38,
                            height: MediaQuery.of(context).size.height * 0.15,
                            child: Image.asset(
                              "assets/images/yoga/yoga2.jpeg",
                              fit: BoxFit.fill,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
              child: InkWell(
                onTap: () {
                  // setState(() {
                  //   yoga20 = true;
                  // });
                  Navigator.pushNamed(context, Move.yoga20Page);
                },
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "20분 요가/스트레칭 영상",
                          style: TextStyle(
                            color: k59Color,
                            fontSize: size15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(
                          Icons.keyboard_double_arrow_right,
                          color: k59Color,
                          size: 20,
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.38,
                            height: MediaQuery.of(context).size.height * 0.15,
                            child: Image.asset(
                              "assets/images/yoga/yoga3.jpeg",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Spacer(),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.38,
                            height: MediaQuery.of(context).size.height * 0.15,
                            child: Image.asset(
                              "assets/images/yoga/yoga4.jpeg",
                              fit: BoxFit.fill,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
              child: InkWell(
                onTap: () {
                  // setState(() {
                  //   yoga30 = true;
                  // });
                  Navigator.pushNamed(context, Move.yoga30Page);
                },
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "30분 이상 요가/스트레칭 영상",
                          style: TextStyle(
                            color: k59Color,
                            fontSize: size15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(
                          Icons.keyboard_double_arrow_right,
                          color: k59Color,
                          size: 20,
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.38,
                            height: MediaQuery.of(context).size.height * 0.15,
                            child: Image.asset(
                              "assets/images/yoga/yoga5.jpeg",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Spacer(),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.38,
                            height: MediaQuery.of(context).size.height * 0.15,
                            child: Image.asset(
                              "assets/images/yoga/yoga6.jpeg",
                              fit: BoxFit.fill,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
            //   child: InkWell(
            //     onTap: () {
            //       yoga20 = true;
            //     },
            //     child: Column(
            //       children: [
            //         Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: [
            //             Text(
            //               "20분 요가/스트레칭 영상",
            //               style: TextStyle(
            //                 color: k59Color,
            //                 fontSize: size15,
            //                 fontWeight: FontWeight.bold,
            //               ),
            //             ),
            //             Icon(
            //               Icons.keyboard_double_arrow_right,
            //               color: k59Color,
            //               size: 20,
            //             )
            //           ],
            //         ),
            //         SizedBox(height: 10),
            //         Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: [
            //             ClipRRect(
            //               borderRadius: BorderRadius.circular(5),
            //               child: Container(
            //                 width: MediaQuery.of(context).size.width * 0.4,
            //                 height: MediaQuery.of(context).size.height * 0.15,
            //                 child: Image.asset(
            //                   "assets/images/yoga/yoga3.jpeg",
            //                   fit: BoxFit.fill,
            //                 ),
            //               ),
            //             ),
            //             ClipRRect(
            //               borderRadius: BorderRadius.circular(5),
            //               child: Container(
            //                 width: MediaQuery.of(context).size.width * 0.4,
            //                 height: MediaQuery.of(context).size.height * 0.15,
            //                 child: Image.asset(
            //                   "assets/images/yoga/yoga4.jpeg",
            //                   fit: BoxFit.fill,
            //                 ),
            //               ),
            //             )
            //           ],
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
            //   child: InkWell(
            //     onTap: () {
            //       yoga30 = true;
            //     },
            //     child: Column(
            //       children: [
            //         Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: [
            //             Text(
            //               "30분 이상 요가/스트레칭 영상",
            //               style: TextStyle(
            //                 color: k59Color,
            //                 fontSize: size15,
            //                 fontWeight: FontWeight.bold,
            //               ),
            //             ),
            //             Icon(
            //               Icons.keyboard_double_arrow_right,
            //               color: k59Color,
            //               size: 20,
            //             )
            //           ],
            //         ),
            //         SizedBox(height: 10),
            //         Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: [
            //             ClipRRect(
            //               borderRadius: BorderRadius.circular(5),
            //               child: Container(
            //                 width: MediaQuery.of(context).size.width * 0.4,
            //                 height: MediaQuery.of(context).size.height * 0.15,
            //                 child: Image.asset(
            //                   "assets/images/yoga/yoga5.jpeg",
            //                   fit: BoxFit.fill,
            //                 ),
            //               ),
            //             ),
            //             ClipRRect(
            //               borderRadius: BorderRadius.circular(5),
            //               child: Container(
            //                 width: MediaQuery.of(context).size.width * 0.4,
            //                 height: MediaQuery.of(context).size.height * 0.15,
            //                 child: Image.asset(
            //                   "assets/images/yoga/yoga6.jpeg",
            //                   fit: BoxFit.fill,
            //                 ),
            //               ),
            //             )
            //           ],
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ],
    );
  }
}
