import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:spacex/core/constants.dart';
import 'package:spacex/core/resources/app_theme.dart';
import 'package:spacex/features/rocket/view/screens/rockets_screen.dart';
import 'package:spacex/features/splash/view/screens/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.APP_NAME,
      navigatorKey: navigatorKey,
      theme: AppThemes.light,
      debugShowCheckedModeBanner: false,
      // localization
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
   //   home: RocketsScreen(),
      home: const SplashScreen(),
    );
  }
}