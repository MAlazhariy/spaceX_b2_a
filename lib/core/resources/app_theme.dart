import 'package:flutter/material.dart';
import 'package:spacex/core/resources/app_colors.dart';
import 'package:spacex/core/resources/app_font_family.dart';
import 'package:spacex/core/resources/app_size.dart';
import 'package:spacex/core/resources/app_text_styles.dart';
import 'package:spacex/core/utils/common/system_overlay_style.dart';

class AppThemes {
  static const _disabledColor = Color(0xffCCDBE1);
<<<<<<< HEAD
  static const _inputRadius =
      BorderRadius.all(Radius.circular(AppSize.radiusMax));
  static ThemeData light = ThemeData(
=======
  static const _inputRadius = BorderRadius.all(Radius.circular(AppSize.radiusMax));
  static ThemeData dark = ThemeData(
>>>>>>> ee7acad645ac5f6810409b46302e018230dab57c
    // material 3
    useMaterial3: true,

    /// main colors
    primaryColor: kMainColor,
    colorScheme: ColorScheme.fromSeed(
      seedColor: kMainColor,
      error: kRedColor,
      outline: kBorderColor,
      shadow: kShadowColor,
    ),
    primarySwatch: kPrimarySwatch,

    scaffoldBackgroundColor: kBackgroundColor,

    /// font family
    fontFamily: FontFamily.baloo,

    /// appBar theme
    appBarTheme: const AppBarTheme(
      // centerTitle: true,
      // scrolledUnderElevation: 0,
      // elevation: 0,
      systemOverlayStyle: kSystemOverlayStyle,
    ),

    /// button theme
    buttonTheme: const ButtonThemeData(
      shape: StadiumBorder(),
      buttonColor: kMainColor,
    ),

    splashColor: kPrimaryLightColor,

    disabledColor: _disabledColor,

    /// Text Style
    textTheme: const TextTheme(
      /// Body text
      bodyMedium: TextStyle(
        fontSize: AppSize.fontDefault,
        fontWeight: FontWeight.w400,
        color: kTitleBodyColor,
      ),

      /// Header1 (Title) - 24
      displayLarge: TextStyle(
        fontSize: AppSize.fontHeader24,
        fontWeight: FontWeight.w700,
        color: kMainColor,
      ),

      /// Header2 - 20
      displayMedium: TextStyle(
        fontSize: AppSize.font20,
        fontWeight: FontWeight.w700,
        color: kTitleHeadColor,
      ),

      /// Header3 - 18px - w700 - titleHeadColor (A40)
      displaySmall: TextStyle(
        fontSize: AppSize.font18,
        fontWeight: FontWeight.w600,
        color: kTitleHeadColor,
      ),

      /// Subtitle - 18
      titleMedium: TextStyle(
        fontSize: AppSize.font18,
        fontWeight: FontWeight.w500,
        color: kSubtitleColor,
      ),

      /// Body Bold - 16
      bodyLarge: TextStyle(
        fontSize: AppSize.fontDefault,
        fontWeight: FontWeight.w700,
        color: kPrimaryTitleColor,
        height: 1.4,
      ),

      /// Body Small - 13
      bodySmall: TextStyle(
        fontSize: AppSize.fontSmall13,
        fontWeight: FontWeight.normal,
        color: kTitleBodyColor,
        height: 1.4,
      ),
    ),

    iconTheme: const IconThemeData(
      color: kBorderNeutralColor,
    ),

    /// input decoration theme
    inputDecorationTheme: const InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderRadius: _inputRadius,
        borderSide: BorderSide(
          color: kBorderOverlayColor,
          width: 1,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: _inputRadius,
        borderSide: BorderSide(
          color: kBorderNeutralColor,
          width: 1.5,
        ),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: kMainColor),
        borderRadius: _inputRadius,
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: _inputRadius,
        borderSide: BorderSide(
          color: kRedColor,
          width: 1,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: _inputRadius,
        borderSide: BorderSide(
          color: kRedColor,
          width: 1.5,
        ),
      ),
      filled: false,
      labelStyle: kHintTextStyle,
      hintStyle: kHintTextStyle,
      alignLabelWithHint: true,
      iconColor: kBorderNeutralColor,
      fillColor: Colors.white,
      prefixIconColor: kBorderNeutralColor,
      suffixIconColor: kBorderNeutralColor,
      contentPadding: EdgeInsets.symmetric(
        vertical: AppSize.paddingDefault,
        horizontal: AppSize.paddingDefault,
      ),
    ),
  );
}
