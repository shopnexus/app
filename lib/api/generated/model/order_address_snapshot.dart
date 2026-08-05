//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_address_snapshot.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class OrderAddressSnapshot {
  /// Returns a new [OrderAddressSnapshot] instance.
  OrderAddressSnapshot({
    this.addressDetail,

    required this.country,

    this.districtCode,

    required this.fullName,

    required this.phone,

    this.provinceCode,

    this.wardCode,
  });

  /// The street line and anything below it
  @JsonKey(name: r'address_detail', required: false, includeIfNull: false)
  final String? addressDetail;

  /// ISO 3166-1 alpha-2
  @JsonKey(name: r'country', required: true, includeIfNull: false)
  final String country;

  /// Null where the country has no district tier
  @JsonKey(name: r'district_code', required: false, includeIfNull: false)
  final String? districtCode;

  @JsonKey(name: r'full_name', required: true, includeIfNull: false)
  final String fullName;

  /// E.164
  @JsonKey(name: r'phone', required: true, includeIfNull: false)
  final String phone;

  @JsonKey(name: r'province_code', required: false, includeIfNull: false)
  final String? provinceCode;

  @JsonKey(name: r'ward_code', required: false, includeIfNull: false)
  final String? wardCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderAddressSnapshot &&
          other.addressDetail == addressDetail &&
          other.country == country &&
          other.districtCode == districtCode &&
          other.fullName == fullName &&
          other.phone == phone &&
          other.provinceCode == provinceCode &&
          other.wardCode == wardCode;

  @override
  int get hashCode =>
      (addressDetail == null ? 0 : addressDetail.hashCode) +
      country.hashCode +
      (districtCode == null ? 0 : districtCode.hashCode) +
      fullName.hashCode +
      phone.hashCode +
      provinceCode.hashCode +
      wardCode.hashCode;

  factory OrderAddressSnapshot.fromJson(Map<String, dynamic> json) =>
      _$OrderAddressSnapshotFromJson(json);

  Map<String, dynamic> toJson() => _$OrderAddressSnapshotToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
