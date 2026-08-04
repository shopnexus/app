// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_address_snapshot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderAddressSnapshot _$OrderAddressSnapshotFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'OrderAddressSnapshot',
  json,
  ($checkedConvert) {
    $checkKeys(json, requiredKeys: const ['country', 'full_name', 'phone']);
    final val = OrderAddressSnapshot(
      addressDetail: $checkedConvert('address_detail', (v) => v as String?),
      country: $checkedConvert('country', (v) => v as String),
      districtCode: $checkedConvert('district_code', (v) => v as String?),
      fullName: $checkedConvert('full_name', (v) => v as String),
      phone: $checkedConvert('phone', (v) => v as String),
      provinceCode: $checkedConvert('province_code', (v) => v as String?),
      wardCode: $checkedConvert('ward_code', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'addressDetail': 'address_detail',
    'districtCode': 'district_code',
    'fullName': 'full_name',
    'provinceCode': 'province_code',
    'wardCode': 'ward_code',
  },
);

Map<String, dynamic> _$OrderAddressSnapshotToJson(
  OrderAddressSnapshot instance,
) => <String, dynamic>{
  'address_detail': ?instance.addressDetail,
  'country': instance.country,
  'district_code': ?instance.districtCode,
  'full_name': instance.fullName,
  'phone': instance.phone,
  'province_code': ?instance.provinceCode,
  'ward_code': ?instance.wardCode,
};
