import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_model.freezed.dart';

part 'account_model.g.dart';

/// Resource model dùng chung cho Avatar, tài liệu, v.v. theo OpenAPI
@freezed
abstract class Resource with _$Resource {
  const factory Resource({
    required String id,
    required String mime,
    @JsonKey(name: 'object_key') required String objectKey,
    required String provider,
    required int size,
    String? checksum,
    String? url,
    @JsonKey(name: 'url_expires_at') String? urlExpiresAt,
  }) = _Resource;

  factory Resource.fromJson(Map<String, dynamic> json) =>
      _$ResourceFromJson(json);
}

/// Profile model chứa thông tin công khai của User/Seller
@freezed
abstract class Profile with _$Profile {
  const factory Profile({
    required String name,
    required String country,
    required String locale,
    required String timezone,
    @JsonKey(name: 'created_at') required String createdAt,
    Resource? avatar,
    @JsonKey(name: 'date_of_birth') String? dateOfBirth,
    String? description,
    dynamic gender,
  }) = _Profile;

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);
}

/// Model Me đại diện cho tài khoản hiện tại (GET /me)
@freezed
abstract class Me with _$Me {
  const Me._();

  const factory Me({
    required String id,
    @JsonKey(name: 'created_at') required String createdAt,
    String? email,
    @JsonKey(name: 'email_verified') required bool emailVerified,
    @JsonKey(name: 'has_password') required bool hasPassword,
    @JsonKey(name: 'identity_verified') required bool identityVerified,
    String? phone,
    Profile? profile,
    required String role,
    required String status,
    String? username,
  }) = _Me;

  factory Me.fromJson(Map<String, dynamic> json) => _$MeFromJson(json);

  // Derived from what the route actually sends.
  String get dateCreated => createdAt;

  String get name => profile?.name ?? username ?? email ?? 'Người dùng';

  String? get avatarUrl => profile?.avatar?.url;

  String? get dateOfBirth => profile?.dateOfBirth;

  String? get description => profile?.description;

  String? get gender => profile?.gender?.toString();

  String get country => profile?.country ?? 'VN';

  /// TODO(cart): not a field of `GET /me` — a preferred currency is finance's, and
  /// `lib/features/cart` is the only reader.
  String get currency => 'VND';
}

/// Alias tương thích
typedef AccountProfile = Me;
typedef UserProfile = Me;

/// PublicAccount dùng khi xem thông tin tài khoản public của người khác
@freezed
abstract class PublicAccount with _$PublicAccount {
  const PublicAccount._();

  const factory PublicAccount({
    required String id,
    required String name,
    @JsonKey(name: 'follower_count') required int followerCount,
    @JsonKey(name: 'identity_verified') required bool identityVerified,
    @JsonKey(name: 'created_at') required String createdAt,
    String? description,
    Resource? avatar,
  }) = _PublicAccount;

  factory PublicAccount.fromJson(Map<String, dynamic> json) =>
      _$PublicAccountFromJson(json);

  String? get avatarUrl => avatar?.url;
}

String _parsePhone(dynamic value) {
  if (value == null) return '';
  return value.toString();
}

/// Read-only: every write goes through the generated `CreateContactRequest` /
/// `UpdateContactRequest`. This one survives as a hand-written model because
/// `lib/features/{catalog,checkout}` name it too, and moving them to the
/// generated `Contact` — whose `address_type` is an enum — is theirs to do.
@freezed
abstract class Contact with _$Contact {
  const factory Contact({
    required String id,
    @JsonKey(name: 'full_name') required String fullName,
    @JsonKey(fromJson: _parsePhone) required String phone,
    @JsonKey(name: 'phone_verified') required bool phoneVerified,
    required String address,
    @JsonKey(name: 'address_detail') String? addressDetail,
    @JsonKey(name: 'address_type')
    required String addressType, // 'home' | 'work'
    required String country,
    @JsonKey(name: 'province_code') required String provinceCode,
    @JsonKey(name: 'province_name') required String provinceName,
    @JsonKey(name: 'district_code') String? districtCode,
    @JsonKey(name: 'district_name') String? districtName,
    @JsonKey(name: 'ward_code') required String wardCode,
    @JsonKey(name: 'ward_name') required String wardName,
    @JsonKey(name: 'postal_code') String? postalCode,
    @JsonKey(name: 'is_default_delivery') required bool isDefaultDelivery,
    @JsonKey(name: 'is_default_pickup') required bool isDefaultPickup,
    double? latitude,
    double? longitude,
    @JsonKey(name: 'created_at') required String createdAt,
  }) = _Contact;

  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);
}

@freezed
abstract class AccountFavorite with _$AccountFavorite {
  const factory AccountFavorite({
    required int id,
    @JsonKey(name: 'account_id') required String accountId,
    @JsonKey(name: 'spu_id') required String spuId,
    @JsonKey(name: 'date_created') required String dateCreated,
  }) = _AccountFavorite;

  factory AccountFavorite.fromJson(Map<String, dynamic> json) =>
      _$AccountFavoriteFromJson(json);
}

@freezed
abstract class MessageResponse with _$MessageResponse {
  const factory MessageResponse({required String message}) = _MessageResponse;

  factory MessageResponse.fromJson(Map<String, dynamic> json) =>
      _$MessageResponseFromJson(json);
}
