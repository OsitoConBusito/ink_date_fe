enum SignUpStatus {
  initial,
  loading,
  success,
  resendSuccess,
  error,
}

class SignUpState {
  const SignUpState({
    this.email = '',
    this.errorDescription = '',
    this.signUpStatus = SignUpStatus.initial,
    this.userName = '',
  });

  final String email;
  final String errorDescription;
  final SignUpStatus signUpStatus;
  final String userName;

  SignUpState copyWith({
    String? email,
    String? errorDescription,
    SignUpStatus? signUpStatus,
    String? userName,
  }) =>
      SignUpState(
        email: email ?? this.email,
        errorDescription: errorDescription ?? this.errorDescription,
        signUpStatus: signUpStatus ?? this.signUpStatus,
        userName: userName ?? this.userName,
      );
}
