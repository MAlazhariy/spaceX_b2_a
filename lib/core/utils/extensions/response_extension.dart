import 'package:dio/dio.dart';
import 'package:spacex/core/network/error_handling/api_status_code.dart';

extension ResponseChecker on Response {
  /// Getter function check if the code (in [Response] [data]) is success
  bool get isSuccess => data is Map ? data['code'] == ApiStatusCode.success : true;

  /// 201
  bool get isCodeRedirect => data is Map ? data['code'] == ApiStatusCode.created : true;

  /// 202
  bool get isAccepted => data is Map ? data['code'] == ApiStatusCode.accepted : true;

  bool get isUnauthorized {
    try {
      if (data is Map) {
        return data?['code'] == ApiStatusCode.unauthorized || data?['code'] == ApiStatusCode.forbidden;
      }
      return false;
    } on Exception {
      return false;
    }
  }
}
