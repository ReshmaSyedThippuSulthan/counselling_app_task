import 'dart:convert';

import 'data.dart';

class SelectCountry {
  bool? status;
  String? message;
  Data? data;

  SelectCountry({this.status, this.message, this.data});

  @override
  String toString() {
    return 'SelectCountry(status: $status, message: $message, data: $data)';
  }

  factory SelectCountry.fromMap(Map<String, dynamic> data) => SelectCountry(
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
  /// Parses the string and returns the resulting Json object as [SelectCountry].
  factory SelectCountry.fromJson(String data) {
    return SelectCountry.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SelectCountry] to a JSON string.
  String toJson() => json.encode(toMap());
}
