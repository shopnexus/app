//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/shelf_reason.dart';
import 'package:shopnexus_flutter_app/api/generated/model/listing.dart';
import 'package:shopnexus_flutter_app/api/generated/model/shelf_subject.dart';
import 'package:shopnexus_flutter_app/api/generated/model/shelf_browse.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'shelf.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Shelf {
  /// Returns a new [Shelf] instance.
  Shelf({
    required this.browse,

    required this.key,

    required this.listings,

    required this.reason,

    required this.subject,
  });

  @JsonKey(name: r'browse', required: true, includeIfNull: false)
  final ShelfBrowse browse;

  /// Unique within the response. A reason can occur more than once — four interest slots — so a client needs one stable handle per row rather than per reason.
  @JsonKey(name: r'key', required: true, includeIfNull: false)
  final String key;

  /// At least three, or the shelf is not returned at all.
  @JsonKey(name: r'listings', required: true, includeIfNull: false)
  final List<Listing> listings;

  @JsonKey(name: r'reason', required: true, includeIfNull: false)
  final ShelfReason reason;

  @JsonKey(name: r'subject', required: true, includeIfNull: true)
  final ShelfSubject? subject;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Shelf &&
          other.browse == browse &&
          other.key == key &&
          other.listings == listings &&
          other.reason == reason &&
          other.subject == subject;

  @override
  int get hashCode =>
      browse.hashCode +
      key.hashCode +
      listings.hashCode +
      reason.hashCode +
      (subject == null ? 0 : subject.hashCode);

  factory Shelf.fromJson(Map<String, dynamic> json) => _$ShelfFromJson(json);

  Map<String, dynamic> toJson() => _$ShelfToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
