import 'package:flutter/material.dart';
import 'package:spacex/core/resources/app_colors.dart';
import 'package:spacex/core/resources/app_size.dart';
import 'package:spacex/core/resources/app_text_styles.dart';

class NoAvailableDataWidget extends StatelessWidget {
  const NoAvailableDataWidget({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(
        horizontal: 50,
        vertical: 40,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /*Image.asset(
            AppImages.emptyBoxIcon,
            width: 80,
            color: kGreyTextColor,
          ),*/
          const SizedBox(height: AppSize.extraSmall),
          Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: kSemiBoldFontStyle.copyWith(
              fontSize: AppSize.fontDefault,
              color: kTitleBodyColor,
            ),
          ),
        ],
      ),
    );
  }
}
