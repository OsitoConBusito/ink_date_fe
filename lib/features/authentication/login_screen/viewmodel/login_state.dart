enum LoginStatus {
  initial,
  loading,
  failure,
  success,
}

class LoginState {
  const LoginState({
    this.email = '',
    this.emailError = '',
    this.hasPasswordError = false,
    this.password = '',
    this.loginStatus = LoginStatus.initial,
  });

  final bool hasPasswordError;
  final LoginStatus loginStatus;
  final String email;
  final String emailError;
  final String password;

  LoginState copyWith({
    bool? hasPasswordError,
    String? email,
    String? emailError,
    String? password,
    LoginStatus? loginStatus,
  }) =>
      LoginState(
        email: email ?? this.email,
        emailError: emailError ?? this.emailError,
        hasPasswordError: hasPasswordError ?? this.hasPasswordError,
        loginStatus: loginStatus ?? this.loginStatus,
        password: password ?? this.password,
      );
}
