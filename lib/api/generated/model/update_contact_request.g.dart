// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_contact_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateContactRequest _$UpdateContactRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'UpdateContactRequest',
  json,
  ($checkedConvert) {
    final val = UpdateContactRequest(
      address: $checkedConvert('address', (v) => v as String?),
      addressDetail: $checkedConvert('address_detail', (v) => v as String?),
      addressType: $checkedConvert(
        'address_type',
        (v) => $enumDecodeNullable(_$ContactAddressTypeEnumMap, v),
      ),
      clearAddressDetail: $checkedConvert(
        'clear_address_detail',
        (v) => v as bool?,
      ),
      clearDistrict: $checkedConvert('clear_district', (v) => v as bool?),
      clearLocation: $checkedConvert('clear_location', (v) => v as bool?),
      clearPostalCode: $checkedConvert('clear_postal_code', (v) => v as bool?),
      country: $checkedConvert('country', (v) => v as String?),
      districtCode: $checkedConvert('district_code', (v) => v as String?),
      districtName: $checkedConvert('district_name', (v) => v as String?),
      fullName: $checkedConvert('full_name', (v) => v as String?),
      isDefaultDelivery: $checkedConvert(
        'is_default_delivery',
        (v) => v as bool?,
      ),
      isDefaultPickup: $checkedConvert('is_default_pickup', (v) => v as bool?),
      latitude: $checkedConvert('latitude', (v) => (v as num?)?.toDouble()),
      longitude: $checkedConvert('longitude', (v) => (v as num?)?.toDouble()),
      phone: $checkedConvert('phone', (v) => v as String?),
      postalCode: $checkedConvert('postal_code', (v) => v as String?),
      provinceCode: $checkedConvert('province_code', (v) => v as String?),
      provinceName: $checkedConvert('province_name', (v) => v as String?),
      wardCode: $checkedConvert('ward_code', (v) => v as String?),
      wardName: $checkedConvert('ward_name', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'addressDetail': 'address_detail',
    'addressType': 'address_type',
    'clearAddressDetail': 'clear_address_detail',
    'clearDistrict': 'clear_district',
    'clearLocation': 'clear_location',
    'clearPostalCode': 'clear_postal_code',
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

Map<String, dynamic> _$UpdateContactRequestToJson(
  UpdateContactRequest instance,
) => <String, dynamic>{
  if (instance.address case final value?) 'address': value,
  if (instance.addressDetail case final value?) 'address_detail': value,
  if (_$ContactAddressTypeEnumMap[instance.addressType] case final value?)
    'address_type': value,
  if (instance.clearAddressDetail case final value?)
    'clear_address_detail': value,
  if (instance.clearDistrict case final value?) 'clear_district': value,
  if (instance.clearLocation case final value?) 'clear_location': value,
  if (instance.clearPostalCode case final value?) 'clear_postal_code': value,
  if (instance.country case final value?) 'country': value,
  if (instance.districtCode case final value?) 'district_code': value,
  if (instance.districtName case final value?) 'district_name': value,
  if (instance.fullName case final value?) 'full_name': value,
  if (instance.isDefaultDelivery case final value?)
    'is_default_delivery': value,
  if (instance.isDefaultPickup case final value?) 'is_default_pickup': value,
  if (instance.latitude case final value?) 'latitude': value,
  if (instance.longitude case final value?) 'longitude': value,
  if (instance.phone case final value?) 'phone': value,
  if (instance.postalCode case final value?) 'postal_code': value,
  if (instance.provinceCode case final value?) 'province_code': value,
  if (instance.provinceName case final value?) 'province_name': value,
  if (instance.wardCode case final value?) 'ward_code': value,
  if (instance.wardName case final value?) 'ward_name': value,
};

const _$ContactAddressTypeEnumMap = {
  ContactAddressType.home: 'home',
  ContactAddressType.work: 'work',
};
