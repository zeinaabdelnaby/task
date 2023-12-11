import 'package:shared_preferences/shared_preferences.dart';

class Prefrence {
  static String? isLogined;
  static Future setValue() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('isLogin2', 'done');
  }

  static Future getValue() async {
    // try {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    isLogined = await prefs.getString('isLogin2');
    print(await prefs.getString('isLogin2'));
    // } catch (e) {
    //   isLogined = null;
    // }
    return prefs.getString('isLogin2');
  }
}
