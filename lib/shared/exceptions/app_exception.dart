import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../models/response.dart';

class AppException implements Exception {

  AppException({
    required this.message,
    required this.statusCode,
    required this.identifier,
  });
  final String? message;
  final int? statusCode;
  final String? identifier;
  @override
  String toString() => 'statusCode=$statusCode\nmessage=$message\nidentifier=$identifier';
}

class CacheFailureException extends Equatable implements AppException {
  @override
  String? get identifier => 'Cache failure exception';

  @override
  String? get message => 'Unable to save user';

  @override
  int? get statusCode => 100;

  @override
  List<Object?> get props => [message, statusCode, identifier];
}

//  extension

extension HttpExceptionExtension on AppException {
  Left<AppException, AppResponse> get toLeft =>
      Left<AppException, AppResponse>(this);
}
