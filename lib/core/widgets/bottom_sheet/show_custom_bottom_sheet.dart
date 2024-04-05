import 'package:spacex/core/widgets/bottom_sheet/bottom_sheet_shape.dart';
import 'package:spacex/core/widgets/bottom_sheet/custom_bottom_sheet_action.dart';
import 'package:flutter/material.dart';

Future<void> showCustomBottomSheet({
  required BuildContext context,
  required String title,
  String? subTitle,
  required Widget button,
  bool showCancel = true,
}) async {
  return await showModalBottomSheet(
    context: context,
    shape: MyBottomSheetShape(),
    isScrollControlled: true,
    backgroundColor: Colors.white,
    useSafeArea: true,
    builder: (context) => CustomBottomSheetAction(
      title: title,
      subTitle: subTitle,
      button: button,
      showCancel: showCancel,
    ),
  );
}