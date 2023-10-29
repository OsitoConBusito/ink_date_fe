class SignUpResponseDto {
  SignUpResponseDto({
    required this.deviceId,
    required this.email,
    required this.fullName,
    required this.phoneNumber,
    required this.profile,
    required this.studioCode,
    required this.userName,
  });

  factory SignUpResponseDto.fromJson(Map<String, dynamic> json) =>
      SignUpResponseDto(
        deviceId: json['deviceId'],
        email: json['email'],
        fullName: json['fullName'],
        phoneNumber: json['phoneNumber'],
        profile: json['profile'],
        studioCode: json['studioCode'],
        userName: json['userName'],
      );

  final String deviceId;
  final String email;
  final String fullName;
  final String phoneNumber;
  final String profile;
  final int studioCode;
  final String userName;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'deviceId': deviceId,
        'email': email,
        'fullName': fullName,
        'phoneNumber': phoneNumber,
        'profile': profile,
        'studioCode': studioCode,
        'userName': userName,
      };
}
