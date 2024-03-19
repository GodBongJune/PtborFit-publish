import 'package:package_info/package_info.dart';

class GlobalAppCode {
  static final GlobalAppCode _instance = GlobalAppCode._internal();
  late final String appCode;

  factory GlobalAppCode() {
    return _instance;
  }

  GlobalAppCode._internal();

  Future<void> init() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    appCode = info.packageName;
  }
}
