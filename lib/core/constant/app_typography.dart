import 'package:flutter/material.dart';
import 'package:sixvalley/core/constant/app_colors.dart';

/// ═══════════════════════════════════════════════════════════════════════════════
/// HOW TO USE AppTypography:
/// ═══════════════════════════════════════════════════════════════════════════════
///
/// 1. DIRECT TEXT STYLE USAGE:
///    Text('Big Title', style: AppTypography.h9Bold)      // 30px Bold
///    Text('Section', style: AppTypography.h8Bold)        // 24px Bold
///    Text('Tag Label', style: AppTypography.h7SemiBold)  // 16px SemiBold
///    Text('Normal', style: AppTypography.h5Regular)      // 14px Regular
///    Text('Bold Text', style: AppTypography.h5Bold)      // 14px Bold
///    Text('Body', style: AppTypography.h4Regular)        // 13px Regular
///    Text('Label', style: AppTypography.h4SemiBold)      // 13px SemiBold
///    Text('Small', style: AppTypography.h3Regular)       // 12px Regular
///    Text('Small Bold', style: AppTypography.h3SemiBold) // 12px SemiBold
///    Text('Tiny', style: AppTypography.h2Regular)        // 11px Regular
///    Text('Tiny Bold', style: AppTypography.h2SemiBold)  // 11px SemiBold
///    Text('Caption', style: AppTypography.h1SemiBold)    // 10px SemiBold
///    Text('Caption Bold', style: AppTypography.h1Bold)   // 10px Bold
///
/// 2. CUSTOMIZE COLOR:
///    Text('Custom', style: AppTypography.h5Bold.copyWith(color: AppColors.primary))
///    Text('Error', style: AppTypography.h4Regular.copyWith(color: AppColors.error))
///
/// 3. RED ROSE FONT (add fontSize when using):
///    Text('Rose', style: AppTypography.redRoseRegular.copyWith(fontSize: 16))
///    Text('Rose Bold', style: AppTypography.redRoseBold.copyWith(fontSize: 20))
///
/// 4. USING THEME TEXT STYLES:
///    Text('Display', style: Theme.of(context).textTheme.displayLarge)   // h9Bold
///    Text('Display', style: Theme.of(context).textTheme.displayMedium)  // h8Bold
///    Text('Display', style: Theme.of(context).textTheme.displaySmall)   // h7SemiBold
///    Text('Title', style: Theme.of(context).textTheme.titleLarge)       // h4SemiBold
///    Text('Body', style: Theme.of(context).textTheme.bodyLarge)         // h3Regular
///
/// 5. FONT WEIGHTS:
///    TextStyle(fontWeight: AppTypography.regular)   // 400
///    TextStyle(fontWeight: AppTypography.medium)    // 500
///    TextStyle(fontWeight: AppTypography.semiBold)  // 600
///    TextStyle(fontWeight: AppTypography.bold)      // 700
///
/// ═══════════════════════════════════════════════════════════════════════════════

class AppTypography {
  AppTypography._();

  // ============== Font Families ==============
  static const String fontInter = 'Inter';
  static const String fontRedRose = 'RedRose';

  // Font Weights
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;

  // Heading Styles (Inter)

  // H9 - 30px Bold
  static const TextStyle h9Bold = TextStyle(
    fontFamily: fontInter,
    fontSize: 30,
    fontWeight: bold,
    color: AppColors.textColor,
  );

  // H8 - 24px Bold
  static const TextStyle h8Bold = TextStyle(
    fontFamily: fontInter,
    fontSize: 24,
    fontWeight: bold,
    color: AppColors.textColor,
  );

  // H7 - 16px Semi Bold (For Tag)
  static const TextStyle h7SemiBold = TextStyle(
    fontFamily: fontInter,
    fontSize: 16,
    fontWeight: semiBold,
    color: AppColors.textColor,
  );

  // H5 - 14px Regular
  static const TextStyle h5Regular = TextStyle(
    fontFamily: fontInter,
    fontSize: 14,
    fontWeight: regular,
    color: AppColors.textColor,
  );

  // H5 - 14px Bold
  static const TextStyle h5Bold = TextStyle(
    fontFamily: fontInter,
    fontSize: 14,
    fontWeight: bold,
    color: AppColors.textColor,
  );

  // H4 - 13px Regular
  static const TextStyle h4Regular = TextStyle(
    fontFamily: fontInter,
    fontSize: 13,
    fontWeight: regular,
    color: AppColors.textColor,
  );

  // H4 - 13px Semibold
  static const TextStyle h4SemiBold = TextStyle(
    fontFamily: fontInter,
    fontSize: 13,
    fontWeight: semiBold,
    color: AppColors.textColor,
  );

  // H3 - 12px Regular
  static const TextStyle h3Regular = TextStyle(
    fontFamily: fontInter,
    fontSize: 12,
    fontWeight: regular,
    color: AppColors.textColor,
  );

  // H3 - 12px Semibold
  static const TextStyle h3SemiBold = TextStyle(
    fontFamily: fontInter,
    fontSize: 12,
    fontWeight: semiBold,
    color: AppColors.textColor,
  );

  // H2 - 11px Regular
  static const TextStyle h2Regular = TextStyle(
    fontFamily: fontInter,
    fontSize: 11,
    fontWeight: regular,
    color: AppColors.textColor,
  );

  // H2 - 11px Semibold
  static const TextStyle h2SemiBold = TextStyle(
    fontFamily: fontInter,
    fontSize: 11,
    fontWeight: semiBold,
    color: AppColors.textColor,
  );

  // H1 - 10px Semibold
  static const TextStyle h1SemiBold = TextStyle(
    fontFamily: fontInter,
    fontSize: 10,
    fontWeight: semiBold,
    color: AppColors.textColor,
  );

  // H1 - 10px Bold
  static const TextStyle h1Bold = TextStyle(
    fontFamily: fontInter,
    fontSize: 10,
    fontWeight: bold,
    color: AppColors.textColor,
  );

  // Red Rose Font Styles
  static const TextStyle redRoseRegular = TextStyle(
    fontFamily: fontRedRose,
    fontWeight: regular,
    color: AppColors.textColor,
  );

  static const TextStyle redRoseMedium = TextStyle(
    fontFamily: fontRedRose,
    fontWeight: medium,
    color: AppColors.textColor,
  );

  static const TextStyle redRoseSemiBold = TextStyle(
    fontFamily: fontRedRose,
    fontWeight: semiBold,
    color: AppColors.textColor,
  );

  static const TextStyle redRoseBold = TextStyle(
    fontFamily: fontRedRose,
    fontWeight: bold,
    color: AppColors.textColor,
  );
}
