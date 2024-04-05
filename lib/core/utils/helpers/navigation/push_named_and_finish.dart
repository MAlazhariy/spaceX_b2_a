import 'package:flutter/material.dart';

Future<void> pushNamedAndFinish(
  BuildContext context,
  String namedScreen,
) async {
  await Navigator.pushNamedAndRemoveUntil(
    context,
    namedScreen,
    (route) => false,
  );
}
