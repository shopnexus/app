// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Resource _$ResourceFromJson(Map<String, dynamic> json) => _Resource(
  id: json['id'] as String,
  mime: json['mime'] as String,
  objectKey: json['object_key'] as String,
  provider: json['provider'] as String,
  size: (json['size'] as num).toInt(),
  checksum: json['checksum'] as String?,
  url: json['url'] as String?,
  urlExpiresAt: json['url_expires_at'] as String?,
);

Map<String, dynamic> _$ResourceToJson(_Resource instance) => <String, dynamic>{
  'id': instance.id,
  'mime': instance.mime,
  'object_key': instance.objectKey,
  'provider': instance.provider,
  'size': instance.size,
  'checksum': instance.checksum,
  'url': instance.url,
  'url_expires_at': instance.urlExpiresAt,
};

_Profile _$ProfileFromJson(Map<String, dynamic> json) => _Profile(
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
  gender: json['gender'],
);

Map<String, dynamic> _$ProfileToJson(_Profile instance) => <String, dynamic>{
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

_Me _$MeFromJson(Map<String, dynamic> json) => _Me(
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

Map<String, dynamic> _$MeToJson(_Me instance) => <String, dynamic>{
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

_PublicAccount _$PublicAccountFromJson(Map<String, dynamic> json) =>
    _PublicAccount(
      id: json['id'] as String,
      name: json['name'] as String,
      followerCount: (json['follower_count'] as num).toInt(),
      identityVerified: json['identity_verified'] as bool,
      createdAt: json['created_at'] as String,
      description: json['description'] as String?,
      avatar: json['avatar'] == null
          ? null
          : Resource.fromJson(json['avatar'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PublicAccountToJson(_PublicAccount instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'follower_count': instance.followerCount,
      'identity_verified': instance.identityVerified,
      'created_at': instance.createdAt,
      'description': instance.description,
      'avatar': instance.avatar,
    };

_Contact _$ContactFromJson(Map<String, dynamic> json) => _Contact(
  id: json['id'] as String,
  fullName: json['full_name'] as String,
  phone: _parsePhone(json['phone']),
  phoneVerified: json['phone_verified'] as bool,
  address: json['address'] as String,
  addressDetail: json['address_detail'] as String?,
  addressType: json['address_type'] as String,
  country: json['country'] as String,
  provinceCode: json['province_code'] as String,
  provinceName: json['province_name'] as String,
  districtCode: json['district_code'] as String?,
  districtName: json['district_name'] as String?,
  wardCode: json['ward_code'] as String,
  wardName: json['ward_name'] as String,
  postalCode: json['postal_code'] as String?,
  isDefaultDelivery: json['is_default_delivery'] as bool,
  isDefaultPickup: json['is_default_pickup'] as bool,
  latitude: (json['latitude'] as num?)?.toDouble(),
  longitude: (json['longitude'] as num?)?.toDouble(),
  createdAt: json['created_at'] as String,
);

Map<String, dynamic> _$ContactToJson(_Contact instance) => <String, dynamic>{
  'id': instance.id,
  'full_name': instance.fullName,
  'phone': instance.phone,
  'phone_verified': instance.phoneVerified,
  'address': instance.address,
  'address_detail': instance.addressDetail,
  'address_type': instance.addressType,
  'country': instance.country,
  'province_code': instance.provinceCode,
  'province_name': instance.provinceName,
  'district_code': instance.districtCode,
  'district_name': instance.districtName,
  'ward_code': instance.wardCode,
  'ward_name': instance.wardName,
  'postal_code': instance.postalCode,
  'is_default_delivery': instance.isDefaultDelivery,
  'is_default_pickup': instance.isDefaultPickup,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'created_at': instance.createdAt,
};

_AccountFavorite _$AccountFavoriteFromJson(Map<String, dynamic> json) =>
    _AccountFavorite(
      id: (json['id'] as num).toInt(),
      accountId: json['account_id'] as String,
      spuId: json['spu_id'] as String,
      dateCreated: json['date_created'] as String,
    );

Map<String, dynamic> _$AccountFavoriteToJson(_AccountFavorite instance) =>
    <String, dynamic>{
      'id': instance.id,
      'account_id': instance.accountId,
      'spu_id': instance.spuId,
      'date_created': instance.dateCreated,
    };

_NotificationMetadata _$NotificationMetadataFromJson(
  Map<String, dynamic> json,
) => _NotificationMetadata(
  orderId: json['order_id'] as String?,
  ticketId: json['ticket_id'] as String?,
  redirectUrl: json['redirect_url'] as String?,
);

Map<String, dynamic> _$NotificationMetadataToJson(
  _NotificationMetadata instance,
) => <String, dynamic>{
  'order_id': instance.orderId,
  'ticket_id': instance.ticketId,
  'redirect_url': instance.redirectUrl,
};

_Notification _$NotificationFromJson(Map<String, dynamic> json) =>
    _Notification(
      title: json['title'] as String,
      category: json['category'] as String,
      createdAt: json['created_at'] as String,
      payload: json['payload'] as Map<String, dynamic>?,
      readAt: json['read_at'] as String?,
      legacyId: (json['legacyId'] as num?)?.toInt(),
      legacyContent: json['legacyContent'] as String?,
    );

Map<String, dynamic> _$NotificationToJson(_Notification instance) =>
    <String, dynamic>{
      'title': instance.title,
      'category': instance.category,
      'created_at': instance.createdAt,
      'payload': instance.payload,
      'read_at': instance.readAt,
      'legacyId': instance.legacyId,
      'legacyContent': instance.legacyContent,
    };

_UnreadCountResponse _$UnreadCountResponseFromJson(Map<String, dynamic> json) =>
    _UnreadCountResponse(unread: (json['unread'] as num).toInt());

Map<String, dynamic> _$UnreadCountResponseToJson(
  _UnreadCountResponse instance,
) => <String, dynamic>{'unread': instance.unread};

_MarkNotificationsReadRequest _$MarkNotificationsReadRequestFromJson(
  Map<String, dynamic> json,
) => _MarkNotificationsReadRequest(before: json['before'] as String);

Map<String, dynamic> _$MarkNotificationsReadRequestToJson(
  _MarkNotificationsReadRequest instance,
) => <String, dynamic>{'before': instance.before};

_ReadNotificationsRequest _$ReadNotificationsRequestFromJson(
  Map<String, dynamic> json,
) => _ReadNotificationsRequest(
  ids: (json['ids'] as List<dynamic>).map((e) => (e as num).toInt()).toList(),
);

Map<String, dynamic> _$ReadNotificationsRequestToJson(
  _ReadNotificationsRequest instance,
) => <String, dynamic>{'ids': instance.ids};

_MessageResponse _$MessageResponseFromJson(Map<String, dynamic> json) =>
    _MessageResponse(message: json['message'] as String);

Map<String, dynamic> _$MessageResponseToJson(_MessageResponse instance) =>
    <String, dynamic>{'message': instance.message};
