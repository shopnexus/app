//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_draft_request.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CreateDraftRequest {
  /// Returns a new [CreateDraftRequest] instance.
  CreateDraftRequest({required this.listingId});

  @JsonKey(name: r'listing_id', required: true, includeIfNull: false)
  final String listingId;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreateDraftRequest && other.listingId == listingId;

  @override
  int get hashCode => listingId.hashCode;

  factory CreateDraftRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateDraftRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateDraftRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
