import 'dart:convert';

import 'country.dart';

class Data {
  String? profileStatus;
  String? role;
  dynamic selectedCountry;
  List<Country>? countries;

  Data({
    this.profileStatus,
    this.role,
    this.selectedCountry,
    this.countries,
  });

  @override
  String toString() {
    return 'Data(profileStatus: $profileStatus, role: $role, selectedCountry: $selectedCountry, countries: $countries)';
  }

  factory Data.fromMap(Map<String, dynamic> data) => Data(
        profileStatus: data['profile_status'] as String?,
        role: data['role'] as String?,
        selectedCountry: data['selected_country'] as dynamic,
        countries: (data['countries'] as List<dynamic>?)
            ?.map((e) => Country.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'profile_status': profileStatus,
        'role': role,
        'selected_country': selectedCountry,
        'countries': countries?.map((e) => e.toMap()).toList(),
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
