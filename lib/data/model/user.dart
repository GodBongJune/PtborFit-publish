class User {
  int? appMemberIdx;
  String? appMemberEmail;
  String? appMemberPhone;
  String? appMemberCode;
  String? appMemberName;
  String? appCode;
  String? appMemberProfileUrl;
  DateTime? createAt;
  bool? appMemberPrivateAgree;
  String? appMemberStatus;
  String? appMemberType;

  User({
    this.appMemberIdx,
    this.appMemberEmail,
    this.appMemberPhone,
    this.appMemberCode,
    this.appMemberName,
    this.appCode,
    this.appMemberProfileUrl,
    this.createAt,
    this.appMemberPrivateAgree,
    this.appMemberStatus,
    this.appMemberType,
  });
  Map<String, dynamic> toJson() => {
        "appMemberIdx": appMemberIdx,
        "appMemberEmail": appMemberEmail,
        "appMemberPhone": appMemberPhone,
        "appMemberCode": appMemberCode,
        "appMemberName": appMemberName,
        "appCode": appCode,
        "appMemberProfileUrl": appMemberProfileUrl,
        "createAt": createAt?.toIso8601String(),
        "appMemberPrivateAgree": appMemberPrivateAgree,
        "appMemberStatus": appMemberStatus,
        "appMemberType": appMemberType,
      };

  User.fromJson(Map<String, dynamic> json)
      : appMemberIdx = json["appMemberIdx"],
        appMemberEmail = json["appMemberEmail"],
        appMemberPhone = json["appMemberPhone"],
        appMemberCode = json["appMemberCode"],
        appMemberName = json["appMemberName"],
        appCode = json["appCode"],
        appMemberProfileUrl = json["appMemberProfileUrl"],
        createAt =
            json["createAt"] != null ? DateTime.parse(json["createAt"]) : null,
        appMemberPrivateAgree = json["appMemberPrivateAgree"],
        appMemberStatus = json["appMemberStatus"],
        appMemberType = json["appMemberType"];
}
