//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

/// Item condition. This is a marketplace for used goods so it is listing-level and not optional.
enum ListingCondition {
          /// Item condition. This is a marketplace for used goods so it is listing-level and not optional.
      @JsonValue(r'new')
      new_(r'new'),
          /// Item condition. This is a marketplace for used goods so it is listing-level and not optional.
      @JsonValue(r'used')
      used(r'used'),
          /// Item condition. This is a marketplace for used goods so it is listing-level and not optional.
      @JsonValue(r'damaged')
      damaged(r'damaged');

  const ListingCondition(this.value);

  final String value;

  @override
  String toString() => value;
}
