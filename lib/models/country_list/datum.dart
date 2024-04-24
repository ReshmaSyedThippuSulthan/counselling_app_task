import 'dart:convert';

class Datum {
  int? id;
  String? name;
  String? code;
  String? telCode;
  dynamic timezone;
  String? flag;
  String? createdAt;
  String? updatedAt;

  Datum({
    this.id,
    this.name,
    this.code,
    this.telCode,
    this.timezone,
    this.flag,
    this.createdAt,
    this.updatedAt,
  });

  @override
  String toString() {
    return 'Datum(id: $id, name: $name, code: $code, telCode: $telCode, timezone: $timezone, flag: $flag, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  factory Datum.fromMap(Map<String, dynamic> data) => Datum(
        id: data['id'] as int?,
        name: data['name'] as String?,
        code: data['code'] as String?,
        telCode: data['tel_code'] as String?,
        timezone: data['timezone'] as dynamic,
        flag: data['flag'] as String?,
        createdAt: data['created_at'] as String?,
        updatedAt: data['updated_at'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'code': code,
        'tel_code': telCode,
        'timezone': timezone,
        'flag': flag,
        'created_at': createdAt,
        'updated_at': updatedAt,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Datum].
  factory Datum.fromJson(String data) {
    return Datum.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Datum] to a JSON string.
  String toJson() => json.encode(toMap());
}
