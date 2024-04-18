import 'package:flutter/material.dart';

// Brand Colors
const kMainColor = Color(0xff29C1FD);
const kPrimaryColor = Color(0xff1B1A40);
const kPrimaryLightColor = Color(0xffE5EDF0);

// Text Colors
const kPrimaryTitleColor = Color(0xFF0F151B);
const kTitleHeadColor = Color(0xFF1B1A40);
const kTitleBodyColor = Color(0xFF5B7083);
const kTitleBodyLightColor = Color(0x5B708380);
const kSubtitleColor = Color(0xff8899A6);
const kTitleGreyColor = Color(0xff8F8F8F);
const kTitleLightColor = kBorderOverlayColor;
const kTitleDarkColor = Color(0xFF2B2712);

// Custom Colors
const kBorderColor = Color(0xffE5EDF0);
const kBorderOverlayColor = Color(0xffE8F3F8);
const kBorderNeutralColor = Color(0xffCCDBE1);
const kStrokeColor = Color(0xFF5B7083);
const kShadowColor = Color(0xFFE5EDF0);

/// link
const kLightGreyColor = Color(0xFFE8E8E8);
const kGreyColor = Color(0xFFDFE2EC);

// Background Colors
const kBackgroundColor = Color(0xffF6F9FA);
/*const kBackgroundColor = Color(0xffE5EDF0);*/
// const kBGGradientColor = Color(0xffE7F7F7);
// const kBGGradientColor = Color(0xffe9f6f6);
const kBGGradientColor = Color(0xffecf8f8);
const kBGGradientWhiteTransparentColor = Color(0x00ffffff);
const kBGGradient2Color = Color(0xffc3f2ff);

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
// const kSecondaryPinkColor = Color(0xffFFD7EF);
const kSecondaryPinkColor = Color(0xffe0b1cd);

// Main Primary Swatch
const MaterialColor kPrimarySwatch = MaterialColor(
  0xff29C1FD,
  <int, Color>{
    50: Color(0xffe6f5fe), //10%
    100: Color(0xffb5e8fd), //20%
    200: Color(0xff84d1fc), //30%
    300: Color(0xff53bbfb), //40%
    400: Color(0xff29C1FD), //50% DEFAULT
    500: Color(0xff1d99f5), //60%
    600: Color(0xff1271ed), //70%
    700: Color(0xff0849e5), //80%
    800: Color(0xff0421dd), //90%
    900: Color(0xff0000d5), //100%
  },
);

/*const _kListColors = <Color>[
  // Color(0xFFB2DFDB),
  // Color(0xFF90CAF9),
  // Color(0xFFF8BBD0),
  // Color(0xFFC5CAE9),
  // Color(0xFFC8E6C9),
  // Color(0xFFD1C4E9),

  kSecondaryLightBlueColor,
  kSecondaryLightOrangeColor,
  Color(0xFFE7F7F7),
];*/

const _kListColors = <Color>[
  kMainColor,
  kSecondaryPinkColor,
  kSecondaryOrangeColor,
];

Color getListItemColor(int index) {
  return _kListColors[index % _kListColors.length];
}
