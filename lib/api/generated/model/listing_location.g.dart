// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listing_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListingLocation _$ListingLocationFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ListingLocation',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'district_code',
            'district_name',
            'province_code',
            'province_name',
            'ward_code',
            'ward_name',
          ],
        );
        final val = ListingLocation(
          distanceKm: $checkedConvert(
            'distance_km',
            (v) => (v as num?)?.toDouble(),
          ),
          districtCode: $checkedConvert('district_code', (v) => v as String?),
          districtName: $checkedConvert('district_name', (v) => v as String?),
          provinceCode: $checkedConvert('province_code', (v) => v as String),
          provinceName: $checkedConvert('province_name', (v) => v as String),
          wardCode: $checkedConvert('ward_code', (v) => v as String),
          wardName: $checkedConvert('ward_name', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {
        'distanceKm': 'distance_km',
        'districtCode': 'district_code',
        'districtName': 'district_name',
        'provinceCode': 'province_code',
        'provinceName': 'province_name',
        'wardCode': 'ward_code',
        'wardName': 'ward_name',
      },
    );

Map<String, dynamic> _$ListingLocationToJson(ListingLocation instance) =>
    <String, dynamic>{
      'distance_km': ?instance.distanceKm,
      'district_code': instance.districtCode,
      'district_name': instance.districtName,
      'province_code': instance.provinceCode,
      'province_name': instance.provinceName,
      'ward_code': instance.wardCode,
      'ward_name': instance.wardName,
    };
