import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../services/providers/data/remote/network_service.dart';
import '../exceptions/app_exception.dart';
import '../models/response.dart';

mixin ExceptionHandlerMixin on NetworkService {
  Future<Either<AppException, AppResponse>> handleException<T extends Object>(
    final Future<Response<dynamic>> Function() handler, {
    final String endpoint = '',
  }) async {
    try {
      final Response res = await handler();
      return Right(
        AppResponse(
          statusCode: res.statusCode ?? 200,
          data: res.data,
          statusMessage: res.statusMessage,
        ),
      );
    } catch (e) {
      String message = '';
      String identifier = '';
      int statusCode = 0;
      log(e.runtimeType.toString());
      switch (e.runtimeType) {
        case SocketException _:
          e as SocketException;
          message = 'Unable to connect to the server.';
          statusCode = 0;
          identifier = 'Socket Exception ${e.message}\n at  $endpoint';

        case DioException _:
          e as DioException;
          message = e.response?.data?['message'] ?? 'Internal Error occured';
          statusCode = 1;
          identifier = 'DioException ${e.message} \nat  $endpoint';

        default:
          message = 'Unknown error occured';
          statusCode = 2;
          identifier = 'Unknown error $e\n at $endpoint';
      }
      return Left(
        AppException(
          message: message,
          statusCode: statusCode,
          identifier: identifier,
        ),
      );
    }
  }
}
