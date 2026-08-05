//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/money_by_currency.dart';
import 'package:shopnexus_flutter_app/api/generated/model/order_summary_day.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_summary.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class OrderSummary {
  /// Returns a new [OrderSummary] instance.
  OrderSummary({
    required this.cancelled,

    required this.completed,

    required this.daily,

    required this.from,

    required this.open,

    required this.to,

    required this.totals,
  });

  // minimum: 0
  @JsonKey(name: r'cancelled', required: true, includeIfNull: false)
  final int cancelled;

  // minimum: 0
  @JsonKey(name: r'completed', required: true, includeIfNull: false)
  final int completed;

  /// Only the days that had an order; a client fills the gaps it wants to draw.
  @JsonKey(name: r'daily', required: true, includeIfNull: false)
  final List<OrderSummaryDay> daily;

  @JsonKey(name: r'from', required: true, includeIfNull: false)
  final DateTime from;

  // minimum: 0
  @JsonKey(name: r'open', required: true, includeIfNull: false)
  final int open;

  /// Exclusive.
  @JsonKey(name: r'to', required: true, includeIfNull: false)
  final DateTime to;

  /// Empty for a window with no completed order. One entry per currency sold in.
  @JsonKey(name: r'totals', required: true, includeIfNull: false)
  final List<MoneyByCurrency> totals;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderSummary &&
          other.cancelled == cancelled &&
          other.completed == completed &&
          other.daily == daily &&
          other.from == from &&
          other.open == open &&
          other.to == to &&
          other.totals == totals;

  @override
  int get hashCode =>
      cancelled.hashCode +
      completed.hashCode +
      daily.hashCode +
      from.hashCode +
      open.hashCode +
      to.hashCode +
      totals.hashCode;

  factory OrderSummary.fromJson(Map<String, dynamic> json) =>
      _$OrderSummaryFromJson(json);

  Map<String, dynamic> toJson() => _$OrderSummaryToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
