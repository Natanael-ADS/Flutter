import 'package:flutter/material.dart';

class ThemeApp {
  static const primaryColor = Colors.teal;
  ColorScheme? _colorSelectionAndButton;
  ThemeData? _themeApp;

  ThemeApp() {
    _colorSelectionAndButton = ThemeData().colorScheme.copyWith(
          primary: primaryColor,
          secondary: primaryColor,
        );

    _themeApp = ThemeData(
      primaryColor: primaryColor,
      colorScheme: _colorSelectionAndButton,
    );
  }

  ThemeData? get getThemeData => _themeApp;
}
