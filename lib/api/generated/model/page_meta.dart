//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'page_meta.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PageMeta {
  /// Returns a new [PageMeta] instance.
  PageMeta({required this.limit, required this.page, required this.totalCount});

  // minimum: 1
  // maximum: 100
  @JsonKey(name: r'limit', required: true, includeIfNull: false)
  final int limit;

  /// The 1-based page this is.
  // minimum: 1
  @JsonKey(name: r'page', required: true, includeIfNull: false)
  final int page;

  /// Rows matching the filter, so a client can draw a pager. Explicitly null — not absent — when the result is a ranked top-K: an approximate nearest-neighbour search never visits the rows it did not return, so there is no total to report, and a client has to render \"more results\" rather than \"page 3 of 12\".  Named `total_count` rather than `total` because `total` is already a money field in this document (an offer's proposed total), and a generated client would end up with two `total`s meaning different things.
  // minimum: 0
  @JsonKey(name: r'total_count', required: true, includeIfNull: true)
  final int? totalCount;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PageMeta &&
          other.limit == limit &&
          other.page == page &&
          other.totalCount == totalCount;

  @override
  int get hashCode =>
      limit.hashCode +
      page.hashCode +
      (totalCount == null ? 0 : totalCount.hashCode);

  factory PageMeta.fromJson(Map<String, dynamic> json) =>
      _$PageMetaFromJson(json);

  Map<String, dynamic> toJson() => _$PageMetaToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
