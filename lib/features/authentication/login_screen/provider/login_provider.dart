import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../repository/authentication_repository.dart';
import '../viewmodel/login_state.dart';
import '../viewmodel/login_view_model.dart';

final StateNotifierProvider<LoginViewModel, LoginState> loginProvider =
    StateNotifierProvider<LoginViewModel, LoginState>(
  (StateNotifierProviderRef<LoginViewModel, LoginState> ref) {
    final AuthenticationRepository authenticationRepository =
        ref.read(authenticationRepositoryProvider);
    return LoginViewModel(const LoginState(), authenticationRepository);
  },
);
