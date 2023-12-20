import 'package:flutter/material.dart';

class AppColors {
  static const MaterialColor primaryPalette =
      MaterialColor(_primaryPalettePrimaryValue, <int, Color>{
    50: Color(0xFFffebee),
    100: Color(0xFFffcdd2),
    200: Color(0xFFef9a9a),
    300: Color(0xFFe57373),
    400: Color(0xFFef5350),
    500: Color(_primaryPalettePrimaryValue),
    600: Color(0xFFe53935),
    700: Color(0xFFd32f2f),
    800: Color(0xFFc62828),
    900: Color(0xFFb71c1c),
  });
  static const int _primaryPalettePrimaryValue = 0xFFEB5353;

  static const MaterialColor primaryPaletteAccent =
      MaterialColor(_primaryPaletteAccentValue, <int, Color>{
    100: Color(0xFFff8a80),
    200: Color(_primaryPaletteAccentValue),
    400: Color(0xFFff1744),
    700: Color(0xFFd50000),
  });
  static const int _primaryPaletteAccentValue = 0xFFff5252;

  static const Color primaryBlack1 = Color(0xFF2B3243);

  static const Color colorGrey1 = Color(0xFFD9D9D9);
  static const Color inputBG = Color(0xFFF6F6F6);
  static const Color colorViolet = Color(0xFF9EA1D4);
  static const Color colorSecondaryBlack = Color(0xFF3B4254);
}
