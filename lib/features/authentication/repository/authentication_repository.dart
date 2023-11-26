import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../configs/app_configs.dart';
import '../../../services/providers/data/remote/dio_network_service.dart';
import '../../../shared/exceptions/app_exception.dart';
import '../../../shared/models/response.dart';
import '../models/confirm_code_request_dto.dart';
import '../models/login_request_dto.dart';
import '../models/login_response_dto.dart';
import '../models/sign_up_request_dto.dart';
import '../models/sign_up_response_dto.dart';

final Provider<AuthenticationRepository> authenticationRepositoryProvider =
    Provider<AuthenticationRepository>(
  (ProviderRef<AuthenticationRepository> ref) => AuthenticationRepository(),
);

class AuthenticationRepository {
  final DioNetworkService _dioNetworkService = DioNetworkService(Dio());

  Future<Either<AppException, LoginResponseDto>> login(
    LoginRequestDto loginRequestDto,
  ) async {
    final Either<AppException, AppResponse> response =
        await _dioNetworkService.post(
      RouteUrls.login,
      data: loginRequestDto.toJson(),
    );

    return response.fold(
      Left.new,
      (AppResponse r) => Right<AppException, LoginResponseDto>(
        LoginResponseDto.fromJson(r.data as Map<String, dynamic>),
      ),
    );
  }

  Future<Either<AppException, SignUpResponseDto>> signUp(
    SignUpRequestDto signUpRequestDto,
  ) async {
    final Either<AppException, AppResponse> response =
        await _dioNetworkService.post(
      RouteUrls.signUp,
      data: signUpRequestDto.toJson(),
    );

    return response.fold(
      (AppException appException) => Left<AppException, SignUpResponseDto>(
        AppException(
          message: appException.message,
          statusCode: appException.statusCode,
          identifier: appException.identifier,
        ),
      ),
      (AppResponse r) => Right<AppException, SignUpResponseDto>(
        SignUpResponseDto.fromJson(r.data as Map<String, dynamic>),
      ),
    );
  }

  Future<Either<AppException, bool>> confirmCode({
    required ConfirmCodeRequestDto confirmCodeRequestDto,
  }) async {
    final Either<AppException, AppResponse> response =
        await _dioNetworkService.post(
      RouteUrls.confirmSignUp,
      data: confirmCodeRequestDto.toJson(),
    );

    return response.fold(
      (AppException appException) => Left<AppException, bool>(
        AppException(
          message: appException.message,
          statusCode: appException.statusCode,
          identifier: appException.identifier,
        ),
      ),
      (AppResponse r) => const Right<AppException, bool>(true),
    );
  }

  Future<Either<AppException, bool>> resendCode({required String email}) async {
    final Either<AppException, AppResponse> response = await _dioNetworkService
        .post(RouteUrls.resend, data: <String, String>{'userName': email});

    return response.fold(
      (AppException appException) => Left<AppException, bool>(
        AppException(
          message: appException.message,
          statusCode: appException.statusCode,
          identifier: appException.identifier,
        ),
      ),
      (AppResponse r) => const Right<AppException, bool>(true),
    );
  }
}
