import 'package:connection_wrapper/connection_checker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:spacex/core/constants.dart';
import 'package:spacex/core/resources/app_images.dart';
import 'package:spacex/core/resources/app_theme.dart';
import 'package:spacex/features/splash/view/screens/splash_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    AssetLottie(AppLottie.splashBackground).load();
    AssetLottie(AppLottie.skyWithStars).load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ConnectionWrapper.init(
      child: MaterialApp(
        title: AppConstants.APP_NAME,
        navigatorKey: navigatorKey,
        theme: AppThemes.dark,
        debugShowCheckedModeBanner: false,
        // localization
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home: const SplashScreen(),
      ),
    );
  }
}
