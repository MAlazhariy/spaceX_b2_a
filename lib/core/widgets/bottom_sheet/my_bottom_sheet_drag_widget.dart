import 'package:spacex/core/resources/app_colors.dart';
import 'package:spacex/core/resources/app_size.dart';
import 'package:flutter/material.dart';

class MyBottomSheetDragWidget extends StatelessWidget {
  const MyBottomSheetDragWidget({
    super.key,
    this.padding = const EdgeInsets.only(
      top: AppSize.paddingDefault,
      bottom: AppSize.paddingExtraLarge,
    ),
    this.color = kBorderNeutralColor,
  });

  final EdgeInsets padding;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: padding,
        child: Container(
          height: 7,
          width: 45,
          decoration: ShapeDecoration(
            color: color,
            shape: const StadiumBorder(),
          ),
        ),
      ),
    );
  }
}
