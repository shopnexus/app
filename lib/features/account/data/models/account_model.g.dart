// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AccountProfile _$AccountProfileFromJson(Map<String, dynamic> json) =>
    _AccountProfile(
      id: json['id'] as String,
      dateCreated: json['date_created'] as String,
      dateUpdated: json['date_updated'] as String,
      status: json['status'] as String,
      role: json['role'] as String,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      username: json['username'] as String?,
      gender: (json['gender'] as num?)?.toInt(),
      name: json['name'] as String?,
      dateOfBirth: json['date_of_birth'] as String?,
      emailVerified: json['email_verified'] as bool,
      phoneVerified: json['phone_verified'] as bool,
      defaultContactId: json['default_contact_id'] as String?,
      avatarUrl: json['avatar_url'] as String?,
      description: json['description'] as String?,
      country: json['country'] as String,
      currency: json['currency'] as String,
      internalBalance: (json['internal_balance'] as num).toInt(),
    );

Map<String, dynamic> _$AccountProfileToJson(_AccountProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date_created': instance.dateCreated,
      'date_updated': instance.dateUpdated,
      'status': instance.status,
      'role': instance.role,
      'phone': instance.phone,
      'email': instance.email,
      'username': instance.username,
      'gender': instance.gender,
      'name': instance.name,
      'date_of_birth': instance.dateOfBirth,
      'email_verified': instance.emailVerified,
      'phone_verified': instance.phoneVerified,
      'default_contact_id': instance.defaultContactId,
      'avatar_url': instance.avatarUrl,
      'description': instance.description,
      'country': instance.country,
      'currency': instance.currency,
      'internal_balance': instance.internalBalance,
    };

_Contact _$ContactFromJson(Map<String, dynamic> json) => _Contact(
  id: json['id'] as String,
  accountId: json['account_id'] as String,
  fullName: json['full_name'] as String,
  phone: json['phone'] as String,
  phoneVerified: json['phone_verified'] as bool,
  address: json['address'] as String,
  addressDetail: json['address_detail'] as String?,
  addressType: json['address_type'] as String,
  latitude: (json['latitude'] as num?)?.toDouble(),
  longitude: (json['longitude'] as num?)?.toDouble(),
  dateCreated: json['date_created'] as String,
  dateUpdated: json['date_updated'] as String,
);

Map<String, dynamic> _$ContactToJson(_Contact instance) => <String, dynamic>{
  'id': instance.id,
  'account_id': instance.accountId,
  'full_name': instance.fullName,
  'phone': instance.phone,
  'phone_verified': instance.phoneVerified,
  'address': instance.address,
  'address_detail': instance.addressDetail,
  'address_type': instance.addressType,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'date_created': instance.dateCreated,
  'date_updated': instance.dateUpdated,
};
