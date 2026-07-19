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

_UpdateProfileRequest _$UpdateProfileRequestFromJson(
  Map<String, dynamic> json,
) => _UpdateProfileRequest(
  username: json['username'] as String?,
  phone: json['phone'] as String?,
  email: json['email'] as String?,
  gender: json['gender'] as String?,
  name: json['name'] as String?,
  dateOfBirth: json['date_of_birth'] as String?,
  avatarRsId: json['avatar_rs_id'] as String?,
  defaultContactId: json['default_contact_id'] as String?,
  description: json['description'] as String?,
);

Map<String, dynamic> _$UpdateProfileRequestToJson(
  _UpdateProfileRequest instance,
) => <String, dynamic>{
  'username': instance.username,
  'phone': instance.phone,
  'email': instance.email,
  'gender': instance.gender,
  'name': instance.name,
  'date_of_birth': instance.dateOfBirth,
  'avatar_rs_id': instance.avatarRsId,
  'default_contact_id': instance.defaultContactId,
  'description': instance.description,
};

_UpdateCountryRequest _$UpdateCountryRequestFromJson(
  Map<String, dynamic> json,
) => _UpdateCountryRequest(country: json['country'] as String);

Map<String, dynamic> _$UpdateCountryRequestToJson(
  _UpdateCountryRequest instance,
) => <String, dynamic>{'country': instance.country};

_UpdateCountryResponse _$UpdateCountryResponseFromJson(
  Map<String, dynamic> json,
) => _UpdateCountryResponse(
  country: json['country'] as String,
  inferredCurrency: json['inferred_currency'] as String,
);

