enum SignUpStatus {
  initial,
  loading,
  success,
  error,
}

class SignUpState {
  const SignUpState({
    this.confirmPassword = '',
    this.email = '',
    this.fullName = '',
    this.password = '',
    this.signUpStatus = SignUpStatus.initial,
    this.studioAreas = 1,
    this.studioName = '',
  });

  final String email;
  final String fullName;
  final String password;
  final String confirmPassword;
  final String studioName;
  final int studioAreas;
  final SignUpStatus signUpStatus;

  bool get isPasswordMatches => password == confirmPassword;

  SignUpState copyWith({
    String? email,
    String? fullName,
    String? password,
    String? confirmPassword,
    String? studioName,
    int? studioAreas,
    SignUpStatus? signUpStatus,
  }) =>
      SignUpState(
        email: email ?? this.email,
        fullName: fullName ?? this.fullName,
        confirmPassword: confirmPassword ?? this.confirmPassword,
        studioName: studioName ?? this.studioName,
        studioAreas: studioAreas ?? this.studioAreas,
        signUpStatus: signUpStatus ?? this.signUpStatus,
        password: password ?? this.password,
      );
}
