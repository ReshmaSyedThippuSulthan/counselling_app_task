import 'dart:convert';

import 'datum.dart';

class CountryList {
  bool? status;
  String? message;
  List<Datum>? data;

  CountryList({this.status, this.message, this.data});

  @override
  String toString() {
    return 'CountryList(status: $status, message: $message, data: $data)';
  }

  factory CountryList.fromMap(Map<String, dynamic> data) => CountryList(
        status: data['status'] as bool?,
        message: data['message'] as String?,
        data: (data['data'] as List<dynamic>?)
            ?.map((e) => Datum.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'status': status,
        'message': message,
        'data': data?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CountryList].
  factory CountryList.fromJson(String data) {
    return CountryList.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CountryList] to a JSON string.
  String toJson() => json.encode(toMap());
}
