//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/order.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'orders_id_get200_response.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class OrdersIdGet200Response {
  /// Returns a new [OrdersIdGet200Response] instance.
  OrdersIdGet200Response({required this.data});

  @JsonKey(name: r'data', required: true, includeIfNull: false)
  final Order data;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrdersIdGet200Response && other.data == data;

  @override
  int get hashCode => data.hashCode;

  factory OrdersIdGet200Response.fromJson(Map<String, dynamic> json) =>
      _$OrdersIdGet200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OrdersIdGet200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
