import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spacex/core/resources/app_colors.dart';
import 'package:spacex/core/resources/app_font_family.dart';
import 'package:spacex/core/resources/app_size.dart';
import 'package:spacex/core/resources/app_text_styles.dart';

class MainTextField extends StatefulWidget {
  const MainTextField({
    super.key,
    this.isPassword = false,
    this.prefixIcon,
    this.iconSpace = false,
    this.labelText,
    this.hintText,
    this.errorText,
    this.controller,
    this.validator,
    this.onSubmitted,
    this.keyboardType,
    this.required = false,
    this.maxLines = 1,
    this.minLines,
    this.enabled = true,
    this.inputFormatters,
    this.textInputAction,
    this.suffixIcon,
    this.suffix,
    this.maxLength,
    this.prefix,
    this.onChanged,
  });

  final bool isPassword;
  final IconData? prefixIcon;

  /// replace icon with space
  final bool iconSpace;
  final String? labelText;
  final String? hintText;
  final String? errorText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String?)? onSubmitted;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool required;
  final int? maxLines;
  final int? minLines;
  final bool enabled;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffixIcon;
  final Widget? suffix;
  final int? maxLength;
  final Widget? prefix;
  final void Function(String)? onChanged;

  @override
  State<MainTextField> createState() => _MainTextFieldState();
}

class _MainTextFieldState extends State<MainTextField> {
  late bool _hidePassword = widget.isPassword;

  void changeObscureText() {
    setState(() {
      _hidePassword = !_hidePassword;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        locale: context.locale,
        color: kPrimaryTitleColor,
      ),
      textAlign: TextAlign.start,
      decoration: InputDecoration(
        prefixIcon: (widget.prefixIcon != null ? Icon(widget.prefixIcon) : null),
        prefix: widget.prefix,
        errorText: widget.errorText,
        errorMaxLines: 2,
        filled: false,
        hintText: widget.hintText,
        enabled: widget.enabled,
        label: RichText(
          text: TextSpan(
            text: widget.labelText,
            style: kHintTextStyle,
            children: [
              if (widget.required)
                const TextSpan(
                  text: ' *',
                  style: TextStyle(
                    color: kRedColor,
                    fontSize: AppSize.fontDefault,
                    fontFamily: FontFamily.baloo,
                    fontWeight: FontWeight.w700,
                    height: 1.4,
                  ),
                ),
            ],
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: AppSize.paddingDefault - 2,
          horizontal: AppSize.paddingDefault,
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _hidePassword ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: changeObscureText,
              )
            : widget.suffixIcon,
        suffix: widget.suffix,
        counter: const SizedBox(),
      ),
      controller: widget.controller,
      maxLength: widget.maxLength,
      obscureText: _hidePassword,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      minLines: widget.minLines,
      maxLines: widget.maxLines,
      validator: widget.validator,
      inputFormatters: widget.inputFormatters,
      onFieldSubmitted: widget.onSubmitted,
      onChanged: widget.onChanged,
    );
  }
}
