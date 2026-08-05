//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/listing_detail.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'admin_listings_id_approval_post200_response.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AdminListingsIdApprovalPost200Response {
  /// Returns a new [AdminListingsIdApprovalPost200Response] instance.
  AdminListingsIdApprovalPost200Response({required this.data});

  @JsonKey(name: r'data', required: true, includeIfNull: false)
  final ListingDetail data;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AdminListingsIdApprovalPost200Response && other.data == data;

  @override
  int get hashCode => data.hashCode;

  factory AdminListingsIdApprovalPost200Response.fromJson(
    Map<String, dynamic> json,
  ) => _$AdminListingsIdApprovalPost200ResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AdminListingsIdApprovalPost200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
