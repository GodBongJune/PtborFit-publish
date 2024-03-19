//회원가입 메일
class JoinEmailReqDTO {
  final String appCode;
  final String appMemberEmail;
  final String emailAuthType;

  JoinEmailReqDTO({
    required this.appCode,
    required this.appMemberEmail,
    required this.emailAuthType,
  });

  Map<String, dynamic> toJson() => {
        "appCode": appCode,
        "appMemberEmail": appMemberEmail,
        "emailAuthType": emailAuthType,
      };
}

//회원가입 메일 인증번호
class JoinEmailAuthReqDTO {
  final String appCode;
  final String appMemberEmail;
  final String emailAuthType;
  final String authCode;

  JoinEmailAuthReqDTO({
    required this.appCode,
    required this.appMemberEmail,
    required this.emailAuthType,
    required this.authCode,
  });

  Map<String, dynamic> toJson() => {
        "appCode": appCode,
        "appMemberEmail": appMemberEmail,
        "emailAuthType": emailAuthType,
        "authCode": authCode,
      };
}

//회원가입
class JoinReqDTO {
  final String appCode;
  final String appMemberEmail;
  final String appMemberPassword;
  final String appMemberType;
  final String appMemberName;
  final String appMemberPhone;
  final String appMemberPrivateAgree;
  final String birthDate;
  final String gender;

  JoinReqDTO({
    required this.appCode,
    required this.appMemberEmail,
    required this.appMemberPassword,
    required this.appMemberType,
    required this.appMemberName,
    required this.appMemberPhone,
    required this.appMemberPrivateAgree,
    required this.birthDate,
    required this.gender,
  });

  Map<String, dynamic> toJson() => {
        "appCode": appCode,
        "appMemberEmail": appMemberEmail,
        "appMemberPassword": appMemberPassword,
        "appMemberType": appMemberType,
        "appMemberName": appMemberName,
        "appMemberPhone": appMemberPhone,
        "appMemberPrivateAgree": appMemberPrivateAgree,
        "birthDate": birthDate,
        "gender": gender,
      };
}

//로그인
class LoginReqDTO {
  final String appMemberEmail;
  final String appMemberPassword;
  final String appCode;
  final String appMemberType;

  LoginReqDTO({
    required this.appMemberEmail,
    required this.appMemberPassword,
    required this.appCode,
    required this.appMemberType,
  });

  Map<String, dynamic> toJson() => {
        "appMemberEmail": appMemberEmail,
        "appMemberPassword": appMemberPassword,
        "appCode": appCode,
        "appMemberType": appMemberType,
      };
}

//아이디 찾기 (SMS전송)
class FindEmailSMSReqDTO {
  final String phone;
  final String name;
  final String appCode;

  FindEmailSMSReqDTO({
    required this.phone,
    required this.name,
    required this.appCode,
  });

  Map<String, dynamic> toJson() => {
        "phone": phone,
        "name": name,
        "appCode": appCode,
      };
}
