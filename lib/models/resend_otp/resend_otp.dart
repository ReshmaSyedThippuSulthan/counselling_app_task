import 'dart:convert';

import 'data.dart';

class ResendOtp {
  bool? status;
  String? message;
  Data? data;

  ResendOtp({this.status, this.message, this.data});

  @override
  String toString() {
    return 'ResendOtp(status: $status, message: $message, data: $data)';
  }

  factory ResendOtp.fromMap(Map<String, dynamic> data) => ResendOtp(
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
  /// Parses the string and returns the resulting Json object as [ResendOtp].
  factory ResendOtp.fromJson(String data) {
    return ResendOtp.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ResendOtp] to a JSON string.
  String toJson() => json.encode(toMap());
}
