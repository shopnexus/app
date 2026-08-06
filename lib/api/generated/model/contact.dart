//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/contact_address_type.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'contact.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Contact {
  /// Returns a new [Contact] instance.
  Contact({
    required this.address,

    required this.addressDetail,

    required this.addressType,

    required this.country,

    required this.createdAt,

    required this.districtCode,

    required this.districtName,

    required this.fullName,

    required this.id,

    required this.isDefaultDelivery,

    required this.isDefaultPickup,

    required this.latitude,

    required this.longitude,

    required this.phone,

    required this.phoneVerified,

    required this.postalCode,

    required this.providerCodes,

    required this.provinceCode,

    required this.provinceName,

    required this.wardCode,

    required this.wardName,
  });

  /// Street or house-number line below ward level.
  @JsonKey(name: r'address', required: true, includeIfNull: false)
  final String address;

  /// Unit or floor or notes.
  @JsonKey(name: r'address_detail', required: true, includeIfNull: true)
  final String? addressDetail;

  @JsonKey(name: r'address_type', required: true, includeIfNull: false)
  final ContactAddressType addressType;

  @JsonKey(name: r'country', required: true, includeIfNull: false)
  final String country;

  @JsonKey(name: r'created_at', required: true, includeIfNull: false)
  final DateTime createdAt;

  /// Null where the country has no district tier. Vietnam dropped it in 2025 and now goes province to ward.
  @JsonKey(name: r'district_code', required: true, includeIfNull: true)
  final String? districtCode;

  @JsonKey(name: r'district_name', required: true, includeIfNull: true)
  final String? districtName;

  @JsonKey(name: r'full_name', required: true, includeIfNull: false)
  final String fullName;

  @JsonKey(name: r'id', required: true, includeIfNull: false)
  final String id;

  @JsonKey(name: r'is_default_delivery', required: true, includeIfNull: false)
  final bool isDefaultDelivery;

  @JsonKey(name: r'is_default_pickup', required: true, includeIfNull: false)
  final bool isDefaultPickup;

  // minimum: -90
  // maximum: 90
  @JsonKey(name: r'latitude', required: true, includeIfNull: true)
  final double? latitude;

  // minimum: -180
  // maximum: 180
  @JsonKey(name: r'longitude', required: true, includeIfNull: true)
  final double? longitude;

  /// E.164.
  @JsonKey(name: r'phone', required: true, includeIfNull: false)
  final String phone;

  @JsonKey(name: r'phone_verified', required: true, includeIfNull: false)
  final bool phoneVerified;

  @JsonKey(name: r'postal_code', required: true, includeIfNull: true)
  final String? postalCode;

  /// Per-carrier territory ids. Carriers number territories their own way and some still require a district.
  @JsonKey(name: r'provider_codes', required: true, includeIfNull: false)
  final Map<String, Object> providerCodes;

  @JsonKey(name: r'province_code', required: true, includeIfNull: false)
  final String provinceCode;

  @JsonKey(name: r'province_name', required: true, includeIfNull: false)
  final String provinceName;

  @JsonKey(name: r'ward_code', required: true, includeIfNull: false)
  final String wardCode;

  @JsonKey(name: r'ward_name', required: true, includeIfNull: false)
  final String wardName;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Contact &&
          other.address == address &&
          other.addressDetail == addressDetail &&
          other.addressType == addressType &&
          other.country == country &&
          other.createdAt == createdAt &&
          other.districtCode == districtCode &&
          other.districtName == districtName &&
          other.fullName == fullName &&
          other.id == id &&
          other.isDefaultDelivery == isDefaultDelivery &&
          other.isDefaultPickup == isDefaultPickup &&
          other.latitude == latitude &&
          other.longitude == longitude &&
          other.phone == phone &&
          other.phoneVerified == phoneVerified &&
          other.postalCode == postalCode &&
          other.providerCodes == providerCodes &&
          other.provinceCode == provinceCode &&
          other.provinceName == provinceName &&
          other.wardCode == wardCode &&
          other.wardName == wardName;

  @override
  int get hashCode =>
      address.hashCode +
      (addressDetail == null ? 0 : addressDetail.hashCode) +
      addressType.hashCode +
      country.hashCode +
      createdAt.hashCode +
      (districtCode == null ? 0 : districtCode.hashCode) +
      (districtName == null ? 0 : districtName.hashCode) +
      fullName.hashCode +
      id.hashCode +
      isDefaultDelivery.hashCode +
      isDefaultPickup.hashCode +
      (latitude == null ? 0 : latitude.hashCode) +
      (longitude == null ? 0 : longitude.hashCode) +
      phone.hashCode +
      phoneVerified.hashCode +
      (postalCode == null ? 0 : postalCode.hashCode) +
      providerCodes.hashCode +
      provinceCode.hashCode +
      provinceName.hashCode +
      wardCode.hashCode +
      wardName.hashCode;

  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);

  Map<String, dynamic> toJson() => _$ContactToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
