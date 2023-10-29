import 'package:dartz/dartz.dart';

import '../exceptions/app_exception.dart';

class AppResponse {
  AppResponse({
    required this.statusCode,
    this.statusMessage,
    this.data = const <dynamic>{},
  });
  final int statusCode;
  final String? statusMessage;
  final dynamic data;

  @override
  String toString() =>
      'statusCode=$statusCode\nstatusMessage=$statusMessage\n data=$data';
}

extension ResponseExtension on AppResponse {
  Right<AppException, AppResponse> get toRight =>
      Right<AppException, AppResponse>(this);
}
