import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:spacex/core/resources/app_images.dart';
import 'package:spacex/core/resources/app_size.dart';
import 'package:spacex/core/utils/extensions/context_extension.dart';
import 'package:spacex/core/widgets/main/main_background.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainGalaxyBackground(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                width: double.maxFinite,
                height: 250,
                margin: const EdgeInsets.all(AppSize.paddingLarge),
                padding: const EdgeInsets.all(AppSize.paddingLarge),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.radiusDefault),
                  color: Colors.white54,
                ),
                child: Stack(
                  alignment: AlignmentDirectional.centerEnd,
                  children: [
                    Lottie.asset(
                      AppLottie.circlesPlanetLoading,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    Row(
                      children: [
                        Text(
                          'Next launch',
                          style: context.styleHeader1,
                        ),

                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
