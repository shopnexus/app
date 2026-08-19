//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/listings_interactions_post_request_interactions_inner.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'listings_interactions_post_request.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ListingsInteractionsPostRequest {
  /// Returns a new [ListingsInteractionsPostRequest] instance.
  ListingsInteractionsPostRequest({required this.interactions});

  @JsonKey(name: r'interactions', required: true, includeIfNull: false)
  final List<ListingsInteractionsPostRequestInteractionsInner> interactions;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ListingsInteractionsPostRequest &&
          other.interactions == interactions;

  @override
  int get hashCode => interactions.hashCode;

  factory ListingsInteractionsPostRequest.fromJson(Map<String, dynamic> json) =>
      _$ListingsInteractionsPostRequestFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ListingsInteractionsPostRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
