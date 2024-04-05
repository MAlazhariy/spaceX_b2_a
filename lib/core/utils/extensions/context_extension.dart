import 'package:spacex/core/resources/app_colors.dart';
import 'package:spacex/core/resources/app_size.dart';
import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {

  /// Title/Header - 24px - w700 - mainColor
  TextStyle get styleHeader1 => Theme.of(this).textTheme.displayLarge!;
  /// H2  - 20px - w700 - kTitleHeadColor (A40)
  TextStyle get styleHeader2 => Theme.of(this).textTheme.displayMedium!;
  /// H3 - 18px - w600 - kTitleHeadColor (A40)
  TextStyle get styleHeader3 => Theme.of(this).textTheme.displaySmall!;
  /// medium - 18px - w500 - kSubtitleColor (9A6)
  TextStyle get styleSubtitle => Theme.of(this).textTheme.titleMedium!;
  /// regular - 14px - mainColor
  TextStyle get styleRegular14Btn => Theme.of(this).textTheme.displayLarge!.copyWith(
    color: kMainColor,
    fontSize: AppSize.fontSmall14,
    fontWeight: FontWeight.normal,
  );
  /// regular - 14px - mainColor
  TextStyle get styleRegular14 => Theme.of(this).textTheme.bodyMedium!.copyWith(
    fontSize: AppSize.fontSmall14,
    fontWeight: FontWeight.normal,
  );
  /// Body Bold - 16px - 700 - kPrimaryTitleColor (51B)
  TextStyle get styleBodyBold => Theme.of(this).textTheme.bodyLarge!;
  /// body small - 13px - kTitleBodyColor (83)
  TextStyle get styleBodySmall => Theme.of(this).textTheme.bodySmall!;
}