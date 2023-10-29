import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../gen/strings.g.dart';
import '../../../../shared/exceptions/app_exception.dart';
import '../../../../utils/extensions/string.dart';
import '../../models/login_request_dto.dart';
import '../../models/login_response_dto.dart';
import '../../repository/authentication_repository.dart';
import 'login_state.dart';

class LoginViewModel extends StateNotifier<LoginState> {
  LoginViewModel(super._state, this._authenticationRepository);

  final AuthenticationRepository _authenticationRepository;

  void onChangeEmail(String email) {
    if (email.isEmpty) {
      state = state.copyWith(email: t.mandatory_field);
      return;
    }
    if (!email.isValidEmail) {
      state = state.copyWith(
        emailError: t.not_valid_email,
      );
      return;
    }
    state = state.copyWith(email: email, emailError: '');
  }

  Future<void> login(String email, String password) async {
    state = state.copyWith(loginStatus: LoginStatus.loading);
    try {
      final Either<AppException, LoginResponseDto> loginResponse =
          await _authenticationRepository.login(
        LoginRequestDto(userName: email, password: password),
      );
      loginResponse.fold(
        (AppException l) =>
            state = state.copyWith(loginStatus: LoginStatus.failure),
        (LoginResponseDto r) {
          state = state.copyWith(loginStatus: LoginStatus.success);
        },
      );
    } on Exception catch (_) {
      state = state.copyWith(loginStatus: LoginStatus.failure);
    }
  }
}
