import 'dart:convert';

import 'data.dart';

class StudentLogin {
  bool? status;
  String? message;
  Data? data;

  StudentLogin({this.status, this.message, this.data});

  @override
  String toString() {
    return 'StudentLogin(status: $status, message: $message, data: $data)';
  }

  factory StudentLogin.fromMap(Map<String, dynamic> data) => StudentLogin(
        status: data['status'] as bool?,
        message: data['message'] as String?,
        data: data['data'] == null
            ? null
            : Data.fromMap(data['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'status': status,
        'message': message,
        'data': data?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [StudentLogin].
  factory StudentLogin.fromJson(String data) {
    return StudentLogin.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [StudentLogin] to a JSON string.
  String toJson() => json.encode(toMap());
}
