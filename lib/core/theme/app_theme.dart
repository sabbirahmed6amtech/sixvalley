import 'package:flutter/material.dart';
import 'package:sixvalley/core/constant/app_colors.dart';
import 'package:sixvalley/core/constant/app_typography.dart';

/// ═══════════════════════════════════════════════════════════════════════════════
/// HOW TO USE AppTheme:
/// ═══════════════════════════════════════════════════════════════════════════════
///
/// 1. SETUP IN main.dart (Already configured):
///    MaterialApp(
///      theme: AppTheme.lightTheme,
///      darkTheme: AppTheme.darkTheme,
///      themeMode: ThemeMode.light,  // or ThemeMode.dark or ThemeMode.system
///    )
///
/// 2. ACCESS THEME COLORS:
///    Theme.of(context).colorScheme.primary       // Primary blue
///    Theme.of(context).colorScheme.secondary     // Secondary orange
///    Theme.of(context).colorScheme.error         // Error red
///    Theme.of(context).colorScheme.surface       // Card background
///    Theme.of(context).colorScheme.onSurface     // Text on surface
///
/// 3. ACCESS THEME TEXT STYLES:
///    Theme.of(context).textTheme.displayLarge    // h9Bold - 30px
///    Theme.of(context).textTheme.displayMedium   // h8Bold - 24px
///    Theme.of(context).textTheme.displaySmall    // h7SemiBold - 16px
///    Theme.of(context).textTheme.headlineMedium  // h5Bold - 14px
///    Theme.of(context).textTheme.headlineSmall   // h5Regular - 14px
///    Theme.of(context).textTheme.titleLarge      // h4SemiBold - 13px
///    Theme.of(context).textTheme.titleMedium     // h4Regular - 13px
///    Theme.of(context).textTheme.titleSmall      // h3SemiBold - 12px
///    Theme.of(context).textTheme.bodyLarge       // h3Regular - 12px
///    Theme.of(context).textTheme.bodyMedium      // h2Regular - 11px
///    Theme.of(context).textTheme.bodySmall       // h1SemiBold - 10px
///    Theme.of(context).textTheme.labelSmall      // h1Bold - 10px
///
/// 4. SCAFFOLD BACKGROUND:
///    Scaffold() // Automatically uses AppColors.background (light) or darkBackground (dark)
///
/// 5. BUTTONS (Auto-styled):
///    ElevatedButton(onPressed: () {}, child: Text('Primary Button'))
///    OutlinedButton(onPressed: () {}, child: Text('Outlined Button'))
///
/// 6. TEXT FIELDS (Auto-styled):
///    TextField(decoration: InputDecoration(hintText: 'Enter text'))
///
/// 7. CARDS (Auto-styled):
///    Card(child: Text('Card content'))
///
/// 8. SWITCH THEME PROGRAMMATICALLY:
///    // Use a state management solution (Provider, Riverpod, etc.)
///    // to toggle between ThemeMode.light and ThemeMode.dark
///
/// ═══════════════════════════════════════════════════════════════════════════════

class AppTheme {
  AppTheme._();

  // ============== Light Theme ==============
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: AppColors.lightColorScheme,
    scaffoldBackgroundColor: AppColors.background,
    fontFamily: AppTypography.fontInter,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.cardWhite,
      foregroundColor: AppColors.textColor,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: AppTypography.h7SemiBold,
    ),
    cardTheme: const CardThemeData(color: AppColors.cardWhite, elevation: 0),
    textTheme: const TextTheme(
      displayLarge: AppTypography.h9Bold,
      displayMedium: AppTypography.h8Bold,
      displaySmall: AppTypography.h7SemiBold,
      headlineMedium: AppTypography.h5Bold,
      headlineSmall: AppTypography.h5Regular,
      titleLarge: AppTypography.h4SemiBold,
      titleMedium: AppTypography.h4Regular,
      titleSmall: AppTypography.h3SemiBold,
      bodyLarge: AppTypography.h3Regular,
      bodyMedium: AppTypography.h2Regular,
      bodySmall: AppTypography.h1SemiBold,
      labelLarge: AppTypography.h4SemiBold,
      labelMedium: AppTypography.h3SemiBold,
      labelSmall: AppTypography.h1Bold,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        textStyle: AppTypography.h4SemiBold,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primary,
        side: const BorderSide(color: AppColors.primary),
        textStyle: AppTypography.h4SemiBold,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.cardWhite,
      hintStyle: AppTypography.h4Regular.copyWith(color: AppColors.deactive),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.deactive),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.deactive),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.primary),
      ),
    ),
  );

  // ============== Dark Theme ==============
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: AppColors.darkColorScheme,
    scaffoldBackgroundColor: AppColors.darkBackground,
    fontFamily: AppTypography.fontInter,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkBackground,
      foregroundColor: AppColors.darkTextColor,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: AppTypography.h7SemiBold.copyWith(
        color: AppColors.darkTextColor,
      ),
    ),
    cardTheme: const CardThemeData(color: Color(0xFF1C1E20), elevation: 0),
    textTheme: TextTheme(
      displayLarge: AppTypography.h9Bold.copyWith(
        color: AppColors.darkTextColor,
      ),
      displayMedium: AppTypography.h8Bold.copyWith(
        color: AppColors.darkTextColor,
      ),
      displaySmall: AppTypography.h7SemiBold.copyWith(
        color: AppColors.darkTextColor,
      ),
      headlineMedium: AppTypography.h5Bold.copyWith(
        color: AppColors.darkTextColor,
      ),
      headlineSmall: AppTypography.h5Regular.copyWith(
        color: AppColors.darkTextColor,
      ),
      titleLarge: AppTypography.h4SemiBold.copyWith(
        color: AppColors.darkTextColor,
      ),
      titleMedium: AppTypography.h4Regular.copyWith(
        color: AppColors.darkTextColor,
      ),
      titleSmall: AppTypography.h3SemiBold.copyWith(
        color: AppColors.darkTextColor,
      ),
      bodyLarge: AppTypography.h3Regular.copyWith(
        color: AppColors.darkTextColor,
      ),
      bodyMedium: AppTypography.h2Regular.copyWith(
        color: AppColors.darkTextColor,
      ),
      bodySmall: AppTypography.h1SemiBold.copyWith(
        color: AppColors.darkTextColor,
      ),
      labelLarge: AppTypography.h4SemiBold.copyWith(
        color: AppColors.darkTextColor,
      ),
      labelMedium: AppTypography.h3SemiBold.copyWith(
        color: AppColors.darkTextColor,
      ),
      labelSmall: AppTypography.h1Bold.copyWith(color: AppColors.darkTextColor),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        textStyle: AppTypography.h4SemiBold,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primaryLight,
        side: const BorderSide(color: AppColors.primary),
        textStyle: AppTypography.h4SemiBold,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFF1C1E20),
      hintStyle: AppTypography.h4Regular.copyWith(color: AppColors.deactive),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.deactive),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.deactive),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.primary),
      ),
    ),
  );
}
