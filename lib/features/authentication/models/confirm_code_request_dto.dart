class ConfirmCodeRequestDto {
  ConfirmCodeRequestDto({
    this.userName,
    this.code,
  });

  factory ConfirmCodeRequestDto.fromJson(Map<String, dynamic> json) =>
      ConfirmCodeRequestDto(
        userName: json['userName'],
        code: json['code'],
      );
  final String? userName;
  final String? code;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'userName': userName,
        'code': code,
      };
}
