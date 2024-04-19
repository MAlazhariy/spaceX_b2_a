import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:spacex/core/resources/app_size.dart';
import 'package:spacex/core/utils/extensions/context_extension.dart';

class SectionTitleWidget extends StatelessWidget {
  const SectionTitleWidget({
    super.key,
    required this.title,
    this.onTap,
    this.padding,
  });

  final String title;
  final void Function()? onTap;
  final double? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: onTap != null ? 0 : AppSize.paddingSmall,
        horizontal: padding ?? AppSize.paddingExtraLarge,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: context.styleHeader2,
          ),
          if (onTap != null) const Spacer(),
          if (onTap != null)
            Padding(
              padding: const EdgeInsetsDirectional.only(
                // bottom: AppSize.paddingExtraSmall,
                start: AppSize.paddingExtraSmall,
              ),
              child: TextButton(
                onPressed: onTap,
                child: Text(
                  'show_all'.tr(),
                  style: context.styleBodySmall.copyWith(
                    fontSize: AppSize.fontDefault,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
