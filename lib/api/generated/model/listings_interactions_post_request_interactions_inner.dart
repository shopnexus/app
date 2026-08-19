//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'listings_interactions_post_request_interactions_inner.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ListingsInteractionsPostRequestInteractionsInner {
  /// Returns a new [ListingsInteractionsPostRequestInteractionsInner] instance.
  ListingsInteractionsPostRequestInteractionsInner({
    required this.listingId,

    required this.type,
  });

  @JsonKey(name: r'listing_id', required: true, includeIfNull: false)
  final String listingId;

  @JsonKey(name: r'type', required: true, includeIfNull: false)
  final ListingsInteractionsPostRequestInteractionsInnerTypeEnum type;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ListingsInteractionsPostRequestInteractionsInner &&
          other.listingId == listingId &&
          other.type == type;

  @override
  int get hashCode => listingId.hashCode + type.hashCode;

  factory ListingsInteractionsPostRequestInteractionsInner.fromJson(
    Map<String, dynamic> json,
  ) => _$ListingsInteractionsPostRequestInteractionsInnerFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ListingsInteractionsPostRequestInteractionsInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

enum ListingsInteractionsPostRequestInteractionsInnerTypeEnum {
  @JsonValue(r'view')
  view(r'view'),
  @JsonValue(r'click-from-search')
  clickFromSearch(r'click-from-search'),
  @JsonValue(r'click-from-recommended')
  clickFromRecommended(r'click-from-recommended'),
  @JsonValue(r'click-from-category')
  clickFromCategory(r'click-from-category'),
  @JsonValue(r'not-interested')
  notInterested(r'not-interested'),
  @JsonValue(r'hidden')
  hidden(r'hidden');

  const ListingsInteractionsPostRequestInteractionsInnerTypeEnum(this.value);

  final String value;

  @override
  String toString() => value;
}
