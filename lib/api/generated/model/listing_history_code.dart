//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

/// The business fact recorded. Stored values, so they are the vocabulary the trail was written in rather than one chosen for the wire — which is also why they are `snake_case` after the dot while every other enum here is kebab: the family predates that rule and rewriting a code would rewrite how existing history reads.  `listing.edit` and `listing.edit_submitted` are the same change under different circumstances: the first was written straight through, the second was held for a moderator because buyers were already looking at the listing.
enum ListingHistoryCode {
  /// The business fact recorded. Stored values, so they are the vocabulary the trail was written in rather than one chosen for the wire — which is also why they are `snake_case` after the dot while every other enum here is kebab: the family predates that rule and rewriting a code would rewrite how existing history reads.  `listing.edit` and `listing.edit_submitted` are the same change under different circumstances: the first was written straight through, the second was held for a moderator because buyers were already looking at the listing.
  @JsonValue(r'listing.create')
  listingPeriodCreate(r'listing.create'),

  /// The business fact recorded. Stored values, so they are the vocabulary the trail was written in rather than one chosen for the wire — which is also why they are `snake_case` after the dot while every other enum here is kebab: the family predates that rule and rewriting a code would rewrite how existing history reads.  `listing.edit` and `listing.edit_submitted` are the same change under different circumstances: the first was written straight through, the second was held for a moderator because buyers were already looking at the listing.
  @JsonValue(r'listing.edit')
  listingPeriodEdit(r'listing.edit'),

  /// The business fact recorded. Stored values, so they are the vocabulary the trail was written in rather than one chosen for the wire — which is also why they are `snake_case` after the dot while every other enum here is kebab: the family predates that rule and rewriting a code would rewrite how existing history reads.  `listing.edit` and `listing.edit_submitted` are the same change under different circumstances: the first was written straight through, the second was held for a moderator because buyers were already looking at the listing.
  @JsonValue(r'listing.edit_submitted')
  listingPeriodEditSubmitted(r'listing.edit_submitted'),

  /// The business fact recorded. Stored values, so they are the vocabulary the trail was written in rather than one chosen for the wire — which is also why they are `snake_case` after the dot while every other enum here is kebab: the family predates that rule and rewriting a code would rewrite how existing history reads.  `listing.edit` and `listing.edit_submitted` are the same change under different circumstances: the first was written straight through, the second was held for a moderator because buyers were already looking at the listing.
  @JsonValue(r'listing.publish')
  listingPeriodPublish(r'listing.publish'),

  /// The business fact recorded. Stored values, so they are the vocabulary the trail was written in rather than one chosen for the wire — which is also why they are `snake_case` after the dot while every other enum here is kebab: the family predates that rule and rewriting a code would rewrite how existing history reads.  `listing.edit` and `listing.edit_submitted` are the same change under different circumstances: the first was written straight through, the second was held for a moderator because buyers were already looking at the listing.
  @JsonValue(r'listing.approve')
  listingPeriodApprove(r'listing.approve'),

  /// The business fact recorded. Stored values, so they are the vocabulary the trail was written in rather than one chosen for the wire — which is also why they are `snake_case` after the dot while every other enum here is kebab: the family predates that rule and rewriting a code would rewrite how existing history reads.  `listing.edit` and `listing.edit_submitted` are the same change under different circumstances: the first was written straight through, the second was held for a moderator because buyers were already looking at the listing.
  @JsonValue(r'listing.takedown')
  listingPeriodTakedown(r'listing.takedown'),

  /// The business fact recorded. Stored values, so they are the vocabulary the trail was written in rather than one chosen for the wire — which is also why they are `snake_case` after the dot while every other enum here is kebab: the family predates that rule and rewriting a code would rewrite how existing history reads.  `listing.edit` and `listing.edit_submitted` are the same change under different circumstances: the first was written straight through, the second was held for a moderator because buyers were already looking at the listing.
  @JsonValue(r'listing.hide')
  listingPeriodHide(r'listing.hide'),

  /// The business fact recorded. Stored values, so they are the vocabulary the trail was written in rather than one chosen for the wire — which is also why they are `snake_case` after the dot while every other enum here is kebab: the family predates that rule and rewriting a code would rewrite how existing history reads.  `listing.edit` and `listing.edit_submitted` are the same change under different circumstances: the first was written straight through, the second was held for a moderator because buyers were already looking at the listing.
  @JsonValue(r'listing.variant_added')
  listingPeriodVariantAdded(r'listing.variant_added'),

  /// The business fact recorded. Stored values, so they are the vocabulary the trail was written in rather than one chosen for the wire — which is also why they are `snake_case` after the dot while every other enum here is kebab: the family predates that rule and rewriting a code would rewrite how existing history reads.  `listing.edit` and `listing.edit_submitted` are the same change under different circumstances: the first was written straight through, the second was held for a moderator because buyers were already looking at the listing.
  @JsonValue(r'listing.variant_edited')
  listingPeriodVariantEdited(r'listing.variant_edited'),

  /// The business fact recorded. Stored values, so they are the vocabulary the trail was written in rather than one chosen for the wire — which is also why they are `snake_case` after the dot while every other enum here is kebab: the family predates that rule and rewriting a code would rewrite how existing history reads.  `listing.edit` and `listing.edit_submitted` are the same change under different circumstances: the first was written straight through, the second was held for a moderator because buyers were already looking at the listing.
  @JsonValue(r'listing.variant_removed')
  listingPeriodVariantRemoved(r'listing.variant_removed'),

  /// The business fact recorded. Stored values, so they are the vocabulary the trail was written in rather than one chosen for the wire — which is also why they are `snake_case` after the dot while every other enum here is kebab: the family predates that rule and rewriting a code would rewrite how existing history reads.  `listing.edit` and `listing.edit_submitted` are the same change under different circumstances: the first was written straight through, the second was held for a moderator because buyers were already looking at the listing.
  @JsonValue(r'listing.delete')
  listingPeriodDelete(r'listing.delete');

  const ListingHistoryCode(this.value);

  final String value;

  @override
  String toString() => value;
}
