import 'package:flutter/material.dart';
import 'package:spacex/core/resources/app_colors.dart';
import 'package:spacex/core/resources/app_images.dart';

class PlaceHolderLogo extends StatelessWidget {
  const PlaceHolderLogo({
    super.key,
    this.height,
    this.width,
  });

  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kLightGreyColor,
      height: height,
      width: width,
      alignment: Alignment.center,
      child: Image.asset(
      height: 40,
      color: kBorderNeutralColor,
        fit: BoxFit.contain,
        AppImages.logo,
      ),
    );
  }
}
