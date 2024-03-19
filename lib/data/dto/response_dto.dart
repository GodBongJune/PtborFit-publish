import 'package:logger/logger.dart';

class ResponseDTO {
  dynamic result;
  dynamic data;
  dynamic message;
  dynamic errorCode;

  ResponseDTO(this.result, this.data, this.message, this.errorCode);

  ResponseDTO.fromJson(Map<String, dynamic> json)
      : result = json["result"],
        data = json["data"],
        message = json["message"],
        errorCode = json["errorCode"] {
    Logger().d("응답1: = $result");
    Logger().d("응답2: = $data");
    Logger().d("응답3: = $message");
    Logger().d("응답4: = $errorCode");
  }
}
