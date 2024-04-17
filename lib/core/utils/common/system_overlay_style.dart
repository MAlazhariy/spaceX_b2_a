import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spacex/core/resources/app_colors.dart';

const kSystemOverlayStyle = SystemUiOverlayStyle(
  // Status bar color
  statusBarColor: Colors.transparent,
  systemNavigationBarColor: Colors.transparent,
  systemNavigationBarDividerColor: kMainColor,
  // Status bar brightness (optional)
  statusBarIconBrightness: Brightness.light, // For Android (light icons)
  systemNavigationBarIconBrightness: Brightness.light,
  statusBarBrightness: Brightness.dark, // For iOS (light icons)
);
