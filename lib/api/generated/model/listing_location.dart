//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'listing_location.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ListingLocation {
  /// Returns a new [ListingLocation] instance.
  ListingLocation({
    this.distanceKm,

    required this.districtCode,

    required this.districtName,

    required this.provinceCode,

    required this.provinceName,

    required this.wardCode,

    required this.wardName,
  });

  /// How far the goods are from where the buyer said they are. Absent unless the browse sent a position, and absent for an address that was never geocoded.
  // minimum: 0
  @JsonKey(name: r'distance_km', required: false, includeIfNull: false)
  final double? distanceKm;

  /// Null where the country has no district tier. Code and name travel together.
  @JsonKey(name: r'district_code', required: true, includeIfNull: true)
  final String? districtCode;

  @JsonKey(name: r'district_name', required: true, includeIfNull: true)
  final String? districtName;

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
      other is ListingLocation &&
          other.distanceKm == distanceKm &&
          other.districtCode == districtCode &&
          other.districtName == districtName &&
          other.provinceCode == provinceCode &&
          other.provinceName == provinceName &&
          other.wardCode == wardCode &&
          other.wardName == wardName;

  @override
  int get hashCode =>
      distanceKm.hashCode +
      (districtCode == null ? 0 : districtCode.hashCode) +
      (districtName == null ? 0 : districtName.hashCode) +
      provinceCode.hashCode +
      provinceName.hashCode +
      wardCode.hashCode +
      wardName.hashCode;

  factory ListingLocation.fromJson(Map<String, dynamic> json) =>
      _$ListingLocationFromJson(json);

  Map<String, dynamic> toJson() => _$ListingLocationToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
