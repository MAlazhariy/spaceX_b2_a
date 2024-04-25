// ignore_for_file: empty_catches

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:spacex/core/network/error_handling/api_error_model.dart';

abstract class ApiErrorHandler {
  static ApiErrorModel handle(dynamic error) {
    debugPrint('error handler');
    debugPrint('- error type: ${error.runtimeType}');

    if (error is Response) {
      ApiErrorModel? errorResponse;
      try {
        errorResponse = ApiErrorModel.fromJson(
          error.data,
          code: error.statusCode,
        );
      } catch (e) {}
      debugPrint('--- error data: ${error.data}');
      debugPrint('--- error message: ${error.statusMessage}');

      if (errorResponse == null) {
        return ApiErrorModel("${error.statusCode}: ${"error_occurred".tr()}");
      } else {
        return errorResponse;
      }
    } else if (error is! Exception) {
      return ApiErrorModel("$error");
    }

    try {
      if (error is! DioException) {
        return ApiErrorModel("$error");
      }

      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return ApiErrorModel("connection_timeout_error".tr());
        case DioExceptionType.sendTimeout:
          return ApiErrorModel("send_timeout_error".tr());
        case DioExceptionType.receiveTimeout:
          return ApiErrorModel("receive_timeout_error".tr());
        case DioExceptionType.cancel:
          return ApiErrorModel("error_request_canceled".tr());
        case DioExceptionType.connectionError:
        case DioExceptionType.unknown:
          return ApiErrorModel("connection_failed_check_internet".tr());
        case DioExceptionType.badCertificate:
          return ApiErrorModel("bad_certificate_error".tr());

        case DioExceptionType.badResponse:
          switch (error.response!.statusCode) {
            case 404:
            case 500:
            case 503:
              return ApiErrorModel(
                  "${error.response!.statusCode}: ${error.response!.statusMessage ?? "error_occurred".tr()}");

            default:
              ApiErrorModel? errorResponse;
              try {
                errorResponse = ApiErrorModel.fromJson(
                  error.response?.data,
                  code: error.response?.statusCode,
                );
              } catch (e) {}
              debugPrint('--- error data: ${error.response?.data}');
              debugPrint('--- error message: ${error.response?.statusMessage}');

              if (errorResponse == null) {
                return ApiErrorModel(
                    "${error.response?.statusCode}: ${"error_occurred".tr()}");
              } else {
                return errorResponse;
              }
          }
      }
    } catch (e) {
      return ApiErrorModel("${"error_occurred".tr()}: $e");
    }
  }
}
