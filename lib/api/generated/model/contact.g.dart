// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Contact _$ContactFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Contact',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'address',
        'address_type',
        'country',
        'created_at',
        'full_name',
        'id',
        'is_default_delivery',
        'is_default_pickup',
        'phone',
        'phone_verified',
        'province_code',
        'province_name',
        'ward_code',
        'ward_name',
      ],
    );
    final val = Contact(
      address: $checkedConvert('address', (v) => v as String),
      addressDetail: $checkedConvert('address_detail', (v) => v as String?),
      addressType: $checkedConvert(
        'address_type',
        (v) => $enumDecode(_$ContactAddressTypeEnumMap, v),
      ),
      country: $checkedConvert('country', (v) => v as String),
      createdAt: $checkedConvert(
        'created_at',
        (v) => DateTime.parse(v as String),
      ),
      districtCode: $checkedConvert('district_code', (v) => v as String?),
      districtName: $checkedConvert('district_name', (v) => v as String?),
      fullName: $checkedConvert('full_name', (v) => v as String),
      id: $checkedConvert('id', (v) => v as String),
      isDefaultDelivery: $checkedConvert(
        'is_default_delivery',
        (v) => v as bool,
      ),
      isDefaultPickup: $checkedConvert('is_default_pickup', (v) => v as bool),
      latitude: $checkedConvert('latitude', (v) => (v as num?)?.toDouble()),
      longitude: $checkedConvert('longitude', (v) => (v as num?)?.toDouble()),
      phone: $checkedConvert('phone', (v) => v as String),
      phoneVerified: $checkedConvert('phone_verified', (v) => v as bool),
      postalCode: $checkedConvert('postal_code', (v) => v as String?),
      providerCodes: $checkedConvert(
        'provider_codes',
        (v) => (v as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(k, e as Object),
        ),
      ),
      provinceCode: $checkedConvert('province_code', (v) => v as String),
      provinceName: $checkedConvert('province_name', (v) => v as String),
      wardCode: $checkedConvert('ward_code', (v) => v as String),
      wardName: $checkedConvert('ward_name', (v) => v as String),
    );
    return val;
  },
  fieldKeyMap: const {
    'addressDetail': 'address_detail',
    'addressType': 'address_type',
    'createdAt': 'created_at',
    'districtCode': 'district_code',
    'districtName': 'district_name',
    'fullName': 'full_name',
    'isDefaultDelivery': 'is_default_delivery',
    'isDefaultPickup': 'is_default_pickup',
    'phoneVerified': 'phone_verified',
    'postalCode': 'postal_code',
    'providerCodes': 'provider_codes',
    'provinceCode': 'province_code',
    'provinceName': 'province_name',
    'wardCode': 'ward_code',
    'wardName': 'ward_name',
  },
);

Map<String, dynamic> _$ContactToJson(Contact instance) => <String, dynamic>{
  'address': instance.address,
  'address_detail': ?instance.addressDetail,
  'address_type': _$ContactAddressTypeEnumMap[instance.addressType]!,
  'country': instance.country,
  'created_at': instance.createdAt.toIso8601String(),
  'district_code': ?instance.districtCode,
  'district_name': ?instance.districtName,
  'full_name': instance.fullName,
  'id': instance.id,
  'is_default_delivery': instance.isDefaultDelivery,
  'is_default_pickup': instance.isDefaultPickup,
  'latitude': ?instance.latitude,
  'longitude': ?instance.longitude,
  'phone': instance.phone,
  'phone_verified': instance.phoneVerified,
  'postal_code': ?instance.postalCode,
  'provider_codes': ?instance.providerCodes,
  'province_code': instance.provinceCode,
  'province_name': instance.provinceName,
  'ward_code': instance.wardCode,
  'ward_name': instance.wardName,
};

const _$ContactAddressTypeEnumMap = {
  ContactAddressType.home: 'home',
  ContactAddressType.work: 'work',
};
