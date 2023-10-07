import 'package:dartz/dartz.dart';

import '../../../../shared/exceptions/app_exception.dart';
import '../../../../shared/models/response.dart';

abstract class NetworkService {
  String get baseUrl;

  Map<String, Object> get headers;

  void updateHeader(final Map<String, dynamic> data);

  Future<Either<AppException, AppResponse>> get(
    final String endpoint, {
    final Map<String, dynamic>? queryParameters,
  });

  Future<Either<AppException, AppResponse>> post(
    final String endpoint, {
    final Map<String, dynamic>? data,
  });
}
