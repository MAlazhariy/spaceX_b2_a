import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:spacex/core/resources/app_colors.dart';
import 'package:spacex/core/resources/app_size.dart';
import 'package:spacex/core/utils/extensions/context_extension.dart';
import 'package:spacex/core/widgets/main/main_button.dart';

Future<void> showCustomDialog({
  required BuildContext context,
  String? title,
  Color? titleColor,
  required String description,
  IconData? icon = Icons.error_outline,
  Color? backgroundColor = kBGGradientColor,
  Color iconColor = kTitleBodyColor,
  List<DialogButton> buttons = const [],

  /// [FALSE] for allow dismissible, [TRUE] for preventing dismissible & prevent back behavior.
  bool preventDismissible = false,
}) async {
  return await showDialog(
    context: context,
    builder: (BuildContext context) {
      const radiusValue = AppSize.radiusExtraLarge;
      return PopScope(
        canPop: !preventDismissible,
        child: AlertDialog(
          contentPadding: EdgeInsets.zero,
          actionsPadding: const EdgeInsets.only(
            bottom: AppSize.paddingSmall,
            top: AppSize.paddingExtraSmall,
          ),
          backgroundColor: Colors.white,
          content: SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // icon
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    vertical: AppSize.paddingLarge,
                    horizontal: AppSize.paddingSmall,
                  ),
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(radiusValue),
                      topLeft: Radius.circular(radiusValue),
                    ),
                  ),
                  child: Icon(
                    icon,
                    size: 40,
                    color: iconColor,
                  ).animate().shake(delay: 300.milliseconds, offset: const Offset(4, 1), rotation: 0.2),
                ),

                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSize.paddingDefault,
                      vertical: AppSize.paddingSmall,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // const SizedBox(height: AppSize.paddingDefault),
                        if (title != null)
                          Align(
                            child: Text(
                              title,
                              style: context.styleHeader2.copyWith(color: titleColor),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        Align(
                          child: Text(
                            description,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: AppSize.defaultSize,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            Container(
              width: double.maxFinite,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(
                horizontal: AppSize.paddingDefault,
              ),
              child: Center(
                child: Wrap(
                  spacing: AppSize.extraSmall,
                  children: buttons,
                ),
              ),
            ),
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusValue),
          ),
        ),
      );
    },
    barrierDismissible: !preventDismissible,
  );
}

class DialogButton extends StatelessWidget {
  const DialogButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.color = kMainColor,
    this.fit = false,
  });

  final void Function()? onPressed;
  final String title;
  final Color color;
  final bool fit;

  @override
  Widget build(BuildContext context) {
    return MainButton(
      onPressed: onPressed,
      title: title,
      color: color,
      fit: fit,
      stadiumBorder: true,
      verticalContentPadding: AppSize.paddingSmall,
      horizontalContentPadding: AppSize.paddingDefault + 5,
      fontSize: AppSize.fontDefault - 1.5,
    );
  }
}
