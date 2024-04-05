import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/core/di/dependency_injection.dart';
import 'package:spacex/core/utils/common/bloc_observer.dart';
import 'package:spacex/core/utils/common/system_overlay_style.dart';
import 'package:spacex/my_app.dart';
import 'package:flutter/material.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.wait([
    // init localization
    EasyLocalization.ensureInitialized(),
    // init Services locator (DI)
    DI.init(),
  ]);


  Bloc.observer = const MyBlocObserver();


  // set system app bar style
  SystemChrome.setSystemUIOverlayStyle(kSystemOverlayStyle);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(const MyApp());
}