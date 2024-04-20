import 'dart:convert';

class Data {
  int? id;
  String? title;
  String? content;
  String? publishedAt;
  int? enabled;
  String? createdAt;
  String? updatedAt;

  Data({
    this.id,
    this.title,
    this.content,
    this.publishedAt,
    this.enabled,
    this.createdAt,
    this.updatedAt,
  });

  @override
  String toString() {
    return 'Data(id: $id, title: $title, content: $content, publishedAt: $publishedAt, enabled: $enabled, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  factory Data.fromMap(Map<String, dynamic> data) => Data(
        id: data['id'] as int?,
        title: data['title'] as String?,
        content: data['content'] as String?,
        publishedAt: data['published_at'] as String?,
        enabled: data['enabled'] as int?,
        createdAt: data['created_at'] as String?,
        updatedAt: data['updated_at'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'content': content,
        'published_at': publishedAt,
        'enabled': enabled,
        'created_at': createdAt,
        'updated_at': updatedAt,
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
