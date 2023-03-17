import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:real_time_track_package/src/client/exceptions.dart';
import 'package:real_time_track_package/src/constants/constants.dart';
import 'package:real_time_track_package/src/services/connectivity_service.dart';

export 'exceptions.dart';
export 'header_builder.dart';
export 'result.dart';

export 'package:dio/dio.dart'
    show
        Response,
        Interceptor,
        Interceptors,
        LogInterceptor,
        MultipartFile,
        DioError;

enum MethodType { post, get, delete, put, patch }

class RttClient {
  final Dio _dio;

  RttClient.fromBaseUrl(
    String baseUrl, {
    ResponseType responseType = ResponseType.json,
    Iterable<Interceptor>? interceptors,
    VoidCallback? onUnauthenticatedError,
  }) : _dio = Dio(BaseOptions(baseUrl: baseUrl))
          ..interceptors.addAll(
            interceptors ??
                [
                  _LogInterceptor(),
                  _AuthorizationInterceptor(
                    responseType: responseType,
                    onUnauthenticatedError: onUnauthenticatedError,
                  )
                ],
          );

  Future<Response<dynamic>> request({
    required String path,
    required MethodType method,
    dynamic data,
  }) async {
    try {
      if (await ConnectivityService.isConnected) {
        return await _dio.request(
          path,
          data: data,
          options: Options(
            method: method.name.toUpperCase(),
          ),
        );
      } else {
        throw const RttException(kNoInternetConnection);
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectionTimeout ||
          e.type == DioErrorType.receiveTimeout) {
        throw RttException(e.message ?? kDefaulErrorMessage);
      } else {
        Response<dynamic>? response = e.response;
        if (response != null) return response;
        throw RttException(
          e.message ?? kDefaulErrorMessage,
          response: response,
        );
      }
    } catch (e) {
      throw RttException(e.toString());
    }
  }
}

class _LogInterceptor extends LogInterceptor {
  _LogInterceptor()
      : super(
          request: false,
          requestBody: true,
          responseHeader: false,
          responseBody: true,
        );
}

class _AuthorizationInterceptor extends Interceptor {
  final ResponseType responseType;
  final VoidCallback? onUnauthenticatedError;

  _AuthorizationInterceptor({
    this.responseType = ResponseType.json,
    this.onUnauthenticatedError,
  });

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);
    options.responseType = responseType;
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
    if (err.type == DioErrorType.unknown || err.response?.statusCode == 401) {
      if (onUnauthenticatedError != null) onUnauthenticatedError!();
    }
  }
}

class ClientHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
