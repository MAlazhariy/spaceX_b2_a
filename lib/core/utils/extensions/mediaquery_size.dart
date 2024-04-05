import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

extension ContextExtension on BuildContext {
  Size get querySize => MediaQuery.of(this).size;
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  bool get isArabic => locale == const Locale('ar');

  bool get isTablet => querySize.shortestSide >= 650;
}