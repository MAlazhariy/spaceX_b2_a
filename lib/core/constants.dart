// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class AppConstants {
  // URI
  static const String BASE_URL = 'https://api.spacexdata.com/v4';

  static const String ROCKETS = '/rockets';
  static const String ALL_LAUNCHES = '/launches';
  static const String NEXT_LAUNCH = '/launches/next';
  static const String UPCOMING_LAUNCHES = '/launches/upcoming';
  static const String PAST_LAUNCHES = '/launches/past';
  static const String DRAGONS = '/dragons';
  static const String SHIPS = '/ships';
  static const String CAPSULES = '/capsules';

  // Strings
  static const String APP_NAME = 'SpaceX';

  // Shared preferences keys
  static const String TOKEN = '/token';
  static const String FIRST_LAUNCH_KEY = '/first_launch';

  // Global
  static const String GUEST_TOKEN = '-';
  static const double BANNER_ASPECT_RATIO = 380 / 140;
}