Map<String, dynamic> _$UpdateCountryResponseToJson(
  _UpdateCountryResponse instance,
) => <String, dynamic>{
  'country': instance.country,
  'inferred_currency': instance.inferredCurrency,
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

_CreateContactRequest _$CreateContactRequestFromJson(
  Map<String, dynamic> json,
) => _CreateContactRequest(
  fullName: json['full_name'] as String,
  phone: json['phone'] as String,
  address: json['address'] as String,
  addressDetail: json['address_detail'] as String?,
  addressType: json['address_type'] as String,
  latitude: (json['latitude'] as num).toDouble(),
  longitude: (json['longitude'] as num).toDouble(),
);

Map<String, dynamic> _$CreateContactRequestToJson(
  _CreateContactRequest instance,
) => <String, dynamic>{
  'full_name': instance.fullName,
  'phone': instance.phone,
  'address': instance.address,
  'address_detail': instance.addressDetail,
  'address_type': instance.addressType,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
};

_UpdateContactRequest _$UpdateContactRequestFromJson(
  Map<String, dynamic> json,
) => _UpdateContactRequest(
  contactId: json['contact_id'] as String,
  fullName: json['full_name'] as String?,
  phone: json['phone'] as String?,
  address: json['address'] as String?,
  addressDetail: json['address_detail'] as String?,
  addressType: json['address_type'] as String?,
  phoneVerified: json['phone_verified'] as bool?,
  latitude: (json['latitude'] as num?)?.toDouble(),
  longitude: (json['longitude'] as num?)?.toDouble(),
);

Map<String, dynamic> _$UpdateContactRequestToJson(
  _UpdateContactRequest instance,
) => <String, dynamic>{
  'contact_id': instance.contactId,
  'full_name': instance.fullName,
  'phone': instance.phone,
  'address': instance.address,
  'address_detail': instance.addressDetail,
  'address_type': instance.addressType,
  'phone_verified': instance.phoneVerified,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
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
  refundId: json['refund_id'] as String?,
  redirectUrl: json['redirect_url'] as String?,
);

Map<String, dynamic> _$NotificationMetadataToJson(
  _NotificationMetadata instance,
) => <String, dynamic>{
  'order_id': instance.orderId,
  'refund_id': instance.refundId,
  'redirect_url': instance.redirectUrl,
};

_Notification _$NotificationFromJson(Map<String, dynamic> json) =>
    _Notification(
      id: (json['id'] as num).toInt(),
      accountId: json['account_id'] as String,
      type: json['type'] as String,
      channel: json['channel'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      isRead: json['is_read'] as bool,
      metadata: json['metadata'] == null
          ? null
          : NotificationMetadata.fromJson(
              json['metadata'] as Map<String, dynamic>,
            ),
      dateCreated: json['date_created'] as String,
    );

Map<String, dynamic> _$NotificationToJson(_Notification instance) =>
    <String, dynamic>{
      'id': instance.id,
      'account_id': instance.accountId,
      'type': instance.type,
      'channel': instance.channel,
      'title': instance.title,
      'content': instance.content,
      'is_read': instance.isRead,
      'metadata': instance.metadata,
      'date_created': instance.dateCreated,
    };

_UnreadCountResponse _$UnreadCountResponseFromJson(Map<String, dynamic> json) =>
    _UnreadCountResponse(count: (json['count'] as num).toInt());

Map<String, dynamic> _$UnreadCountResponseToJson(
  _UnreadCountResponse instance,
) => <String, dynamic>{'count': instance.count};

_ReadNotificationsRequest _$ReadNotificationsRequestFromJson(
  Map<String, dynamic> json,
) => _ReadNotificationsRequest(
  ids: (json['ids'] as List<dynamic>).map((e) => (e as num).toInt()).toList(),
);

Map<String, dynamic> _$ReadNotificationsRequestToJson(
  _ReadNotificationsRequest instance,
) => <String, dynamic>{'ids': instance.ids};

_BuyerOrderItem _$BuyerOrderItemFromJson(Map<String, dynamic> json) =>
    _BuyerOrderItem(
      id: (json['id'] as num).toInt(),
      orderId: json['order_id'] as String?,
      skuId: json['sku_id'] as String,
      spuId: json['spu_id'] as String,
      skuName: json['sku_name'] as String,
      quantity: (json['quantity'] as num).toInt(),
      subtotalAmount: (json['subtotal_amount'] as num).toInt(),
      totalAmount: (json['total_amount'] as num).toInt(),
      paymentSessionId: (json['payment_session_id'] as num?)?.toInt(),
      slug: json['slug'] as String,
      imageUrl: json['image_url'] as String?,
    );

Map<String, dynamic> _$BuyerOrderItemToJson(_BuyerOrderItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order_id': instance.orderId,
      'sku_id': instance.skuId,
      'spu_id': instance.spuId,
      'sku_name': instance.skuName,
      'quantity': instance.quantity,
      'subtotal_amount': instance.subtotalAmount,
      'total_amount': instance.totalAmount,
      'payment_session_id': instance.paymentSessionId,
      'slug': instance.slug,
      'image_url': instance.imageUrl,
    };

_BuyerOrderTransport _$BuyerOrderTransportFromJson(Map<String, dynamic> json) =>
    _BuyerOrderTransport(
      id: (json['id'] as num).toInt(),
      option: json['option'] as String,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$BuyerOrderTransportToJson(
  _BuyerOrderTransport instance,
) => <String, dynamic>{
  'id': instance.id,
  'option': instance.option,
  'status': instance.status,
};

_BuyerOrder _$BuyerOrderFromJson(Map<String, dynamic> json) => _BuyerOrder(
  id: json['id'] as String,
  buyerId: json['buyer_id'] as String,
  sellerId: json['seller_id'] as String,
  address: json['address'] as String,
  dateCreated: json['date_created'] as String,
  totalAmount: (json['total_amount'] as num).toInt(),
  items: (json['items'] as List<dynamic>)
      .map((e) => BuyerOrderItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  transport: json['transport'] == null
      ? null
      : BuyerOrderTransport.fromJson(json['transport'] as Map<String, dynamic>),
);

Map<String, dynamic> _$BuyerOrderToJson(_BuyerOrder instance) =>
    <String, dynamic>{
      'id': instance.id,
      'buyer_id': instance.buyerId,
      'seller_id': instance.sellerId,
      'address': instance.address,
      'date_created': instance.dateCreated,
      'total_amount': instance.totalAmount,
      'items': instance.items,
      'transport': instance.transport,
    };

_MessageResponse _$MessageResponseFromJson(Map<String, dynamic> json) =>
    _MessageResponse(message: json['message'] as String);

Map<String, dynamic> _$MessageResponseToJson(_MessageResponse instance) =>
    <String, dynamic>{'message': instance.message};
