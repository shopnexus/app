//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

/// Why the shelf is on the page.  `interest` is one of the account's four interest slots, shown apart instead of blended into `sort=recommended`; its subject is the category nearest that slot. `because-you-viewed` is the neighbourhood of the last listing the shopper opened. The rest are the marketplace's own orderings and are about nobody in particular.
enum ShelfReason {
  /// Why the shelf is on the page.  `interest` is one of the account's four interest slots, shown apart instead of blended into `sort=recommended`; its subject is the category nearest that slot. `because-you-viewed` is the neighbourhood of the last listing the shopper opened. The rest are the marketplace's own orderings and are about nobody in particular.
  @JsonValue(r'interest')
  interest(r'interest'),

  /// Why the shelf is on the page.  `interest` is one of the account's four interest slots, shown apart instead of blended into `sort=recommended`; its subject is the category nearest that slot. `because-you-viewed` is the neighbourhood of the last listing the shopper opened. The rest are the marketplace's own orderings and are about nobody in particular.
  @JsonValue(r'because-you-viewed')
  becauseYouViewed(r'because-you-viewed'),

  /// Why the shelf is on the page.  `interest` is one of the account's four interest slots, shown apart instead of blended into `sort=recommended`; its subject is the category nearest that slot. `because-you-viewed` is the neighbourhood of the last listing the shopper opened. The rest are the marketplace's own orderings and are about nobody in particular.
  @JsonValue(r'trending')
  trending(r'trending'),

  /// Why the shelf is on the page.  `interest` is one of the account's four interest slots, shown apart instead of blended into `sort=recommended`; its subject is the category nearest that slot. `because-you-viewed` is the neighbourhood of the last listing the shopper opened. The rest are the marketplace's own orderings and are about nobody in particular.
  @JsonValue(r'best-selling')
  bestSelling(r'best-selling'),

  /// Why the shelf is on the page.  `interest` is one of the account's four interest slots, shown apart instead of blended into `sort=recommended`; its subject is the category nearest that slot. `because-you-viewed` is the neighbourhood of the last listing the shopper opened. The rest are the marketplace's own orderings and are about nobody in particular.
  @JsonValue(r'top-rated')
  topRated(r'top-rated'),

  /// Why the shelf is on the page.  `interest` is one of the account's four interest slots, shown apart instead of blended into `sort=recommended`; its subject is the category nearest that slot. `because-you-viewed` is the neighbourhood of the last listing the shopper opened. The rest are the marketplace's own orderings and are about nobody in particular.
  @JsonValue(r'newest')
  newest(r'newest');

  const ShelfReason(this.value);

  final String value;

  @override
  String toString() => value;
}
