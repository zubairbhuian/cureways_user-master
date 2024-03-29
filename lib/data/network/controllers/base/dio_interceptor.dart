import 'package:cureways_user/data/network/controllers/global_controller.dart';
import 'package:cureways_user/data/network/controllers/profile_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class DioInterceptor extends Interceptor {
  final logger = Logger();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    /// add token to header if user is logged in
    String token = GlobalController.to.bearerToken ?? "";
    if (token.isNotEmpty) {
      // options.headers['access-token'] =token;
      options.headers['Authorization'] = token;
    }

    /// set options
    options.validateStatus = (_) => true;
    options.receiveDataWhenStatusError = true;
    options.responseType = ResponseType.json;

    if (kDebugMode) {
      logger.d('Request: ${options.method} ${options.uri}');
      logger.i(options.headers);
      logger.i(options.data);
      logger.i(options.queryParameters);
      if (options.data is FormData) {
        final formData = options.data as FormData;
        for (var element in formData.files) {
          logger.i("${element.key}:::${element.value.filename}");
        }
      }
    }

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.statusCode == 200) {
      final token = response.data['token'];
      if (token != null && token is String) {
        // hide Auto add token
        // Preferences.token = token;
      }
    } else if (response.statusCode == 302) {
      ProfileController.to.onLogOut();
    }
    if (kDebugMode) {
      logger.d('Response: ${response.statusCode} ${response.statusMessage}');
      logger.d(response.data);
    }

    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      logger.e('Error: ${err.message}');
    }
    super.onError(err, handler);
  }
}
