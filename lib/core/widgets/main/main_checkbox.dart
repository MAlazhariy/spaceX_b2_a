import 'package:spacex/core/resources/app_colors.dart';
import 'package:spacex/core/resources/app_size.dart';
import 'package:flutter/material.dart';

class MainCheckbox extends StatefulWidget {
  const MainCheckbox({
    super.key,
    required this.onChanged,
    this.initValue = false,
  });

  final void Function(bool)? onChanged;
  final bool initValue;

  @override
  State<MainCheckbox> createState() => _MainCheckboxState();
}

class _MainCheckboxState extends State<MainCheckbox> {
  late bool value = widget.initValue;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: value,
      focusColor: kMainColor,
      activeColor: kMainColor,
      side: const BorderSide(
        color: kBorderNeutralColor,
        width: 2.0,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.radiusExtraSmall),
      ),
      onChanged: (val) {
        setState(() {
          value = val == true;
          widget.onChanged?.call(val == true);
        });
      },
    );
  }
}
