import 'package:flutter/material.dart';

ThemeData light = ThemeData(
  useMaterial3: false,
  fontFamily: 'Inter',
  primaryColor: const Color(0xFF1455AC),
  primaryColorLight: const Color(0xFFE9F3FF),
  primaryColorDark: const Color(0xff34428F),
  secondaryHeaderColor: const Color(0xFFF58300),
  disabledColor: const Color(0xFFAFB1B5),
  scaffoldBackgroundColor: const Color(0xFFF8F8F9),
  brightness: Brightness.light,
  hintColor: const Color(0xFFAFB1B5),
  focusColor: const Color(0xFFFFF9E5),
  hoverColor: const Color(0xFFFCFCFC),
  shadowColor: const Color(0xFFE6E5E5),
  cardColor: const Color(0xFFFFFFFF),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: const Color(0xFF1455AC),
    ),
  ),
  colorScheme: const ColorScheme.light(
    primary: Color(0xFF1455AC),
    secondary: Color(0xFFF58300),
    tertiary: Color(0xFF00AA6D),
    error: Color(0xFFFF5555),
    surface: Color(0xFFF8F8F9),
  ),
);
