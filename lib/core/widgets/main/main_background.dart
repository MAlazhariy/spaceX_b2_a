import 'package:spacex/core/resources/app_colors.dart';
import 'package:flutter/material.dart';

class MainBackground extends StatelessWidget {
  const MainBackground({
    super.key,
    this.child,
    this.paddingTop = true,
  });

  final Widget? child;
  final bool paddingTop;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            kMainColor,
            // kBGGradientWhiteTransparentColor,
            // kBGGradientWhiteTransparentColor,
            // kBGGradientWhiteTransparentColor,
            // kBGGradientWhiteTransparentColor,
            // kBGGradientWhiteTransparentColor,
            Colors.white,
            Colors.white,
            Colors.white,
            Colors.white,
            Colors.white,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      padding: paddingTop ? EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
      ) : null,
      child: child,
    );
  }
}
