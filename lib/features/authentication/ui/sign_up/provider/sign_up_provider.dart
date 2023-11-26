import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../repository/authentication_repository.dart';
import '../view_model/sign_up_state.dart';
import '../view_model/sign_up_view_model.dart';

final StateNotifierProvider<SignUpViewModel, SignUpState> signUpProvider =
    StateNotifierProvider<SignUpViewModel, SignUpState>(
  (StateNotifierProviderRef<SignUpViewModel, SignUpState> ref) {
    final AuthenticationRepository authenticationRepository =
        ref.read(authenticationRepositoryProvider);
    return SignUpViewModel(const SignUpState(), authenticationRepository);
  },
);
