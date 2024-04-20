import 'dart:convert';

import 'data.dart';

class TermsOfService {
  bool? status;
  String? message;
  Data? data;

  TermsOfService({this.status, this.message, this.data});

  @override
  String toString() {
    return 'TermsOfService(status: $status, message: $message, data: $data)';
  }

  factory TermsOfService.fromMap(Map<String, dynamic> data) {
    return TermsOfService(
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
  /// Parses the string and returns the resulting Json object as [TermsOfService].
  factory TermsOfService.fromJson(String data) {
    return TermsOfService.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [TermsOfService] to a JSON string.
  String toJson() => json.encode(toMap());
}
