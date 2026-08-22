//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_history_entry.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class OrderHistoryEntry {
  /// Returns a new [OrderHistoryEntry] instance.
  OrderHistoryEntry({
    required this.actorKind,

    required this.changedAt,

    required this.code,

    required this.evidence,

    required this.reason,

    required this.shipmentStatus,

    required this.version,
  });

  /// Which side was behind it, derived from the fact rather than stored — only a seller confirms, only a carrier moves a parcel.
  @JsonKey(name: r'actor_kind', required: true, includeIfNull: false)
  final OrderHistoryEntryActorKindEnum actorKind;

  @JsonKey(name: r'changed_at', required: true, includeIfNull: false)
  final DateTime changedAt;

  /// Which fact this is. One of `order.placed`, `order.confirmed`, `order.declined`, `order.confirmation_escalated`, `order.shipment_advanced`, `order.received`, `order.cancelled`, `order.completed`, `order.payout_released`.
  @JsonKey(name: r'code', required: true, includeIfNull: false)
  final String code;

  /// How many photos were filed with a receipt. Zero otherwise.
  // minimum: 0
  @JsonKey(name: r'evidence', required: true, includeIfNull: false)
  final int evidence;

  /// The seller's own words on a refusal. Empty for every other fact.
  @JsonKey(name: r'reason', required: true, includeIfNull: false)
  final String reason;

  /// Where the parcel got to. Empty unless this entry is a shipment move.
  @JsonKey(name: r'shipment_status', required: true, includeIfNull: false)
  final String shipmentStatus;

  /// The trail's own counter for this order, so it is also the entry's key.
  // minimum: 1
  @JsonKey(name: r'version', required: true, includeIfNull: false)
  final int version;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderHistoryEntry &&
          other.actorKind == actorKind &&
          other.changedAt == changedAt &&
          other.code == code &&
          other.evidence == evidence &&
          other.reason == reason &&
          other.shipmentStatus == shipmentStatus &&
          other.version == version;

  @override
  int get hashCode =>
      actorKind.hashCode +
      changedAt.hashCode +
      code.hashCode +
      evidence.hashCode +
      reason.hashCode +
      shipmentStatus.hashCode +
      version.hashCode;

  factory OrderHistoryEntry.fromJson(Map<String, dynamic> json) =>
      _$OrderHistoryEntryFromJson(json);

  Map<String, dynamic> toJson() => _$OrderHistoryEntryToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

/// Which side was behind it, derived from the fact rather than stored — only a seller confirms, only a carrier moves a parcel.
enum OrderHistoryEntryActorKindEnum {
  /// Which side was behind it, derived from the fact rather than stored — only a seller confirms, only a carrier moves a parcel.
  @JsonValue(r'buyer')
  buyer(r'buyer'),

  /// Which side was behind it, derived from the fact rather than stored — only a seller confirms, only a carrier moves a parcel.
  @JsonValue(r'seller')
  seller(r'seller'),

  /// Which side was behind it, derived from the fact rather than stored — only a seller confirms, only a carrier moves a parcel.
  @JsonValue(r'carrier')
  carrier(r'carrier'),

  /// Which side was behind it, derived from the fact rather than stored — only a seller confirms, only a carrier moves a parcel.
  @JsonValue(r'system')
  system(r'system');

  const OrderHistoryEntryActorKindEnum(this.value);

  final String value;

  @override
  String toString() => value;
}
