import 'package:spacex/core/resources/app_colors.dart';
import 'package:spacex/core/resources/app_size.dart';
import 'package:flutter/material.dart';

class DashLineDivider extends StatelessWidget {
  final double dashHeight;
  final double dashWith;
  final Color dashColor;

  ///  totalDashSpace/totalSpace .. from 0 : 1.
  final double fillRate;
  final Axis direction;
  final double padding;

  const DashLineDivider({
    super.key,
    this.dashHeight = 1,
    this.dashWith = 6,
    this.dashColor = kBorderNeutralColor,
    this.fillRate = 0.65,
    this.direction = Axis.horizontal,
    this.padding = AppSize.paddingDefault,
  });

  @override
  Widget build(BuildContext context) {
    final isHorizontal = direction == Axis.horizontal;

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: isHorizontal ? padding : 0,
        horizontal: isHorizontal ? 0 : padding,
      ),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final boxSize = direction == Axis.horizontal
              ? constraints.constrainWidth()
              : constraints.constrainHeight();
          final dCount = (boxSize * fillRate / dashWith).floor();
          return Flex(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            direction: direction,
            children: List.generate(dCount, (_) {
              return SizedBox(
                width: isHorizontal ? dashWith : dashHeight,
                height: isHorizontal ? dashHeight : dashWith,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: dashColor),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
