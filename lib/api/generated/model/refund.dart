//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/resource.dart';
import 'package:shopnexus_flutter_app/api/generated/model/refund_status.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'refund.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Refund {
  /// Returns a new [Refund] instance.
  Refund({
    required this.attachments,

    required this.buyerId,

    required this.createdAt,

    this.deadlineAt,

    required this.id,

    required this.orderId,

    required this.reason,

    this.returnedAt,

    this.sellerDecidedAt,

    required this.status,
  });

  /// The buyer's evidence, topped up until the case closes.
  @JsonKey(name: r'attachments', required: true, includeIfNull: false)
  final List<Resource> attachments;

  @JsonKey(name: r'buyer_id', required: true, includeIfNull: false)
  final String buyerId;

  @JsonKey(name: r'created_at', required: true, includeIfNull: false)
  final DateTime createdAt;

  /// When the party named by `status` runs out of time, and missing it is itself a move. Null while the case waits on staff or a carrier, and in the terminal states.
  @JsonKey(name: r'deadline_at', required: false, includeIfNull: false)
  final DateTime? deadlineAt;

  @JsonKey(name: r'id', required: true, includeIfNull: false)
  final String id;

  @JsonKey(name: r'order_id', required: true, includeIfNull: false)
  final String orderId;

  @JsonKey(name: r'reason', required: true, includeIfNull: false)
  final String reason;

  /// When the return reached the seller and the inspection window opened.
  @JsonKey(name: r'returned_at', required: false, includeIfNull: false)
  final DateTime? returnedAt;

  /// When the seller answered — by granting the refund, or by handing it to staff. There is no rejection reason beside it: they cannot refuse one.
  @JsonKey(name: r'seller_decided_at', required: false, includeIfNull: false)
  final DateTime? sellerDecidedAt;

  @JsonKey(name: r'status', required: true, includeIfNull: false)
  final RefundStatus status;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Refund &&
          other.attachments == attachments &&
          other.buyerId == buyerId &&
          other.createdAt == createdAt &&
          other.deadlineAt == deadlineAt &&
          other.id == id &&
          other.orderId == orderId &&
          other.reason == reason &&
          other.returnedAt == returnedAt &&
          other.sellerDecidedAt == sellerDecidedAt &&
          other.status == status;

  @override
  int get hashCode =>
      attachments.hashCode +
      buyerId.hashCode +
      createdAt.hashCode +
      (deadlineAt == null ? 0 : deadlineAt.hashCode) +
      id.hashCode +
      orderId.hashCode +
      reason.hashCode +
      (returnedAt == null ? 0 : returnedAt.hashCode) +
      (sellerDecidedAt == null ? 0 : sellerDecidedAt.hashCode) +
      status.hashCode;

  factory Refund.fromJson(Map<String, dynamic> json) => _$RefundFromJson(json);

  Map<String, dynamic> toJson() => _$RefundToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
