import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ptbrofit/core/size.dart';
import 'package:ptbrofit/ui/pages/growth_page/growth_page.dart';

import '../../../../core/color.dart';

class CameraPageBody extends StatefulWidget {
  final Function(int) onNavigateToPage;

  const CameraPageBody({super.key, required this.onNavigateToPage});

  @override
  State<CameraPageBody> createState() => _CameraPageBodyState();
}

class _CameraPageBodyState extends State<CameraPageBody> {
  void navigateToPage(int pageIndex) {
    widget.onNavigateToPage(pageIndex);
  }

  bool front = true;
  bool right = false;
  bool left = false;
  bool back = false;

  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  late String _capturedImagePath = "";

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  @override
  void dispose() {
    _controller.dispose(); // 카메라 컨트롤러 해제
    super.dispose();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    if (cameras.isEmpty) {
      const CircularProgressIndicator();
    } else {
      _controller = CameraController(cameras[0], ResolutionPreset.max);
      _initializeControllerFuture = _controller.initialize();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (front)
          Expanded(
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.68,
                  child: FutureBuilder<void>(
                    future: _initializeControllerFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return CameraPreview(_controller);
                      } else if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else {
                        return const CircularProgressIndicator();
                      }
                    },
                  ),
                ),
                Positioned(
                  child: _capturedImagePath != null &&
                          _capturedImagePath.isNotEmpty
                      ? Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * 0.68,
                              child: Image.file(
                                File(_capturedImagePath),
                                fit: BoxFit.fill,
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 50),
                                child: Container(
                                  width: double.infinity,
                                  height:
                                      MediaQuery.of(context).size.height * 0.68,
                                  child: SvgPicture.asset(
                                    "assets/images/camera/front.svg",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      : SizedBox(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.68,
                          child: Stack(
                            children: [
                              SizedBox(
                                  width: double.infinity,
                                  child: CameraPreview(_controller)),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 50),
                                  child: Container(
                                    width: double.infinity,
                                    height: MediaQuery.of(context).size.height *
                                        0.68,
                                    child: SvgPicture.asset(
                                      "assets/images/camera/front.svg",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                ),
              ],
            ),
          ),
        if (front)
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: Row(
                        children: [
                          Spacer(),
                          InkWell(
                            onTap: () async {
                              final picker = ImagePicker();
                              final pickedFile = await picker.pickImage(
                                  source: ImageSource.gallery);

                              if (pickedFile != null) {
                                setState(() {
                                  _capturedImagePath = pickedFile.path;
                                });
                              }
                            },
                            child: Icon(Icons.image_outlined,
                                color: kMainColor, size: 30),
                          ),
                          Spacer(),
                          Container(),
                          Spacer(),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: Center(
                        child: InkWell(
                          onTap: () async {
                            await _initializeControllerFuture;
                            final XFile picture =
                                await _controller.takePicture();

                            print('사진 찍히고 저장됨: ${picture.path}');
                            setState(() {
                              _capturedImagePath = picture.path;
                            });
                          },
                          child: Icon(CupertinoIcons.circle_fill,
                              color: kMainColor, size: 50),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: Center(
                        child: Row(
                          children: [
                            Spacer(),
                            InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (context) {
                                    return AlertDialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      title: Row(
                                        children: [
                                          Spacer(),
                                          Text(
                                            "사진을 다시 찍으시겠습니까?",
                                            style: TextStyle(
                                                color: k70Color,
                                                fontSize: size15),
                                          ),
                                          Spacer(),
                                        ],
                                      ),
                                      actions: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  _capturedImagePath = "";
                                                });
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.03,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.15,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(7),
                                                  color: kMainColor,
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    "확인",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: size15,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.03,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.15,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(7),
                                                  color: kB9Color,
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    "취소",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: size15,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Icon(CupertinoIcons.refresh,
                                  color: kMainColor, size: 30),
                            ),
                            SizedBox(width: 15),
                            InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (context) {
                                    return AlertDialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      title: Row(
                                        children: [
                                          Spacer(),
                                          Text(
                                            "다음 사진을 찍으시겠습니까?",
                                            style: TextStyle(
                                                color: k70Color,
                                                fontSize: size15),
                                          ),
                                          Spacer(),
                                        ],
                                      ),
                                      actions: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  _capturedImagePath = "";
                                                  front = false;
                                                  right = true;
                                                });
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.03,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.15,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(7),
                                                  color: kMainColor,
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    "확인",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: size15,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.03,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.15,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(7),
                                                  color: kB9Color,
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    "취소",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: size15,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Icon(Icons.keyboard_arrow_right,
                                  color: kMainColor, size: 30),
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

        if (right)
          Expanded(
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.68,
                  child: FutureBuilder<void>(
                    future: _initializeControllerFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return CameraPreview(_controller);
                      } else if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else {
                        return const CircularProgressIndicator();
                      }
                    },
                  ),
                ),
                Positioned(
                  child: _capturedImagePath != null &&
                          _capturedImagePath.isNotEmpty
                      ? Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * 0.68,
                              child: Image.file(
                                File(_capturedImagePath),
                                fit: BoxFit.fill,
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 50),
                                child: Container(
                                  width: double.infinity,
                                  height:
                                      MediaQuery.of(context).size.height * 0.68,
                                  child: SvgPicture.asset(
                                    "assets/images/camera/right.svg",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      : SizedBox(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.68,
                          child: Stack(
                            children: [
                              SizedBox(
                                  width: double.infinity,
                                  child: CameraPreview(_controller)),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 50),
                                  child: Container(
                                    width: double.infinity,
                                    height: MediaQuery.of(context).size.height *
                                        0.68,
                                    child: SvgPicture.asset(
                                      "assets/images/camera/right.svg",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                ),
              ],
            ),
          ),
        if (right)
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: Row(
                        children: [
                          Spacer(),
                          InkWell(
                            onTap: () async {
                              final picker = ImagePicker();
                              final pickedFile = await picker.pickImage(
                                  source: ImageSource.gallery);

                              if (pickedFile != null) {
                                setState(() {
                                  _capturedImagePath = pickedFile.path;
                                });
                              }
                            },
                            child: Icon(Icons.image_outlined,
                                color: kMainColor, size: 30),
                          ),
                          Spacer(),
                          Container(),
                          Spacer(),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: Center(
                        child: InkWell(
                          onTap: () async {
                            await _initializeControllerFuture;
                            final XFile picture =
                                await _controller.takePicture();

                            print('사진 찍히고 저장됨: ${picture.path}');
                            setState(() {
                              _capturedImagePath = picture.path;
                            });
                          },
                          child: Icon(CupertinoIcons.circle_fill,
                              color: kMainColor, size: 50),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: Center(
                        child: Row(
                          children: [
                            Spacer(),
                            InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (context) {
                                    return AlertDialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      title: Row(
                                        children: [
                                          Spacer(),
                                          Text(
                                            "사진을 다시 찍으시겠습니까?",
                                            style: TextStyle(
                                                color: k70Color,
                                                fontSize: size15),
                                          ),
                                          Spacer(),
                                        ],
                                      ),
                                      actions: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  _capturedImagePath = "";
                                                });
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.03,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.15,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(7),
                                                  color: kMainColor,
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    "확인",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: size15,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.03,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.15,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(7),
                                                  color: kB9Color,
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    "취소",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: size15,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Icon(CupertinoIcons.refresh,
                                  color: kMainColor, size: 30),
                            ),
                            SizedBox(width: 15),
                            InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (context) {
                                    return AlertDialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      title: Row(
                                        children: [
                                          Spacer(),
                                          Text(
                                            "다음 사진을 찍으시겠습니까?",
                                            style: TextStyle(
                                                color: k70Color,
                                                fontSize: size15),
                                          ),
                                          Spacer(),
                                        ],
                                      ),
                                      actions: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  _capturedImagePath = "";
                                                  right = false;
                                                  left = true;
                                                });
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.03,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.15,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(7),
                                                  color: kMainColor,
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    "확인",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: size15,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.03,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.15,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(7),
                                                  color: kB9Color,
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    "취소",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: size15,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Icon(Icons.keyboard_arrow_right,
                                  color: kMainColor, size: 30),
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

        if (left)
          Expanded(
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.68,
                  child: FutureBuilder<void>(
                    future: _initializeControllerFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return CameraPreview(_controller);
                      } else if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else {
                        return const CircularProgressIndicator();
                      }
                    },
                  ),
                ),
                Positioned(
                  child: _capturedImagePath != null &&
                          _capturedImagePath.isNotEmpty
                      ? Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * 0.68,
                              child: Image.file(
                                File(_capturedImagePath),
                                fit: BoxFit.fill,
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 50),
                                child: Container(
                                  width: double.infinity,
                                  height:
                                      MediaQuery.of(context).size.height * 0.68,
                                  child: SvgPicture.asset(
                                    "assets/images/camera/left.svg",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      : SizedBox(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.68,
                          child: Stack(
                            children: [
                              SizedBox(
                                  width: double.infinity,
                                  child: CameraPreview(_controller)),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 50),
                                  child: Container(
                                    width: double.infinity,
                                    height: MediaQuery.of(context).size.height *
                                        0.68,
                                    child: SvgPicture.asset(
                                      "assets/images/camera/left.svg",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                ),
              ],
            ),
          ),
        if (left)
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: Row(
                        children: [
                          Spacer(),
                          InkWell(
                            onTap: () async {
                              final picker = ImagePicker();
                              final pickedFile = await picker.pickImage(
                                  source: ImageSource.gallery);

                              if (pickedFile != null) {
                                setState(() {
                                  _capturedImagePath = pickedFile.path;
                                });
                              }
                            },
                            child: Icon(Icons.image_outlined,
                                color: kMainColor, size: 30),
                          ),
                          Spacer(),
                          Container(),
                          Spacer(),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: Center(
                        child: InkWell(
                          onTap: () async {
                            await _initializeControllerFuture;
                            final XFile picture =
                                await _controller.takePicture();

                            print('사진 찍히고 저장됨: ${picture.path}');
                            setState(() {
                              _capturedImagePath = picture.path;
                            });
                          },
                          child: Icon(CupertinoIcons.circle_fill,
                              color: kMainColor, size: 50),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: Center(
                        child: Row(
                          children: [
                            Spacer(),
                            InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (context) {
                                    return AlertDialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      title: Row(
                                        children: [
                                          Spacer(),
                                          Text(
                                            "사진을 다시 찍으시겠습니까?",
                                            style: TextStyle(
                                                color: k70Color,
                                                fontSize: size15),
                                          ),
                                          Spacer(),
                                        ],
                                      ),
                                      actions: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  _capturedImagePath = "";
                                                });
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.03,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.15,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(7),
                                                  color: kMainColor,
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    "확인",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: size15,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.03,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.15,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(7),
                                                  color: kB9Color,
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    "취소",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: size15,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Icon(CupertinoIcons.refresh,
                                  color: kMainColor, size: 30),
                            ),
                            SizedBox(width: 15),
                            InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (context) {
                                    return AlertDialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      title: Row(
                                        children: [
                                          Spacer(),
                                          Text(
                                            "다음 사진을 찍으시겠습니까?",
                                            style: TextStyle(
                                                color: k70Color,
                                                fontSize: size15),
                                          ),
                                          Spacer(),
                                        ],
                                      ),
                                      actions: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  _capturedImagePath = "";
                                                  left = false;
                                                  back = true;
                                                });
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.03,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.15,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(7),
                                                  color: kMainColor,
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    "확인",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: size15,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.03,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.15,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(7),
                                                  color: kB9Color,
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    "취소",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: size15,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Icon(Icons.keyboard_arrow_right,
                                  color: kMainColor, size: 30),
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

        if (back)
          Expanded(
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.68,
                  child: FutureBuilder<void>(
                    future: _initializeControllerFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return CameraPreview(_controller);
                      } else if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else {
                        return const CircularProgressIndicator();
                      }
                    },
                  ),
                ),
                Positioned(
                  child: _capturedImagePath != null &&
                          _capturedImagePath.isNotEmpty
                      ? Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * 0.68,
                              child: Image.file(
                                File(_capturedImagePath),
                                fit: BoxFit.fill,
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 50),
                                child: Container(
                                  width: double.infinity,
                                  height:
                                      MediaQuery.of(context).size.height * 0.68,
                                  child: SvgPicture.asset(
                                    "assets/images/camera/back.svg",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      : SizedBox(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.68,
                          child: Stack(
                            children: [
                              SizedBox(
                                  width: double.infinity,
                                  child: CameraPreview(_controller)),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 50),
                                  child: Container(
                                    width: double.infinity,
                                    height: MediaQuery.of(context).size.height *
                                        0.68,
                                    child: SvgPicture.asset(
                                      "assets/images/camera/back.svg",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                ),
              ],
            ),
          ),
        if (back)
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: Row(
                        children: [
                          Spacer(),
                          InkWell(
                            onTap: () async {
                              final picker = ImagePicker();
                              final pickedFile = await picker.pickImage(
                                  source: ImageSource.gallery);

                              if (pickedFile != null) {
                                setState(() {
                                  _capturedImagePath = pickedFile.path;
                                });
                              }
                            },
                            child: Icon(Icons.image_outlined,
                                color: kMainColor, size: 30),
                          ),
                          Spacer(),
                          Container(),
                          Spacer(),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: Center(
                        child: InkWell(
                          onTap: () async {
                            await _initializeControllerFuture;
                            final XFile picture =
                                await _controller.takePicture();

                            print('사진 찍히고 저장됨: ${picture.path}');
                            setState(() {
                              _capturedImagePath = picture.path;
                            });
                          },
                          child: Icon(CupertinoIcons.circle_fill,
                              color: kMainColor, size: 50),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: Center(
                        child: Row(
                          children: [
                            Spacer(),
                            InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (context) {
                                    return AlertDialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      title: Row(
                                        children: [
                                          Spacer(),
                                          Text(
                                            "사진을 다시 찍으시겠습니까?",
                                            style: TextStyle(
                                                color: k70Color,
                                                fontSize: size15),
                                          ),
                                          Spacer(),
                                        ],
                                      ),
                                      actions: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  _capturedImagePath = "";
                                                });
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.03,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.15,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(7),
                                                  color: kMainColor,
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    "확인",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: size15,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.03,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.15,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(7),
                                                  color: kB9Color,
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    "취소",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: size15,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Icon(CupertinoIcons.refresh,
                                  color: kMainColor, size: 30),
                            ),
                            SizedBox(width: 15),
                            InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (context) {
                                    return AlertDialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      title: Row(
                                        children: [
                                          Spacer(),
                                          Text(
                                            "체형 분석을 하시겠습니까?",
                                            style: TextStyle(
                                                color: k70Color,
                                                fontSize: size15),
                                          ),
                                          Spacer(),
                                        ],
                                      ),
                                      actions: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  _capturedImagePath = "";
                                                  back = false;
                                                  front = true;
                                                });
                                                navigateToPage(1);
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.03,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.15,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(7),
                                                  color: kMainColor,
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    "확인",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: size15,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.03,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.15,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(7),
                                                  color: kB9Color,
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    "취소",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: size15,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Icon(Icons.keyboard_arrow_right,
                                  color: kMainColor, size: 30),
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        // Container(
        //   child: Expanded(
        //     child: Row(
        //       children: [
        //         Expanded(
        //           flex: 1,
        //           child: Container(
        //             width: MediaQuery.of(context).size.width * 0.2,
        //             child: InkWell(
        //               onTap: () async {
        //                 final picker = ImagePicker();
        //                 final pickedFile =
        //                     await picker.pickImage(source: ImageSource.gallery);
        //
        //                 if (pickedFile != null) {
        //                   setState(() {
        //                     _capturedImagePath = pickedFile.path;
        //                   });
        //                 }
        //               },
        //               child: Icon(
        //                 Icons.image_outlined,
        //                 color: kMainColor,
        //                 size: 30,
        //               ),
        //             ),
        //           ),
        //         ),
        //         Spacer(),
        //         Expanded(
        //           flex: 1,
        //           child: Container(
        //             width: MediaQuery.of(context).size.width * 0.2,
        //             child: InkWell(
        //               onTap: () async {
        //                 await _initializeControllerFuture;
        //
        //                 final XFile picture = await _controller.takePicture();
        //
        //                 print('사진 찍히고 저장됨: ${picture.path}');
        //                 setState(() {
        //                   _capturedImagePath = picture.path;
        //                 });
        //               },
        //               child: Icon(
        //                 CupertinoIcons.circle_fill,
        //                 color: kMainColor,
        //                 size: 50,
        //               ),
        //             ),
        //           ),
        //         ),
        //         Spacer(),
        //         Expanded(
        //           flex: 1,
        //           child: Container(
        //             width: MediaQuery.of(context).size.width * 0.2,
        //             color: Colors.black,
        //             child: Row(
        //               children: [
        //                 InkWell(
        //                   onTap: () {
        //                     setState(() {
        //                       _capturedImagePath = "";
        //                     });
        //                   },
        //                   child: Icon(
        //                     CupertinoIcons.refresh,
        //                     color: kMainColor,
        //                     size: 30,
        //                   ),
        //                 ),
        //                 Spacer(),
        //                 InkWell(
        //                   child: Icon(
        //                     Icons.keyboard_arrow_right,
        //                     color: kMainColor,
        //                     size: 30,
        //                   ),
        //                 ),
        //                 SizedBox(width: 20),
        //               ],
        //             ),
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
