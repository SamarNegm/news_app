import 'package:shared_preferences/shared_preferences.dart';

class cacheHelper {
  static SharedPreferences sharedPreferences;
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> putData(bool isDark) {
    return sharedPreferences.setBool('isDark', isDark);
  }

  static bool getData() {
    return sharedPreferences.getBool('isDark') ?? false;
  }
}
