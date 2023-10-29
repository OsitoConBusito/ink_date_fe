class LoginRequestDto {
  LoginRequestDto({
    required this.userName,
    required this.password,
  });

  factory LoginRequestDto.fromJson(Map<String, dynamic> json) =>
      LoginRequestDto(
        userName: json['userName'],
        password: json['password'],
      );

  final String userName;
  final String password;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'userName': userName,
        'password': password,
      };
}
