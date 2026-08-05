//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_summary_day.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class OrderSummaryDay {
  /// Returns a new [OrderSummaryDay] instance.
  OrderSummaryDay({
    required this.completed,

    required this.date,

    required this.placed,
  });

  // minimum: 0
  @JsonKey(name: r'completed', required: true, includeIfNull: false)
  final int completed;

  /// A local date in the requested zone, not a timestamp — a bucket is a day, and a midnight instant would invite a reader to convert it into a different one.
  @JsonKey(name: r'date', required: true, includeIfNull: false)
  final String date;

  // minimum: 0
  @JsonKey(name: r'placed', required: true, includeIfNull: false)
  final int placed;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderSummaryDay &&
          other.completed == completed &&
          other.date == date &&
          other.placed == placed;

  @override
  int get hashCode => completed.hashCode + date.hashCode + placed.hashCode;

  factory OrderSummaryDay.fromJson(Map<String, dynamic> json) =>
      _$OrderSummaryDayFromJson(json);

  Map<String, dynamic> toJson() => _$OrderSummaryDayToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
