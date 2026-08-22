//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/listing_history_code.dart';
import 'package:shopnexus_flutter_app/api/generated/model/account_summary.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'listing_history_entry.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ListingHistoryEntry {
  /// Returns a new [ListingHistoryEntry] instance.
  ListingHistoryEntry({
    required this.actor,

    required this.actorKind,

    required this.changeType,

    required this.changedAt,

    required this.code,

    required this.details,

    required this.fields,

    required this.version,
  });

  /// The account responsible, and null when there is none to show — a `system` change, or a moderator's read by anyone but staff.
  @JsonKey(name: r'actor', required: true, includeIfNull: true)
  final AccountSummary? actor;

  /// Who was behind the change. `system` is one no account is responsible for — a scheduled job, a vendor callback. `staff` is a moderator, and stays just that word to a seller.
  @JsonKey(name: r'actor_kind', required: true, includeIfNull: false)
  final ListingHistoryEntryActorKindEnum actorKind;

  @JsonKey(name: r'change_type', required: true, includeIfNull: false)
  final ListingHistoryEntryChangeTypeEnum changeType;

  @JsonKey(name: r'changed_at', required: true, includeIfNull: false)
  final DateTime changedAt;

  @JsonKey(name: r'code', required: true, includeIfNull: false)
  final ListingHistoryCode code;

  /// The rest of what was recorded: the status it reached, the variant it was about, and — for staff only — the words a moderator wrote.
  @JsonKey(name: r'details', required: true, includeIfNull: false)
  final Map<String, Object> details;

  /// What an edit touched, in the listing's own field names. Empty for a fact that names none.
  @JsonKey(name: r'fields', required: true, includeIfNull: false)
  final List<String> fields;

  /// The trail's counter for this listing. 1 is its creation, and it never repeats.
  @JsonKey(name: r'version', required: true, includeIfNull: false)
  final int version;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ListingHistoryEntry &&
          other.actor == actor &&
          other.actorKind == actorKind &&
          other.changeType == changeType &&
          other.changedAt == changedAt &&
          other.code == code &&
          other.details == details &&
          other.fields == fields &&
          other.version == version;

  @override
  int get hashCode =>
      (actor == null ? 0 : actor.hashCode) +
      actorKind.hashCode +
      changeType.hashCode +
      changedAt.hashCode +
      code.hashCode +
      details.hashCode +
      fields.hashCode +
      version.hashCode;

  factory ListingHistoryEntry.fromJson(Map<String, dynamic> json) =>
      _$ListingHistoryEntryFromJson(json);

  Map<String, dynamic> toJson() => _$ListingHistoryEntryToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

/// Who was behind the change. `system` is one no account is responsible for — a scheduled job, a vendor callback. `staff` is a moderator, and stays just that word to a seller.
enum ListingHistoryEntryActorKindEnum {
  /// Who was behind the change. `system` is one no account is responsible for — a scheduled job, a vendor callback. `staff` is a moderator, and stays just that word to a seller.
  @JsonValue(r'seller')
  seller(r'seller'),

  /// Who was behind the change. `system` is one no account is responsible for — a scheduled job, a vendor callback. `staff` is a moderator, and stays just that word to a seller.
  @JsonValue(r'staff')
  staff(r'staff'),

  /// Who was behind the change. `system` is one no account is responsible for — a scheduled job, a vendor callback. `staff` is a moderator, and stays just that word to a seller.
  @JsonValue(r'system')
  system(r'system');

  const ListingHistoryEntryActorKindEnum(this.value);

  final String value;

  @override
  String toString() => value;
}

enum ListingHistoryEntryChangeTypeEnum {
  @JsonValue(r'insert')
  insert(r'insert'),
  @JsonValue(r'update')
  update(r'update'),
  @JsonValue(r'delete')
  delete(r'delete');

  const ListingHistoryEntryChangeTypeEnum(this.value);

  final String value;

  @override
  String toString() => value;
}
