import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final dio = Dio(
  BaseOptions(
    baseUrl: "http://211.62.98.69:8745",
    contentType: "application/json; charset=utf-8",
    validateStatus: (status) {
      return true;
    },
  ),
);

const secureStorage = FlutterSecureStorage();
