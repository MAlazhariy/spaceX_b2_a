import 'dart:io';

import 'package:spacex/core/resources/app_colors.dart';
import 'package:spacex/core/resources/app_size.dart';
import 'package:flutter/material.dart';

class MyBackLeading extends StatelessWidget {
  const MyBackLeading({super.key, this.onPressed,});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    if(!Navigator.canPop(context) && onPressed == null){
      return const SizedBox();
    }
    return Padding(
      padding: const EdgeInsetsDirectional.only(
        start: AppSize.paddingExtraLarge,
      ),
      child: IconButton(
        icon: Icon(
          Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back,
          color: kPrimaryColor,
        ),
        onPressed: onPressed ?? () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
