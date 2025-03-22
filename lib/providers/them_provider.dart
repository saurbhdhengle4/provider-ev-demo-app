import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  ThemeMode get themeMode => _isDarkMode ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  Color get containerColor => _isDarkMode ? Color(0xFF1D2939) : Colors.white;
  Color get backgroundColor =>
      _isDarkMode ? Color(0xFF171A20) : Color(0xFFFDFAF6);
}
