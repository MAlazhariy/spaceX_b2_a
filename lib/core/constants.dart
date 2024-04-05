// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class AppConstants {
  // URI
  static const String ROOT = '';
  static const String BASE_URL = '$ROOT/api';

  static const String LOGIN = '/auth/login';


  // Strings
  // todo: enter constant appName
  static const String APP_NAME = '';

  // Shared preferences keys
  static const String TOKEN = '/token';
  static const String FIRST_LAUNCH_KEY = '/first_launch';

  // Global
  static const String GUEST_TOKEN = '-';
  static const double BANNER_ASPECT_RATIO = 380 / 140;
}