import 'package:flutter/material.dart';

Future<T?> pushTo<T>(BuildContext context, Widget screen) async {
  return await Navigator.push<T>(
    context,
    MaterialPageRoute(
      builder: (context) => screen,
    ),
  );
}

Future<T?> pushToSlideX<T>(BuildContext context, Widget screen) async {
  return await Navigator.push<T>(
    context,
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => screen,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final tween = Tween(
          begin: const Offset(1, 0),
          end: const Offset(0, 0),
        ).chain(
          CurveTween(curve: Curves.easeInOut),
        );

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    ),
  );
}
