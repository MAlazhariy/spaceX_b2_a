import 'package:easy_localization/easy_localization.dart';

class DateFormatter {
  static String format12(DateTime date) {
    return DateFormat('dd MMM - hh:mm a').format(date);
  }
}
