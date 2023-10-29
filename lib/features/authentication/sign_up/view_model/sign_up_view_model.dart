import 'package:dartz/dartz.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/exceptions/app_exception.dart';
import '../../models/profile.dart';
import '../../models/sign_up_request_dto.dart';
import '../../models/sign_up_response_dto.dart';
import '../../repository/authentication_repository.dart';
import 'sign_up_state.dart';

class SignUpViewModel extends StateNotifier<SignUpState> {
  SignUpViewModel(super._state, this._authenticationRepository);

  final AuthenticationRepository _authenticationRepository;

  Future<void> signUp(Profile profile) async {
    state = state.copyWith(signUpStatus: SignUpStatus.loading);

    final String? fcmToken = await FirebaseMessaging.instance.getToken();

    final Either<AppException, SignUpResponseDto> signUpResponse =
        await _authenticationRepository.signUp(
      SignUpRequestDto(
        deviceId: fcmToken!,
        email: state.email,
        fullName: state.fullName,
        password: state.password,
        phoneNumber: '',
        profile: profile,
        studioAreas: state.studioAreas,
        studioName: state.studioName,
        userName: state.email,
      ),
    );

    signUpResponse.fold(
      (AppException l) =>
          state = state.copyWith(signUpStatus: SignUpStatus.error),
      (SignUpResponseDto r) => state = state.copyWith(
        signUpStatus: SignUpStatus.success,
      ),
    );
  }
}
