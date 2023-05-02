import 'package:shared_preferences/shared_preferences.dart';

class SPGlobal {
  static final SPGlobal _instance = SPGlobal._();
  SPGlobal._();

  factory SPGlobal() {
    return _instance;
  }

  late SharedPreferences prefs;

  Future<void> initSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }

  set id(String value) {
    prefs.setString("id", value);
  }

  String get id => prefs.getString("id") ?? "";

  set loginType(String value) {
    prefs.setString("loginType", value);
  }

  String get loginType => prefs.getString("loginType") ?? "";

  set isLogin(bool value) {
    prefs.setBool("isLogin", value);
  }

  bool get isLogin => prefs.getBool("isLogin") ?? false;
}
