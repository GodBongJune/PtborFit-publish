import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:ptbrofit/core/http.dart';
import 'package:ptbrofit/core/move.dart';
import 'package:ptbrofit/data/dto/response_dto.dart';
import 'package:ptbrofit/data/dto/user_request_dto.dart';
import 'package:ptbrofit/utils/custom_util.dart';

class UserRepository {
  //회원가입 메일전송
  Future<ResponseDTO> fetchJoinEmail(requestDTO, context) async {
    Response<dynamic> response =
        await dio.post("/client/auth/send", data: requestDTO.toJson());
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    if (responseDTO.result == "SUCCESS") {
      customSnackbar(context, "인증번호 발송성공");
    }

    if (responseDTO.result == "FAIL") {
      customSnackbar(context, responseDTO.message);
    }
    return responseDTO;
  }

  //회원가입 메일 인증번호
  Future<ResponseDTO> fetchJoinEmailAuth(requestDTO, context) async {
    Response<dynamic> response =
        await dio.put("/client/auth/send", data: requestDTO.toJson());
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    if (responseDTO.result == "SUCCESS") {
      customSnackbar(context, "인증성공");
    }

    if (responseDTO.result == "FAIL") {
      customSnackbar(context, responseDTO.message);
    }
    return responseDTO;
  }

  //회원가입
  Future<ResponseDTO> fetchJoin(requestDTO, context) async {
    Response<dynamic> response =
        await dio.post("/client/join", data: requestDTO.toJson());
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    if (responseDTO.result == "FAIL") {
      customSnackbar(context, responseDTO.message);
    }
    return responseDTO;
  }

  //로그인
  Future<ResponseDTO> fetchLogin(requestDTO, context) async {
    Response<dynamic> response =
        await dio.post("/client/login", data: requestDTO.toJson());
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    if (responseDTO.result == "FAIL") {
      customSnackbar(context, responseDTO.message);
    }
    return responseDTO;
  }

  //아이디찾기 (SMS전송)
  Future<ResponseDTO> fetchFindEmailSMS(requestDTO, context) async {
    Response<dynamic> response = await dio.post(
      "/client/auth/email",
      data: requestDTO.toJson(),
    );
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    if (responseDTO.result == "SUCCESS") {
      customSnackbar(context, "전송 성공");
      await secureStorage.write(
          key: "smsToken", value: responseDTO.data["token"]);
    }

    if (responseDTO.result == "FAIL") {
      customSnackbar(context, responseDTO.message);
    }
    return responseDTO;
  }

  //아이디찾기 (SMS인증완료)
  Future<ResponseDTO> fetchFindEmailSMSAuth(context, code) async {
    String? token = await secureStorage.read(key: "smsToken");

    Response<dynamic> response = await dio.get(
      "/client/auth/email?code=$code",
      options: Options(
        headers: {
          "Email-Authorization": "Bearer $token",
        },
      ),
    );
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    if (responseDTO.result == "SUCCESS") {
      customSnackbar(context, "인증 성공");
      String? email = responseDTO.data["email"];
      Navigator.popAndPushNamed(context, Move.findIdSuccessPage,
          arguments: email);
    }

    if (responseDTO.result == "FAIL") {
      customSnackbar(context, responseDTO.message);
    }
    return responseDTO;
  }
}
