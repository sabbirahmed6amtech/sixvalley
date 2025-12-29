import 'package:flutter/material.dart';
class AppColors {
  AppColors._();

  //Primary Colors
  static const Color primary = Color(0xFF1455AC);
  static const Color primaryLight = Color(0xFFE9F3FF);
  static const Color primaryLight10 = Color(0x1AE9F3FF); // 10% opacity

  //Secondary Colors
  static const Color secondary = Color(0xFFF58300);

  // Success / Positive
  static const Color success = Color(0xFF00AA6D);

  //  Warning / Attention
  static const Color warning = Color(0xFFFFAD31);

  //Cancel / Negative / Error
  static const Color error = Color(0xFFFF5555);
  static const Color errorBackground = Color(0xFFFFF4F3);

  // Text Colors
  static const Color textColor = Color(0xFF1C1E20);
  static const Color subtitle = Color(0xFF595959);
  static const Color deactive = Color(0xFFAFB1B5);
  static const Color deactive17 = Color(0x2BAFB1B5); // 17% opacity

  // Background Colors
  static const Color background = Color(0xFFF8F8F9);
  static const Color cardWhite = Color(0xFFFFFFFF);
  static const Color menuBackground = Color(0xFFFCFCFC);
  static const Color cardcustom = Color(0xFFF3F6F8);
  static const Color categorySidebar = Color(0x2BAFB1B5); // 17% opacity

  // Other
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  // Dark Theme Colors
  static const Color darkBackground = Color(0xFF02070E);
  static const Color darkTextColor = Color(0xFFFFFFFF);

  // Light Color Scheme
  static final ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: primary,
    onPrimary: white,
    primaryContainer: primaryLight,
    onPrimaryContainer: primary,
    secondary: secondary,
    onSecondary: white,
    secondaryContainer: Color(0xFFFFE2BF),
    onSecondaryContainer: Color(0xFF4A2A00),
    tertiary: success,
    onTertiary: white,
    tertiaryContainer: Color(0xFFCFF3E4),
    onTertiaryContainer: Color(0xFF003824),
    error: error,
    onError: white,
    errorContainer: errorBackground,
    onErrorContainer: Color(0xFF7A0000),
    surface: cardWhite,
    onSurface: textColor,
    surfaceContainerHighest: background,
    onSurfaceVariant: subtitle,
    outline: deactive,
    outlineVariant: deactive17,
    shadow: black,
    scrim: black,
    inverseSurface: textColor,
    onInverseSurface: white,
    inversePrimary: primaryLight,
  );

  // Dark Color Scheme
  static final ColorScheme darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: primary,
    onPrimary: white,
    primaryContainer: primaryLight,
    onPrimaryContainer: primary,
    secondary: secondary,
    onSecondary: white,
    secondaryContainer: Color(0xFFFFE2BF),
    onSecondaryContainer: Color(0xFF4A2A00),
    tertiary: success,
    onTertiary: white,
    tertiaryContainer: Color(0xFFCFF3E4),
    onTertiaryContainer: Color(0xFF003824),
    error: error,
    onError: white,
    errorContainer: errorBackground,
    onErrorContainer: Color(0xFF7A0000),
    surface: darkBackground,
    onSurface: darkTextColor,
    surfaceContainerHighest: Color(0xFF1C1E20),
    onSurfaceVariant: subtitle,
    outline: deactive,
    outlineVariant: deactive17,
    shadow: black,
    scrim: black,
    inverseSurface: white,
    onInverseSurface: darkBackground,
    inversePrimary: primaryLight,
  );
}










/// ═══════════════════════════════════════════════════════════════════════════════
/// HOW TO USE AppColors:
/// ═══════════════════════════════════════════════════════════════════════════════
///
/// 1. DIRECT COLOR USAGE:
///    Container(color: AppColors.primary)
///    Text('Hello', style: TextStyle(color: AppColors.textColor))
///    Icon(Icons.star, color: AppColors.secondary)
///
/// 2. BACKGROUND COLORS:
///    Container(color: AppColors.background)       // Page background
///    Container(color: AppColors.cardWhite)        // Card/White background
///    Container(color: AppColors.menuBackground)   // Menu background
///    Container(color: AppColors.categorySidebar)  // Sidebar with 17% opacity
///
/// 3. TEXT COLORS:
///    Text('Title', style: TextStyle(color: AppColors.textColor))    // Main text
///    Text('Subtitle', style: TextStyle(color: AppColors.subtitle))  // Subtitle/gray
///    Text('Hint', style: TextStyle(color: AppColors.deactive))      // Placeholder/hint
///
/// 4. STATUS COLORS:
///    Container(color: AppColors.success)  // Green - Success/Positive
///    Container(color: AppColors.warning)  // Orange - Warning/Attention
///    Container(color: AppColors.error)    // Red - Error/Cancel/Negative
///    Container(color: AppColors.errorBackground)  // Light red background
///
/// 5. USING WITH THEME (Recommended):
///    Container(color: Theme.of(context).colorScheme.primary)
///    Text('Hello', style: TextStyle(color: Theme.of(context).colorScheme.onSurface))
///
/// ═══════════════════════════════════════════════════════════════════════════════