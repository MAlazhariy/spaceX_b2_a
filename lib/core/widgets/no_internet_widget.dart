import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:spacex/core/resources/app_images.dart';
import 'package:spacex/core/resources/app_size.dart';
import 'package:spacex/core/utils/extensions/context_extension.dart';

class NoInternetWidget extends StatelessWidget {
  const NoInternetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(
          AppLottie.astronautNoInternet,
        ),
        const SizedBox(height: AppSize.paddingExtraLarge),
        Text(
          'No internet connection!',
          style: context.styleHeader1.copyWith(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
