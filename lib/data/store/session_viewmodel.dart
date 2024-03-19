import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:ptbrofit/core/move.dart';
import 'package:ptbrofit/data/dto/response_dto.dart';
import 'package:ptbrofit/data/model/user.dart';
import 'package:ptbrofit/data/repository/user_repository.dart';
import 'package:ptbrofit/main.dart';
import 'package:ptbrofit/ui/pages/main_page.dart';
import 'package:ptbrofit/utils/custom_util.dart';

class SessionUser {
  User? user;
  SessionUser({this.user});
}

class SessionStore extends SessionUser {
  final mContext = navigatorKey.currentContext;

  //회원가입 메일전송
  Future<void> joinEmail(requestDTO, context, Function(bool) onResult) async {
    ResponseDTO responseDTO =
        await UserRepository().fetchJoinEmail(requestDTO, context);
    if (responseDTO.result == "SUCCESS") {
      onResult(true);
    } else {
      onResult(false);
    }
  }

  //회원가입 메일 인증번호
  Future<void> joinEmailAuth(
      requestDTO, context, Function(bool) onResult) async {
    ResponseDTO responseDTO =
        await UserRepository().fetchJoinEmailAuth(requestDTO, context);
    if (responseDTO.result == "SUCCESS") {
      onResult(true);
    } else {
      onResult(false);
    }
  }

  //회원가입
  Future<void> join(requestDTO, context) async {
    ResponseDTO responseDTO =
        await UserRepository().fetchJoin(requestDTO, context);
    if (responseDTO.result == "SUCCESS") {
      Navigator.of(context).pop();
      Navigator.of(context).popAndPushNamed(Move.joinSuccessPage);
    }
    if (responseDTO.result == "FAIL") {
      Navigator.of(context).pop();
      return;
    }
  }

  //로그인
  Future<void> login(requestDTO, context) async {
    ResponseDTO responseDTO =
        await UserRepository().fetchLogin(requestDTO, context);
    if (responseDTO.result == "SUCCESS") {
      Navigator.pop(context);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => MainPage()),
          (route) => false);
    }
    if (responseDTO.result == "FAIL") {
      Navigator.pop(context);
      customSnackbar(context, responseDTO.message);
    }
  }

  //아이디찾기 (SMS전송)
  Future<void> findEmailSMS(
      requestDTO, context, Function(bool) onResult) async {
    ResponseDTO responseDTO =
        await UserRepository().fetchFindEmailSMS(requestDTO, context);
    if (responseDTO.result == "SUCCESS") {
      onResult(true);
    }
    if (responseDTO.result == "FAIL") {
      onResult(false);
    }
  }

  //아이디찾기 (SMS인증완료)
  Future<void> findEmailSMSAuth(context, code) async {
    ResponseDTO responseDTO =
        await UserRepository().fetchFindEmailSMSAuth(context, code);
    if (responseDTO.result == "SUCCESS") {}
    if (responseDTO.result == "FAIL") {}
  }
}

final sessionProvider = Provider<SessionStore>((ref) {
  return SessionStore();
});
