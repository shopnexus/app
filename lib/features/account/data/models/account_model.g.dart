// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileImpl _$$ProfileImplFromJson(Map<String, dynamic> json) =>
    _$ProfileImpl(
      name: json['name'] as String,
      country: json['country'] as String,
      locale: json['locale'] as String,
      timezone: json['timezone'] as String,
      createdAt: json['created_at'] as String,
      avatar: json['avatar'] == null
          ? null
          : Resource.fromJson(json['avatar'] as Map<String, dynamic>),
      dateOfBirth: json['date_of_birth'] as String?,
      description: json['description'] as String?,
      gender: json['gender'] as String?,
    );

Map<String, dynamic> _$$ProfileImplToJson(_$ProfileImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'country': instance.country,
      'locale': instance.locale,
      'timezone': instance.timezone,
      'created_at': instance.createdAt,
      'avatar': instance.avatar,
      'date_of_birth': instance.dateOfBirth,
      'description': instance.description,
      'gender': instance.gender,
    };

_$MeImpl _$$MeImplFromJson(Map<String, dynamic> json) => _$MeImpl(
  id: json['id'] as String,
  createdAt: json['created_at'] as String,
  email: json['email'] as String?,
  emailVerified: json['email_verified'] as bool,
  hasPassword: json['has_password'] as bool,
  identityVerified: json['identity_verified'] as bool,
  phone: json['phone'] as String?,
  profile: json['profile'] == null
      ? null
      : Profile.fromJson(json['profile'] as Map<String, dynamic>),
  role: json['role'] as String,
  status: json['status'] as String,
  username: json['username'] as String?,
);

Map<String, dynamic> _$$MeImplToJson(_$MeImpl instance) => <String, dynamic>{
  'id': instance.id,
  'created_at': instance.createdAt,
  'email': instance.email,
  'email_verified': instance.emailVerified,
  'has_password': instance.hasPassword,
  'identity_verified': instance.identityVerified,
  'phone': instance.phone,
  'profile': instance.profile,
  'role': instance.role,
  'status': instance.status,
  'username': instance.username,
};

_$PublicAccountImpl _$$PublicAccountImplFromJson(Map<String, dynamic> json) =>
    _$PublicAccountImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      followerCount: (json['follower_count'] as num).toInt(),
      identityVerified: json['identity_verified'] as bool,
      following: json['following'] as bool,
      createdAt: json['created_at'] as String,
      description: json['description'] as String?,
      avatar: json['avatar'] == null
          ? null
          : Resource.fromJson(json['avatar'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PublicAccountImplToJson(_$PublicAccountImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'follower_count': instance.followerCount,
      'identity_verified': instance.identityVerified,
      'following': instance.following,
      'created_at': instance.createdAt,
      'description': instance.description,
      'avatar': instance.avatar,
    };
