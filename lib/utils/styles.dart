import 'package:flutter/material.dart';
import 'package:sixvalley/utils/dimensions.dart';

/// Light Text Styles
const TextStyle interLight = TextStyle(
  fontFamily: 'Inter',
  fontWeight: FontWeight.w300,
  fontSize: Dimensions.fontSizeSmall,
);

const TextStyle interRegular = TextStyle(
  fontFamily: 'Inter',
  fontWeight: FontWeight.w400,
);

const TextStyle interMedium = TextStyle(
  fontFamily: 'Inter',
  fontWeight: FontWeight.w500,
);

const TextStyle interSemiBold = TextStyle(
  fontFamily: 'Inter',
  fontWeight: FontWeight.w600,
);

const TextStyle interBold = TextStyle(
  fontFamily: 'Inter',
  fontWeight: FontWeight.w700,
);


const TextStyle h1Bold = TextStyle(
  fontFamily: 'Inter',
  fontSize: 30,
  fontWeight: FontWeight.w700,
);

const TextStyle h2Bold = TextStyle(
  fontFamily: 'Inter',
  fontSize: 24,
  fontWeight: FontWeight.w700,
);

const TextStyle h2SemiBold = TextStyle(
  fontFamily: 'Inter',
  fontSize: 24,
  fontWeight: FontWeight.w600,
);

const TextStyle h3SemiBold = TextStyle(
  fontFamily: 'Inter',
  fontSize: 20,
  fontWeight: FontWeight.w600,
);

const TextStyle h3Regular = TextStyle(
  fontFamily: 'Inter',
  fontSize: 20,
  fontWeight: FontWeight.w400,
);

const TextStyle h4SemiBold = TextStyle(
  fontFamily: 'Inter',
  fontSize: 16,
  fontWeight: FontWeight.w600,
);

const TextStyle h4Regular = TextStyle(
  fontFamily: 'Inter',
  fontSize: 16,
  fontWeight: FontWeight.w400,
);

const TextStyle h5Bold = TextStyle(
  fontFamily: 'Inter',
  fontSize: 14,
  fontWeight: FontWeight.w700,
);

const TextStyle h5Regular = TextStyle(
  fontFamily: 'Inter',
  fontSize: 14,
  fontWeight: FontWeight.w400,
);

const TextStyle h7SemiBold = TextStyle(
  fontFamily: 'Inter',
  fontSize: 12,
  fontWeight: FontWeight.w600,
);
const TextStyle h7Light = TextStyle(
  fontFamily: 'Inter',
  fontSize: 12,
  fontWeight: FontWeight.w400,
);


/// Light shadow for cards
const List<BoxShadow> cardShadow = [
  BoxShadow(
    offset: Offset(0, 2),
    blurRadius: 8,
    spreadRadius: 0,
    color: Color(0x15000000),
  ),
];

/// Subtle shadow for floating elements
const List<BoxShadow> subtleShadow = [
  BoxShadow(
    offset: Offset(0, 1),
    blurRadius: 3,
    spreadRadius: 0,
    color: Color(0x0F000000),
  ),
];

/// Shadow for search bars
const List<BoxShadow> searchBoxShadow = [
  BoxShadow(
    offset: Offset(0, 4),
    blurRadius: 12,
    spreadRadius: 0,
    color: Color(0x1A000000),
  ),
];

/// Shadow for bottom sheets
const List<BoxShadow> bottomSheetShadow = [
  BoxShadow(
    offset: Offset(0, -2),
    blurRadius: 10,
    spreadRadius: 0,
    color: Color(0x20000000),
  ),
];


/// Card decoration with shadow
final BoxDecoration cardDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
  boxShadow: cardShadow,
);

/// Border decoration for input fields
final BoxDecoration inputFieldDecoration = BoxDecoration(
  color: const Color(0xFFF8F8F9),
  borderRadius: BorderRadius.circular(Dimensions.radiusMedium),
  border: Border.all(
    color: const Color(0xFFAFB1B5),
    width: 1,
  ),
);

/// Shimmer decoration - light
final BoxDecoration shimmerDecorationLight = BoxDecoration(
  color: Colors.grey[300],
  borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
);

/// Shimmer decoration - dark
final BoxDecoration shimmerDecorationDark = BoxDecoration(
  color: Colors.grey[700],
  borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
);

/// Rounded container decoration
final BoxDecoration roundedDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
);

