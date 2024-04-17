import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spacex/core/resources/app_colors.dart';

const kSystemOverlayStyle = SystemUiOverlayStyle(
  // Status bar color
  statusBarColor: Colors.transparent,
  statusBarIconBrightness: Brightness.light, // For Android (light icons)
  statusBarBrightness: Brightness.dark, // For iOS (light icons)

  systemNavigationBarColor: Colors.transparent,
  systemNavigationBarDividerColor: Colors.white,
  systemNavigationBarIconBrightness: Brightness.dark,
);
