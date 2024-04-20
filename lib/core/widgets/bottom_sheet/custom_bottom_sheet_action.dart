import 'package:spacex/core/widgets/bottom_sheet/my_bottom_sheet_drag_widget.dart';
import 'package:spacex/core/utils/extensions/context_extension.dart';
import 'package:spacex/core/resources/app_colors.dart';
import 'package:spacex/core/resources/app_size.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomBottomSheetAction extends StatelessWidget {
  const CustomBottomSheetAction({
    super.key,
    required this.title,
    required this.button,
    this.subTitle,
    this.showCancel = true,
  });

  final String title;
  final String? subTitle;
  final Widget button;
  final bool showCancel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: AppSize.paddingExtraLarge),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const MyBottomSheetDragWidget(),
          Text(
            title,
            style: context.styleHeader1,
            textAlign: TextAlign.center,
          ),
          if (subTitle != null)
            Padding(
              padding: const EdgeInsets.only(
                top: AppSize.paddingSmall,
              ),
              child: Text(
                subTitle!,
                textAlign: TextAlign.center,
              ),
            ),
          const SizedBox(height: AppSize.padding32),
          // button
          button,
          // cancel
          if (showCancel)
            Padding(
              padding: const EdgeInsets.only(
                top: AppSize.paddingSmall,
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'cancel'.tr(),
                  style: context.styleBodyBold.copyWith(
                    color: kMainColor,
                  ),
                ),
              ),
            ),
          const SizedBox(height: AppSize.paddingDefault),
        ],
      ),
    );
  }
}
