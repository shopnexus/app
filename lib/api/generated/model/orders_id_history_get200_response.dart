//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/order_history_entry.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'orders_id_history_get200_response.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class OrdersIdHistoryGet200Response {
  /// Returns a new [OrdersIdHistoryGet200Response] instance.
  OrdersIdHistoryGet200Response({required this.data});

  @JsonKey(name: r'data', required: true, includeIfNull: false)
  final List<OrderHistoryEntry> data;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrdersIdHistoryGet200Response && other.data == data;

  @override
  int get hashCode => data.hashCode;

  factory OrdersIdHistoryGet200Response.fromJson(Map<String, dynamic> json) =>
      _$OrdersIdHistoryGet200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OrdersIdHistoryGet200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
