//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/page_meta.dart';
import 'package:shopnexus_flutter_app/api/generated/model/listing_history_entry.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'listing_history_page.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ListingHistoryPage {
  /// Returns a new [ListingHistoryPage] instance.
  ListingHistoryPage({required this.data, required this.meta});

  @JsonKey(name: r'data', required: true, includeIfNull: false)
  final List<ListingHistoryEntry> data;

  @JsonKey(name: r'meta', required: true, includeIfNull: false)
  final PageMeta meta;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ListingHistoryPage && other.data == data && other.meta == meta;

  @override
  int get hashCode => data.hashCode + meta.hashCode;

  factory ListingHistoryPage.fromJson(Map<String, dynamic> json) =>
      _$ListingHistoryPageFromJson(json);

  Map<String, dynamic> toJson() => _$ListingHistoryPageToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
