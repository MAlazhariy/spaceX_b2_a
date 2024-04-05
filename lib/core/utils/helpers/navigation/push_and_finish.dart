import 'package:flutter/material.dart';

Future<void> pushAndFinish(
  BuildContext context,
  Widget screen,
) async {
  await Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => screen),
    (route) => false,
  );
}
