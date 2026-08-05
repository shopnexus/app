//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/order_summary.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'orders_summary_get200_response.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class OrdersSummaryGet200Response {
  /// Returns a new [OrdersSummaryGet200Response] instance.
  OrdersSummaryGet200Response({required this.data});

  @JsonKey(name: r'data', required: true, includeIfNull: false)
  final OrderSummary data;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrdersSummaryGet200Response && other.data == data;

  @override
  int get hashCode => data.hashCode;

  factory OrdersSummaryGet200Response.fromJson(Map<String, dynamic> json) =>
      _$OrdersSummaryGet200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OrdersSummaryGet200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
