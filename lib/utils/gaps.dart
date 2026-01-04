import 'package:flutter/material.dart';

class Gaps {
  Gaps._();

  // Horizontal Gaps
  static const SizedBox hGapXSmall = SizedBox(width: 4);
  static const SizedBox hGapSmall = SizedBox(width: 8);
  static const SizedBox hGapMedium = SizedBox(width: 12);
  static const SizedBox hGapDefault = SizedBox(width: 16);
  static const SizedBox hGapLarge = SizedBox(width: 20);
  static const SizedBox hGapExtraLarge = SizedBox(width: 24);

  // Vertical Gaps
  static const SizedBox vGapXSmall = SizedBox(height: 4);
  static const SizedBox vGapSmall = SizedBox(height: 8);
  static const SizedBox vGapMedium = SizedBox(height: 12);
  static const SizedBox vGapDefault = SizedBox(height: 16);
  static const SizedBox vGapLarge = SizedBox(height: 20);
  static const SizedBox vGapExtraLarge = SizedBox(height: 24);
  static const SizedBox vGapExtraXLarge = SizedBox(height: 40);

  // Dividers
  static const SizedBox dividerSmall = SizedBox(height: 1);
  static const SizedBox dividerDefault = SizedBox(height: 2);
  static const SizedBox dividerLarge = SizedBox(height: 4);

  // Custom Gaps
  static SizedBox horizontalGapOf(double width) => SizedBox(width: width);
  static SizedBox verticalGapOf(double height) => SizedBox(height: height);
  static SizedBox bothGapOf(double height, double width) => SizedBox(height: height, width: width);
}
