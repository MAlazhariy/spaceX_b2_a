import 'package:flutter/material.dart';
import 'package:spacex/core/utils/helpers/navigation/push_to.dart' as pt;

extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this)
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(
    String routeName, {
    Object? arguments,
    required RoutePredicate predicate,
  }) {
    return Navigator.of(this)
        .pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }

  Future<T?> pushTo<T>(Widget screen) async {
    return await Navigator.push<T>(
      this,
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );
  }

  Future<T?> pushToSlideX<T>(Widget screen) async {
    return await pt.pushToSlideX(this, screen);
  }

  void pop<T extends Object?>() {
    return Navigator.pop<T>(this);
  }
}
