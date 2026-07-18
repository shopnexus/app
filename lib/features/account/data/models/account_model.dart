import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_model.freezed.dart';

part 'account_model.g.dart';

@freezed
abstract class AccountProfile with _$AccountProfile {
  const factory AccountProfile({
    required String id,
    @JsonKey(name: 'date_created') required String dateCreated,
    @JsonKey(name: 'date_updated') required String dateUpdated,
    required String status,
    required String role,
    String? phone,
    String? email,
    String? username,
    int? gender,
    String? name,
    @JsonKey(name: 'date_of_birth') String? dateOfBirth,
    @JsonKey(name: 'email_verified') required bool emailVerified,
    @JsonKey(name: 'phone_verified') required bool phoneVerified,
    @JsonKey(name: 'default_contact_id') String? defaultContactId,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    String? description,
    required String country,
    required String currency,
    @JsonKey(name: 'internal_balance') required int internalBalance,
  }) = _AccountProfile;

  factory AccountProfile.fromJson(Map<String, dynamic> json) =>
      _$AccountProfileFromJson(json);
}

@freezed
abstract class Contact with _$Contact {
  const factory Contact({
    required String id,
    @JsonKey(name: 'account_id') required String accountId,
    @JsonKey(name: 'full_name') required String fullName,
    required String phone,
    @JsonKey(name: 'phone_verified') required bool phoneVerified,
    required String address,
    @JsonKey(name: 'address_detail') String? addressDetail,
    @JsonKey(name: 'address_type')
    required String addressType, // 'Home' | 'Office' | 'Other'
    double? latitude,
    double? longitude,
    @JsonKey(name: 'date_created') required String dateCreated,
    @JsonKey(name: 'date_updated') required String dateUpdated,
  }) = _Contact;

  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);
}
