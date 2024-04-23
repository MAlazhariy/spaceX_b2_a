import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:spacex/core/resources/app_images.dart';
import 'package:spacex/features/language/data/model/language_model.dart';

class Language {
  static const List<LanguageModel> _languages = [
    // LanguageModel(image: AppImages.arFlag, title: 'العربية', code: 'ar'),
    LanguageModel(image: AppImages.enFlag, title: 'English', code: 'en'),
  ];

  static List<LanguageModel> get languages => _languages;

  static List<Locale> locales = _languages.map((e) => e.locale).toList();

  static Locale getCurrentLocale(BuildContext context) {
    return context.locale;
  }

  static bool isRtl(BuildContext context) =>
      context.locale.languageCode == 'ar';

  static Future<void> changeLanguage(
    BuildContext context, {
    required Locale locale,
  }) async {
    return await context.setLocale(locale);
  }
}
