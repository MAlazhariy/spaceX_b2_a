import 'package:lottie/lottie.dart';
import 'package:spacex/core/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:spacex/core/resources/app_images.dart';

class MainGalaxyBackground extends StatelessWidget {
  const MainGalaxyBackground({
    super.key,
    this.child,
    this.paddingTop = true,
  });

  final Widget? child;
  final bool paddingTop;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          margin: paddingTop || true
              ? EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top,
                )
              : null,
          color: kSkyBackgroundColor,
          child: Lottie.asset(
            AppLottie.skyWithStars,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
            fit: BoxFit.cover,
          ),
        ),
<<<<<<< HEAD
      ),
      padding: paddingTop
          ? EdgeInsets.only(
              top: MediaQuery.of(context).padding.top,
            )
          : null,
      child: child,
=======
        if (child != null) child!,
      ],
>>>>>>> ee7acad645ac5f6810409b46302e018230dab57c
    );
  }
}
