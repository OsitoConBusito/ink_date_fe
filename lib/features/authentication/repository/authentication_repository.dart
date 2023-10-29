import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../configs/app_configs.dart';
import '../../../shared/exceptions/app_exception.dart';
import '../models/login_request_dto.dart';
import '../models/login_response_dto.dart';
import '../models/sign_up_request_dto.dart';
import '../models/sign_up_response_dto.dart';

final Provider<AuthenticationRepository> authenticationRepositoryProvider =
    Provider<AuthenticationRepository>(
  (ProviderRef<AuthenticationRepository> ref) => AuthenticationRepository(),
);

class AuthenticationRepository {
  final Dio _dio = Dio();

  Future<Either<AppException, LoginResponseDto>> login(
    LoginRequestDto loginRequestDto,
  ) async {
    try {
      final Response<dynamic> response = await _dio.post(
        '${AppConfigs.baseUrl}${AppConfigs.login}',
        data: loginRequestDto.toJson(),
      );

      final LoginResponseDto loginResponse =
          LoginResponseDto.fromJson(response.data);

      return Right<AppException, LoginResponseDto>(loginResponse);
    } on DioException catch (e) {
      return Left<AppException, LoginResponseDto>(
        AppException(
          message: e.message,
          statusCode: e.response?.statusCode,
          identifier: null,
        ),
      );
    }
  }

  Future<Either<AppException, SignUpResponseDto>> signUp(
    SignUpRequestDto signUpRequestDto,
  ) async {
    try {
      final Response<dynamic> response =
          await _dio.post('${AppConfigs.baseUrl}${AppConfigs.signUp}');

      final SignUpResponseDto signUpRequestDto =
          SignUpResponseDto.fromJson(response.data);
      return Right<AppException, SignUpResponseDto>(signUpRequestDto);
    } on DioException catch (e) {
      return Left<AppException, SignUpResponseDto>(
        AppException(
          message: e.message,
          statusCode: e.response?.statusCode,
          identifier: null,
        ),
      );
    }
  }
}
