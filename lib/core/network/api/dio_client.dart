import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spacex/core/constants.dart';
import 'package:spacex/core/di/dependency_injection.dart';
import 'package:spacex/core/network/api/api_client.dart';
import 'package:spacex/core/network/api/interceptor/app_interceptor.dart';
import 'package:spacex/core/network/api/interceptor/logging_interceptor.dart';

class DioClient extends ApiClient<Response> {
  DioClient(
    Dio dioC, {
    required this.sharedPreferences,
    required AppInterceptor appInterceptor,
  }) {
    // get token from local
    final token = sharedPreferences.getString(AppConstants.TOKEN);

    dio = dioC;
    dio
      ..options.baseUrl = AppConstants.BASE_URL
      ..options.connectTimeout = const Duration(seconds: 30)
      ..options.receiveTimeout = const Duration(seconds: 30)
      ..options.validateStatus = (status) {
        return true;
      }
      ..options.headers = {
        'Authorization': token,
      }
      ..interceptors.add(appInterceptor);

    if (kDebugMode) {
      dio.interceptors.add(sl<LoggingInterceptor>());
    }
  }

  late Dio dio;
  final SharedPreferences sharedPreferences;

  @override
  Future<Response> get(
    String path, {
    Map<String, dynamic>? params,
  }) async {
    try {
      return await dio.get(
        path,
        queryParameters: params,
      );
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Response> post(
    String path, {
    data,
    Map<String, dynamic>? params,
  }) async {
    try {
      return await dio.post(
        path,
        data: data,
        queryParameters: params,
      );
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Response> put(
    String path, {
    data,
    Map<String, dynamic>? params,
  }) async {
    try {
      return await dio.put(
        path,
        data: data,
        queryParameters: params,
      );
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Response> delete(
    String path, {
    data,
    Map<String, dynamic>? params,
  }) async {
    try {
      return await dio.delete(
        path,
        data: data,
        queryParameters: params,
      );
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  @override
  void updateToken(String? token) {
    debugPrint('update token -> $token');
    dio.options.headers['Authorization'] = token;
  }
}
