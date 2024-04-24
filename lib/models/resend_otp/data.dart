import 'dart:convert';

class Data {
  int? id;
  dynamic name;
  dynamic email;
  int? countryId;
  String? phone;
  dynamic phoneVerifiedAt;
  dynamic avatar;
  dynamic approvedAt;
  dynamic detailsType;
  dynamic detailsId;
  int? profileStatusId;
  int? reviewCount;
  String? reviewRating;
  DateTime? createdAt;
  DateTime? updatedAt;

  Data({
    this.id,
    this.name,
    this.email,
    this.countryId,
    this.phone,
    this.phoneVerifiedAt,
    this.avatar,
    this.approvedAt,
    this.detailsType,
    this.detailsId,
    this.profileStatusId,
    this.reviewCount,
    this.reviewRating,
    this.createdAt,
    this.updatedAt,
  });

  @override
  String toString() {
    return 'Data(id: $id, name: $name, email: $email, countryId: $countryId, phone: $phone, phoneVerifiedAt: $phoneVerifiedAt, avatar: $avatar, approvedAt: $approvedAt, detailsType: $detailsType, detailsId: $detailsId, profileStatusId: $profileStatusId, reviewCount: $reviewCount, reviewRating: $reviewRating, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  factory Data.fromMap(Map<String, dynamic> data) => Data(
        id: data['id'] as int?,
        name: data['name'] as dynamic,
        email: data['email'] as dynamic,
        countryId: data['country_id'] as int?,
        phone: data['phone'] as String?,
        phoneVerifiedAt: data['phone_verified_at'] as dynamic,
        avatar: data['avatar'] as dynamic,
        approvedAt: data['approved_at'] as dynamic,
        detailsType: data['details_type'] as dynamic,
        detailsId: data['details_id'] as dynamic,
        profileStatusId: data['profile_status_id'] as int?,
        reviewCount: data['review_count'] as int?,
        reviewRating: data['review_rating'] as String?,
        createdAt: data['created_at'] == null
            ? null
            : DateTime.parse(data['created_at'] as String),
        updatedAt: data['updated_at'] == null
            ? null
            : DateTime.parse(data['updated_at'] as String),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'email': email,
        'country_id': countryId,
        'phone': phone,
        'phone_verified_at': phoneVerifiedAt,
        'avatar': avatar,
        'approved_at': approvedAt,
        'details_type': detailsType,
        'details_id': detailsId,
        'profile_status_id': profileStatusId,
        'review_count': reviewCount,
        'review_rating': reviewRating,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
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
