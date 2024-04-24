import 'dart:convert';

class Data {
  String? profileStatus;
  String? role;
  String? phone;
  DateTime? phoneVerifiedAt;
  String? accessToken;
  String? tokenType;
  int? expiresIn;

  Data({
    this.profileStatus,
    this.role,
    this.phone,
    this.phoneVerifiedAt,
    this.accessToken,
    this.tokenType,
    this.expiresIn,
  });

  @override
  String toString() {
    return 'Data(profileStatus: $profileStatus, role: $role, phone: $phone, phoneVerifiedAt: $phoneVerifiedAt, accessToken: $accessToken, tokenType: $tokenType, expiresIn: $expiresIn)';
  }

  factory Data.fromMap(Map<String, dynamic> data) => Data(
        profileStatus: data['profile_status'] as String?,
        role: data['role'] as String?,
        phone: data['phone'] as String?,
        phoneVerifiedAt: data['phone_verified_at'] == null
            ? null
            : DateTime.parse(data['phone_verified_at'] as String),
        accessToken: data['access_token'] as String?,
        tokenType: data['token_type'] as String?,
        expiresIn: data['expires_in'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'profile_status': profileStatus,
        'role': role,
        'phone': phone,
        'phone_verified_at': phoneVerifiedAt?.toIso8601String(),
        'access_token': accessToken,
        'token_type': tokenType,
        'expires_in': expiresIn,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Data].
  factory Data.fromJson(String data) {
    return Data.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Data] to a JSON string.
  String toJson() => json.encode(toMap());
}
