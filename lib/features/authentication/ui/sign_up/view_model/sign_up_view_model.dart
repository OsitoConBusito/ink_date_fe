import 'package:dartz/dartz.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../gen/strings.g.dart';
import '../../../../../shared/exceptions/app_exception.dart';
import '../../../models/confirm_code_request_dto.dart';
import '../../../models/profile.dart';
import '../../../models/sign_up_request_dto.dart';
import '../../../models/sign_up_response_dto.dart';
import '../../../repository/authentication_repository.dart';
import 'sign_up_state.dart';

class SignUpViewModel extends StateNotifier<SignUpState> {
  SignUpViewModel(super._state, this._authenticationRepository);

  final AuthenticationRepository _authenticationRepository;

  void setSuccess() =>
      state = state.copyWith(signUpStatus: SignUpStatus.success);

  void setInitial() =>
      state = state.copyWith(signUpStatus: SignUpStatus.initial);

  Future<void> confirmCode({required String code}) async {
    state = state.copyWith(signUpStatus: SignUpStatus.loading);

    final Either<AppException, bool> confirmCodeResponse =
        await _authenticationRepository.confirmCode(
      confirmCodeRequestDto: ConfirmCodeRequestDto(
        userName: state.userName,
        code: code,
      ),
    );

    confirmCodeResponse.fold(
      (AppException l) => state = state.copyWith(
        signUpStatus: SignUpStatus.error,
        errorDescription: l.message ?? t.sign_up.admin.error_code,
      ),
      (bool r) => state = state.copyWith(
        signUpStatus: SignUpStatus.success,
      ),
    );
  }

  Future<void> resendCode() async {
    state = state.copyWith(signUpStatus: SignUpStatus.loading);

    final Either<AppException, bool> resendCodeReponse =
        await _authenticationRepository.resendCode(
      email: state.userName,
    );

    resendCodeReponse.fold(
      (AppException l) => state = state.copyWith(
        signUpStatus: SignUpStatus.error,
        errorDescription: l.message ?? t.sign_up.admin.error_code,
      ),
      (bool r) => state = state.copyWith(
        signUpStatus: SignUpStatus.resendSuccess,
      ),
    );
  }

  Future<void> signUp({
    required String email,
    required String fullName,
    required String password,
    required Profile profile,
    int? studioAreas,
    String? studioName,
  }) async {
    state = state.copyWith(signUpStatus: SignUpStatus.loading);

    final String? fcmToken = await FirebaseMessaging.instance.getToken();

    final Either<AppException, SignUpResponseDto> signUpResponse =
        await _authenticationRepository.signUp(
      SignUpRequestDto(
        deviceId: fcmToken!,
        email: email,
        fullName: fullName,
        password: password,
        phoneNumber: '3002136150',
        profile: profile,
        studioAreas: studioAreas,
        studioName: studioName,
        userName: email,
      ),
    );

    signUpResponse.fold(
      (AppException l) => state = state.copyWith(
        signUpStatus: SignUpStatus.error,
        errorDescription: l.message ?? t.sign_up.admin.error,
      ),
      (SignUpResponseDto r) => state = state.copyWith(
        signUpStatus: SignUpStatus.success,
        userName: r.userName,
      ),
    );
  }
}
