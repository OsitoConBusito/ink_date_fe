import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../../configs/app_configs.dart';
import '../../../../shared/exceptions/app_exception.dart';
import '../../../../shared/globals.dart';
import '../../../../shared/mixins/exception_handler_mixin.dart';
import '../../../../shared/models/response.dart';
import 'network_service.dart';

class DioNetworkService extends NetworkService with ExceptionHandlerMixin {
  DioNetworkService(this.dio) {
    // this throws error while running test
    if (!kTestMode) {
      dio.options = dioBaseOptions;
      if (kDebugMode) {
        dio.interceptors
            .add(LogInterceptor(requestBody: true, responseBody: true));
      }
    }
  }
  final Dio dio;

  BaseOptions get dioBaseOptions => BaseOptions(
        baseUrl: baseUrl,
        headers: headers,
      );
  @override
  String get baseUrl => RouteUrls.baseUrl;

  @override
  Map<String, Object> get headers => <String, Object>{
        'accept': 'application/json',
        'content-type': 'application/json',
      };

  @override
  Map<String, dynamic>? updateHeader(final Map<String, dynamic> data) {
    final Map<String, dynamic> header = <String, dynamic>{...data, ...headers};
    if (!kTestMode) {
      dio.options.headers = header;
    }
    return header;
  }

  @override
  Future<Either<AppException, AppResponse>> post(
    final String endpoint, {
    final Map<String, dynamic>? data,
  }) {
    final Future<Either<AppException, AppResponse>> res = handleException(
      () => dio.post(
        endpoint,
        data: data,
      ),
      endpoint: endpoint,
    );
    return res;
  }

  @override
  Future<Either<AppException, AppResponse>> get(
    final String endpoint, {
    final Map<String, dynamic>? queryParameters,
  }) {
    final Future<Either<AppException, AppResponse>> res = handleException(
      () => dio.get(
        endpoint,
        queryParameters: queryParameters,
      ),
      endpoint: endpoint,
    );
    return res;
  }
}
