import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:spacex/core/resources/app_colors.dart';
import 'package:spacex/core/resources/app_size.dart';

class SnkBar {
  static void showError(
    BuildContext context,
    String? msg, {
    int milliseconds = 2000,
    Color? backgroundColor = kRedColor,
    Color? textColor = Colors.white,
    Widget? icon = const Icon(Icons.error_outline, color: Colors.white),
  }) {
    return show(
      context,
      msg ?? 'error_occurred'.tr(),
      icon: icon,
      backgroundColor: backgroundColor,
      textColor: textColor,
      milliseconds: milliseconds,
    );
  }

  static void show(
    BuildContext context,
    String msg, {
    int milliseconds = 1500,
    Color? backgroundColor = kBackgroundColor,
    Color? textColor = kPrimaryTitleColor,
    Widget? icon,
    SnackBarAction? action,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSize.paddingDefault + 2,
            vertical: AppSize.paddingSmall + 2,
          ),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(AppSize.radiusLarge),
          ),
          child: Row(
            children: [
              if (icon != null)
                Container(
                  padding: const EdgeInsetsDirectional.only(
                      end: AppSize.paddingSmall),
                  height: 50,
                  child: icon,
                ),
              Expanded(
                child: Text(
                  msg,
                  style: TextStyle(
                    fontSize: AppSize.fontDefault,
                    fontWeight: FontWeight.w500,
                    color: textColor,
                  ),
                ),
              ),
              if (action != null)
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                      start: AppSize.paddingSmall),
                  child: action,
                ),
            ],
          ),
        ),
        padding: const EdgeInsets.all(AppSize.paddingSmall),
        backgroundColor: Colors.transparent,
        elevation: 0,
        duration: Duration(milliseconds: milliseconds),
      ),
    );
  }
}
