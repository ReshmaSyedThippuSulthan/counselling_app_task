import 'dart:convert';

import 'data.dart';

class VerifyOtp {
  bool? status;
  String? message;
  Data? data;

  VerifyOtp({this.status, this.message, this.data});

  @override
  String toString() {
    return 'VerifyOtp(status: $status, message: $message, data: $data)';
  }

  factory VerifyOtp.fromMap(Map<String, dynamic> data) => VerifyOtp(
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
  /// Parses the string and returns the resulting Json object as [VerifyOtp].
  factory VerifyOtp.fromJson(String data) {
    return VerifyOtp.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [VerifyOtp] to a JSON string.
  String toJson() => json.encode(toMap());
}
