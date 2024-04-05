import 'dart:io';

import 'package:flutter/material.dart';
import 'package:spacex/core/resources/app_colors.dart';

class MainCircularProgress extends StatelessWidget {
  final bool loading;

  const MainCircularProgress({
    super.key,
    this.color = kMainColor,
    this.strokeWidth = 4,
    this.size,
    this.loading = true,
  });

  final Color color;
  final double strokeWidth;
  final double? size;

  @override
  Widget build(BuildContext context) {
    if(loading == false){
      return const SizedBox.shrink();
    }

    return SizedBox.square(
      dimension: size,
      child: CircularProgressIndicator.adaptive(
        valueColor: AlwaysStoppedAnimation<Color>(color),
        backgroundColor: Platform.isIOS ? color : null,
        strokeWidth: strokeWidth,
      ),
    );
  }
}
