import 'package:shared_preferences/shared_preferences.dart';

class PrefManager {
  static late SharedPreferences pref;
  static init() async {
    pref = await SharedPreferences.getInstance();
  }

  static saveThemeMode(bool newTheme) {
    pref.setBool("theme", newTheme);
  }

  static bool getThemeMode() {
    return pref.getBool("theme")?? false;
  }
}
