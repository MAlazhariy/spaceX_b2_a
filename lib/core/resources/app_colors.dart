import 'package:flutter/material.dart';

// Brand Colors
const kMainColor = Color(0xff0b0b0b);
const kSecondaryColor = Color(0xff1B1A40);
const kPrimaryLightColor = Color(0xffE5EDF0);

// Text Colors
const kPrimaryTitleColor = Color(0xFF0A0606);
const kTitleHeadColor = Color(0xFF404040);
const kTitleBodyColor = Color(0xFF828282);
const kTitleBodyLightColor = Color(0x5C828282);
const kSubtitleColor = Color(0xffa6a6a6);
const kTitleGreyColor = Color(0xff8F8F8F);
const kTitleLightColor = kBorderOverlayColor;
const kTitleDarkColor = Color(0xFF2B2B2B);

// Custom Colors
const kBorderColor = Color(0xfff0f0f0);
const kBorderOverlayColor = Color(0xfff7f7f7);
const kBorderNeutralColor = Color(0xffe0e0e0);
const kStrokeColor = Color(0xFF828282);
const kShadowColor = Color(0xFFF0F0F0);
/// link
const kLightGreyColor = Color(0xFFE8E8E8);
const kGreyColor = Color(0xFFEDEDED);

// Background Colors
const kBackgroundColor = Color(0xff1a1a1a);

// Shimmer Colors
final shimmerBaseColor = kLightGreyColor.withOpacity(0.23);
final shimmerHighlightColor = kLightGreyColor.withOpacity(0.50);


// System Colors
const kRedColor = Color(0xFFFF5C68);
const kGreenColor = Color(0xff6FD39A);
const kYellowOverlayColor = Color(0xffEFD01D);
const kBlueOverlayColor = Color(0xff1C72E3);

// Secondary Colors
const kSecondaryLightBlueColor = Color(0xffE8F3F8);
const kSecondaryLightOrangeColor = Color(0xffFFEFE3);
const kSecondaryOrangeColor = Color(0xffFFC091);
const kSecondaryPinkColor = Color(0xffe0b1cd);

// Main Primary Swatch
const MaterialColor kPrimarySwatch = MaterialColor(
  0xff0b0b0b,
  <int, Color>{
    50: Color(0xff020202), //10%
    100: Color(0xff040404), //20%
    200: Color(0xff070707), //30%
    300: Color(0xff090909), //40%
    400: Color(0xff0b0b0b), //50% DEFAULT
    500: Color(0xff3c3c3c), //60%
    600: Color(0xff6d6d6d), //70%
    700: Color(0xff9d9d9d), //80%
    800: Color(0xffcecece), //90%
    900: Color(0xffffffff), //100%
  },
);

const _kListColors = <Color>[
  kMainColor,
  kSecondaryPinkColor,
  kSecondaryOrangeColor,
];

Color getListItemColor(int index) {
  return _kListColors[index % _kListColors.length];
}
