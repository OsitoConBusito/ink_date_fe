import '../../../utils/extensions/map.dart';

class LoginRequestDto {
  LoginRequestDto({
    required this.userName,
    required this.password,
  });

  factory LoginRequestDto.fromJson(Map<String, dynamic> json) =>
      LoginRequestDto(
        password: json.getString('password')!,
        userName: json.getString('userName')!,
      );

  final String password;
  final String userName;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'password': password,
        'userName': userName,
      };
}
