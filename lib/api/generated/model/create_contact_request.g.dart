// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_contact_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateContactRequest _$CreateContactRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'CreateContactRequest',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'address',
        'address_type',
        'country',
        'full_name',
        'phone',
        'province_code',
        'province_name',
        'ward_code',
        'ward_name',
      ],
    );
    final val = CreateContactRequest(
      address: $checkedConvert('address', (v) => v as String),
      addressDetail: $checkedConvert('address_detail', (v) => v as String?),
      addressType: $checkedConvert(
        'address_type',
        (v) => $enumDecode(_$ContactAddressTypeEnumMap, v),
      ),
      country: $checkedConvert('country', (v) => v as String),
      districtCode: $checkedConvert('district_code', (v) => v as String?),
      districtName: $checkedConvert('district_name', (v) => v as String?),
      fullName: $checkedConvert('full_name', (v) => v as String),
      isDefaultDelivery: $checkedConvert(
        'is_default_delivery',
        (v) => v as bool? ?? false,
      ),
      isDefaultPickup: $checkedConvert(
        'is_default_pickup',
        (v) => v as bool? ?? false,
      ),
      latitude: $checkedConvert('latitude', (v) => (v as num?)?.toDouble()),
      longitude: $checkedConvert('longitude', (v) => (v as num?)?.toDouble()),
      phone: $checkedConvert('phone', (v) => v as String),
      postalCode: $checkedConvert('postal_code', (v) => v as String?),
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
    'districtCode': 'district_code',
    'districtName': 'district_name',
    'fullName': 'full_name',
    'isDefaultDelivery': 'is_default_delivery',
    'isDefaultPickup': 'is_default_pickup',
    'postalCode': 'postal_code',
    'provinceCode': 'province_code',
    'provinceName': 'province_name',
    'wardCode': 'ward_code',
    'wardName': 'ward_name',
  },
);

Map<String, dynamic> _$CreateContactRequestToJson(
  CreateContactRequest instance,
) => <String, dynamic>{
  'address': instance.address,
  if (instance.addressDetail case final value?) 'address_detail': value,
  'address_type': _$ContactAddressTypeEnumMap[instance.addressType]!,
  'country': instance.country,
  if (instance.districtCode case final value?) 'district_code': value,
  if (instance.districtName case final value?) 'district_name': value,
  'full_name': instance.fullName,
  if (instance.isDefaultDelivery case final value?)
    'is_default_delivery': value,
  if (instance.isDefaultPickup case final value?) 'is_default_pickup': value,
  if (instance.latitude case final value?) 'latitude': value,
  if (instance.longitude case final value?) 'longitude': value,
  'phone': instance.phone,
  if (instance.postalCode case final value?) 'postal_code': value,
  'province_code': instance.provinceCode,
  'province_name': instance.provinceName,
  'ward_code': instance.wardCode,
  'ward_name': instance.wardName,
};

const _$ContactAddressTypeEnumMap = {
  ContactAddressType.home: 'home',
  ContactAddressType.work: 'work',
};
