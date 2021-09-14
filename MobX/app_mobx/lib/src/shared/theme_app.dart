import 'package:flutter/material.dart';

import 'components/decoration_style.dart';

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
      inputDecorationTheme: DecorationStyle.text,
    );
  }

  ThemeData? get getThemeData => _themeApp;
}
