import 'package:app_mobx/src/shared/tools/const.dart';
import 'package:flutter/material.dart';

class DecorationStyle {
  static get text {
    return InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          Const.roundTextField,
        ),
      ),
    );
  }
}
