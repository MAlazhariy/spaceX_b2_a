import 'package:spacex/core/resources/app_size.dart';
import 'package:flutter/cupertino.dart';

class MyBottomSheetShape extends RoundedRectangleBorder {
  @override
  BorderRadiusGeometry get borderRadius => const BorderRadius.vertical(
        top: Radius.circular(AppSize.radius40),
      );
}
