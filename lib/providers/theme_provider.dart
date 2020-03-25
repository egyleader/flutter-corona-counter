import 'package:corona/themes/dark_theme.dart';
import 'package:corona/themes/light_theme.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _selectedTheme;

  ThemeProvider({bool isDarkMode}) {
    this._selectedTheme = isDarkMode ? darkTheme : lightTheme;
  }

  getTheme() => _selectedTheme;

  void switchTheme() {
    _selectedTheme = _selectedTheme == darkTheme ? lightTheme : darkTheme;
    notifyListeners();
  }

  bool isDark() => _selectedTheme == darkTheme ? true : false;

  // setTheme(ThemeData themeData) async {
  //   _selectedTheme = themeData;
  //   notifyListeners();
  // }
}
