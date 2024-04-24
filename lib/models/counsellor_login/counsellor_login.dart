import 'dart:convert';

import 'data.dart';

class CounsellorLogin {
  bool? status;
  String? message;
  Data? data;

  CounsellorLogin({this.status, this.message, this.data});

  @override
  String toString() {
    return 'CounsellorLogin(status: $status, message: $message, data: $data)';
  }

  factory CounsellorLogin.fromMap(Map<String, dynamic> data) {
    return CounsellorLogin(
      status: data['status'] as bool?,
      message: data['message'] as String?,
      data: data['data'] == null
          ? null
          : Data.fromMap(data['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
        'status': status,
        'message': message,
        'data': data?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CounsellorLogin].
  factory CounsellorLogin.fromJson(String data) {
    return CounsellorLogin.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CounsellorLogin] to a JSON string.
  String toJson() => json.encode(toMap());
}
