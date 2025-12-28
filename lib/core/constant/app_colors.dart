import 'package:flutter/material.dart';

class AppColors {
  static final ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,

    // Primary
    primary: Color(0xFF1455AC),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFE9F3FF),
    onPrimaryContainer: Color(0xFF0B2E5A),

    // Secondary
    secondary: Color(0xFFF58300),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFFFE2BF),
    onSecondaryContainer: Color(0xFF4A2A00),

    // Tertiary (Success)
    tertiary: Color(0xFF00AA6D),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFCFF3E4),
    onTertiaryContainer: Color(0xFF003824),

    // Error
    error: Color(0xFFFF5555),
    onError: Color(0xFFFFFFFF),
    errorContainer: Color(0xFFFFF4F3),
    onErrorContainer: Color(0xFF7A0000),

    // Background & surface
    background: Color(0xFFFCFCFC),
    onBackground: Color(0xFF02070E),

    surface: Color(0xFFFFFFFF),
    onSurface: Color(0xFF1C1E20),

    surfaceVariant: Color(0xFFF8F8F9),
    onSurfaceVariant: Color(0xFF595959),

    outline: Color(0xFFAFB1B5),
    outlineVariant: Color(0x2BAFB1B5), // 17% opacity

    shadow: Color(0xFF000000),
    scrim: Color(0xFF000000),

    inverseSurface: Color(0xFF1C1E20),
    onInverseSurface: Color(0xFFFFFFFF),
    inversePrimary: Color(0xFF8AB4F8),
  );

}