import 'package:flutter/material.dart';
import 'package:spacex/core/resources/app_text_styles.dart';
import 'package:spacex/core/widgets/main/main_circular_progress_adaptive.dart';
import 'package:spacex/core/resources/app_colors.dart';
import 'package:spacex/core/resources/app_size.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.fontSize = AppSize.fontDefault,
    this.horizontalContentPadding = AppSize.paddingDefault,
    this.verticalContentPadding = AppSize.paddingDefault,
    this.fit = true,
    this.outlined = false,
    this.loading = false,
    this.strokeAlign = BorderSide.strokeAlignInside,
    this.color = kMainColor,
    this.textColor,
    this.stadiumBorder = true,
    this.icon,
  });

  final void Function()? onPressed;
  final String title;
  final double fontSize;
  final bool fit;
  final bool outlined;
  final bool loading;
  final double strokeAlign;
  final double horizontalContentPadding;
  final double verticalContentPadding;
  final Color color;
  final Color? textColor;
  final bool stadiumBorder;
  final Widget? icon;

  bool get _activated => onPressed != null;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.center,
      child: MaterialButton(
        onPressed: loading ? null : onPressed,
        padding: EdgeInsets.zero,
        shape: stadiumBorder
            ? const StadiumBorder()
            : RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.radiusDefault),
              ),
        highlightElevation: 5,
        child: Ink(
          decoration: BoxDecoration(
            color: outlined
                ? null
                : _activated
                    ? color
                    : kBorderNeutralColor,
            borderRadius: BorderRadius.circular(
                stadiumBorder ? 100 : AppSize.radiusDefault),
            border: outlined
                ? Border.all(
                    color: _activated ? color : kBorderNeutralColor,
                    width: 2,
                    strokeAlign: strokeAlign,
                  )
                : null,
          ),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalContentPadding - (outlined ? 2.2 : 0),
              vertical: verticalContentPadding - (outlined ? 2.2 : 0),
            ),
            width: fit ? double.maxFinite : null,
            child: loading
                ? Center(
                    child: MainCircularProgress(
                      color: outlined ? color : Colors.white,
                      size: 20,
                      strokeWidth: 3,
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (icon != null)
                        Padding(
                          padding: const EdgeInsetsDirectional.only(
                            end: AppSize.paddingExtraSmall,
                          ),
                          child: icon!,
                        ),
                      Text(
                        title,
                        textAlign: TextAlign.center,
                        style: kBoldFontStyle.copyWith(
                          color: textColor ?? (outlined ? color : Colors.white),
                          fontSize: fontSize,
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
