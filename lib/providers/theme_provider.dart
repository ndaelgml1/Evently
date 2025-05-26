import 'package:evently/pref_manager.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  init() {
    bool result = PrefManager.getThemeMode();
    if (result) {
      themeMode = ThemeMode.dark;
    } else {
      themeMode = ThemeMode.light;
    }
  }

  changeTheme(ThemeMode newTheme) {
    themeMode = newTheme;
    notifyListeners();
  }
}
