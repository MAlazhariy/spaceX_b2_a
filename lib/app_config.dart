import 'package:flutter/material.dart';

enum AppEnvironment {
  dev,
  // stage,
  production,
}

class AppConfig extends InheritedWidget {
  final AppEnvironment appEnvironment;
  final String appName;
  final String description;
  final String baseUrl;

  const AppConfig({
    super.key,
    required this.appEnvironment,
    required this.appName,
    required this.description,
    required this.baseUrl,
    required super.child,
  });

  static AppConfig? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
