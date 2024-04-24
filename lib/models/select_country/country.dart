import 'dart:convert';

class Country {
  int? id;
  String? name;
  String? flag;
  String? image;

  Country({this.id, this.name, this.flag, this.image});

  @override
  String toString() {
    return 'Country(id: $id, name: $name, flag: $flag, image: $image)';
  }

  factory Country.fromMap(Map<String, dynamic> data) => Country(
        id: data['id'] as int?,
        name: data['name'] as String?,
        flag: data['flag'] as String?,
        image: data['image'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'flag': flag,
        'image': image,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Country].
  factory Country.fromJson(String data) {
    return Country.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Country] to a JSON string.
  String toJson() => json.encode(toMap());
}
