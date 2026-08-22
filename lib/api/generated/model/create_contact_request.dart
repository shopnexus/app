//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/contact_address_type.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_contact_request.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CreateContactRequest {
  /// Returns a new [CreateContactRequest] instance.
  CreateContactRequest({
    required this.address,

    this.addressDetail,

    required this.addressType,

    required this.country,

    this.districtCode,

    this.districtName,

    required this.fullName,

    this.isDefaultDelivery = false,

    this.isDefaultPickup = false,

    this.latitude,

    this.longitude,

    required this.phone,

    this.postalCode,

    required this.provinceCode,

    required this.provinceName,

    required this.wardCode,

    required this.wardName,
  });

  @JsonKey(name: r'address', required: true, includeIfNull: false)
  final String address;

  @JsonKey(name: r'address_detail', required: false, includeIfNull: false)
  final String? addressDetail;

  @JsonKey(name: r'address_type', required: true, includeIfNull: false)
  final ContactAddressType addressType;

  @JsonKey(name: r'country', required: true, includeIfNull: false)
  final String country;

  /// Send both district fields or neither.
  @JsonKey(name: r'district_code', required: false, includeIfNull: false)
  final String? districtCode;

  @JsonKey(name: r'district_name', required: false, includeIfNull: false)
  final String? districtName;

  @JsonKey(name: r'full_name', required: true, includeIfNull: false)
  final String fullName;

  @JsonKey(
    defaultValue: false,
    name: r'is_default_delivery',
    required: false,
    includeIfNull: false,
  )
  final bool? isDefaultDelivery;

  @JsonKey(
    defaultValue: false,
    name: r'is_default_pickup',
    required: false,
    includeIfNull: false,
  )
  final bool? isDefaultPickup;

  // minimum: -90
  // maximum: 90
  @JsonKey(name: r'latitude', required: false, includeIfNull: false)
  final double? latitude;

  // minimum: -180
  // maximum: 180
  @JsonKey(name: r'longitude', required: false, includeIfNull: false)
  final double? longitude;

  @JsonKey(name: r'phone', required: true, includeIfNull: false)
  final String phone;

  @JsonKey(name: r'postal_code', required: false, includeIfNull: false)
  final String? postalCode;

  /// A province code from /administrative-areas. It and the ward code must name a real pair, or the request is 400.
  @JsonKey(name: r'province_code', required: true, includeIfNull: false)
  final String provinceCode;

  /// Ignored: the name is resolved from the code against /administrative-areas, so two addresses with one code cannot disagree. Still required, so a client that has the name need not look it up to send a valid body.
  @JsonKey(name: r'province_name', required: true, includeIfNull: false)
  final String provinceName;

  /// A ward code from /administrative-areas, under the province named above.
  @JsonKey(name: r'ward_code', required: true, includeIfNull: false)
  final String wardCode;

  /// Ignored: the name is resolved from the code against /administrative-areas, so two addresses with one code cannot disagree. Still required, so a client that has the name need not look it up to send a valid body.
  @JsonKey(name: r'ward_name', required: true, includeIfNull: false)
  final String wardName;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreateContactRequest &&
          other.address == address &&
          other.addressDetail == addressDetail &&
          other.addressType == addressType &&
          other.country == country &&
          other.districtCode == districtCode &&
          other.districtName == districtName &&
          other.fullName == fullName &&
          other.isDefaultDelivery == isDefaultDelivery &&
          other.isDefaultPickup == isDefaultPickup &&
          other.latitude == latitude &&
          other.longitude == longitude &&
          other.phone == phone &&
          other.postalCode == postalCode &&
          other.provinceCode == provinceCode &&
          other.provinceName == provinceName &&
          other.wardCode == wardCode &&
          other.wardName == wardName;

  @override
  int get hashCode =>
      address.hashCode +
      addressDetail.hashCode +
      addressType.hashCode +
      country.hashCode +
      districtCode.hashCode +
      districtName.hashCode +
      fullName.hashCode +
      isDefaultDelivery.hashCode +
      isDefaultPickup.hashCode +
      latitude.hashCode +
      longitude.hashCode +
      phone.hashCode +
      postalCode.hashCode +
      provinceCode.hashCode +
      provinceName.hashCode +
      wardCode.hashCode +
      wardName.hashCode;

  factory CreateContactRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateContactRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateContactRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
