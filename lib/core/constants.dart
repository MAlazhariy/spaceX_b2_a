// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class AppConstants {
  // URI
  static const String BASE_URL = 'https://api.spacexdata.com/v4';

  static const String ROCKETS = '/rocket';

  // Strings
  static const String APP_NAME = 'SpaceX';

  // Shared preferences keys
  static const String TOKEN = '/token';
  static const String FIRST_LAUNCH_KEY = '/first_launch';

  // Global
  static const String GUEST_TOKEN = '-';
  static const double BANNER_ASPECT_RATIO = 380 / 140;

static const BaseUrl_Laaunches= 'https://api.spacexdata.com/v3';
static const Launches_Screen='/';


}
