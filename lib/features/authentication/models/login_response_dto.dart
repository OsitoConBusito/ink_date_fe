class LoginResponseDto {
  LoginResponseDto({
    required this.authenticationResult,
    required this.phoneNumber,
    required this.photo,
    required this.studioCode,
    required this.profile,
    required this.status,
    required this.userName,
    required this.createdAt,
    required this.email,
    required this.fullName,
    required this.deviceId,
    required this.updatedAt,
    required this.attempts,
    required this.studio,
  });

  factory LoginResponseDto.fromJson(Map<String, dynamic> json) =>
      LoginResponseDto(
        authenticationResult:
            AuthenticationResult.fromJson(json['AuthenticationResult']),
        phoneNumber: json['phoneNumber'],
        photo: Photo.fromJson(json['photo']),
        studioCode: json['studioCode'],
        profile: json['profile'],
        status: json['status'],
        userName: json['userName'],
        createdAt: json['createdAt'],
        email: json['email'],
        fullName: json['fullName'],
        deviceId: json['deviceId'],
        updatedAt: json['updatedAt'],
        attempts: json['attempts'],
        studio: Studio.fromJson(json['studio']),
      );

  final AuthenticationResult authenticationResult;
  final String phoneNumber;
  final Photo? photo;
  final int studioCode;
  final String profile;
  final String status;
  final String userName;
  final int createdAt;
  final String email;
  final String fullName;
  final String deviceId;
  final int updatedAt;
  final int attempts;
  final Studio studio;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'AuthenticationResult': authenticationResult.toJson(),
        'phoneNumber': phoneNumber,
        'photo': photo?.toJson(),
        'studioCode': studioCode,
        'profile': profile,
        'status': status,
        'userName': userName,
        'createdAt': createdAt,
        'email': email,
        'fullName': fullName,
        'deviceId': deviceId,
        'updatedAt': updatedAt,
        'attempts': attempts,
        'studio': studio.toJson(),
      };
}

class AuthenticationResult {
  AuthenticationResult({
    required this.accessToken,
    required this.expiresIn,
    required this.tokenType,
    required this.refreshToken,
    required this.idToken,
  });

  factory AuthenticationResult.fromJson(Map<String, dynamic> json) =>
      AuthenticationResult(
        accessToken: json['AccessToken'],
        expiresIn: json['ExpiresIn'],
        tokenType: json['TokenType'],
        refreshToken: json['RefreshToken'],
        idToken: json['IdToken'],
      );
  final String accessToken;
  final int expiresIn;
  final String tokenType;
  final String refreshToken;
  final String idToken;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'AccessToken': accessToken,
        'ExpiresIn': expiresIn,
        'TokenType': tokenType,
        'RefreshToken': refreshToken,
        'IdToken': idToken,
      };
}

class Photo {
  Photo({
    required this.url,
    required this.key,
  });

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        url: json['url'],
        key: json['key'],
      );
  final String url;
  final String key;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'url': url,
        'key': key,
      };
}

class Studio {
  Studio({
    required this.userName,
    required this.createdAt,
    required this.studioName,
    required this.studioCode,
  });

  factory Studio.fromJson(Map<String, dynamic> json) => Studio(
        userName: json['userName'],
        createdAt: json['createdAt'],
        studioName: json['studioName'],
        studioCode: json['studioCode'],
      );
  final String userName;
  final int createdAt;
  final String studioName;
  final int studioCode;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'userName': userName,
        'createdAt': createdAt,
        'studioName': studioName,
        'studioCode': studioCode,
      };
}
