import 'profile.dart';

class SignUpRequestDto {
  SignUpRequestDto({
    required this.deviceId,
    required this.email,
    required this.fullName,
    required this.password,
    required this.phoneNumber,
    required this.profile,
    required this.userName,
    this.studioAreas,
    this.studioName,
  });

  factory SignUpRequestDto.fromJson(Map<String, dynamic> json) =>
      SignUpRequestDto(
        deviceId: json['deviceId'],
        email: json['email'],
        fullName: json['fullName'],
        password: json['password'],
        phoneNumber: json['phoneNumber'],
        profile: Profile.fromString(json['profile']),
        studioAreas: json['studioAreas'],
        studioName: json['studioName'],
        userName: json['userName'],
      );

  final String deviceId;
  final String email;
  final String fullName;
  final String password;
  final String phoneNumber;
  final Profile profile;
  final int? studioAreas;
  final String? studioName;
  final String userName;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'deviceId': deviceId,
        'email': email,
        'fullName': fullName,
        'password': password,
        'phoneNumber': phoneNumber,
        'profile': profile.name.toUpperCase(),
        'studioAreas': studioAreas,
        'studioName': studioName,
        'userName': userName,
      };
}
