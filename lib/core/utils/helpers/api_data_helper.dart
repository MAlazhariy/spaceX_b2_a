class ApiDataHelper {
  static int? getInt(i) {
    switch (i) {
      case String _:
        return double.parse(i).toInt();

      case int _:
        return i;
    }

    return null;
  }

  static bool? getBool(i) {
    switch (i) {
      case String _:
        return i == '1' || i == 'true';

      case int _:
        return i == 1;

      case bool _:
        return i;
    }

    return null;
  }

  static DateTime? getDateTimeFromStamp(i) {
    final timeStamp = getInt(i);
    return timeStamp != null ? DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000) : null;
  }
}
