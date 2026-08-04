//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/transport.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'orders_id_transport_get200_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class OrdersIdTransportGet200Response {
  /// Returns a new [OrdersIdTransportGet200Response] instance.
  OrdersIdTransportGet200Response({

    required  this.data,
  });

  @JsonKey(
    
    name: r'data',
    required: true,
    includeIfNull: false,
  )


  final Transport data;





    @override
    bool operator ==(Object other) => identical(this, other) || other is OrdersIdTransportGet200Response &&
      other.data == data;

    @override
    int get hashCode =>
        data.hashCode;

  factory OrdersIdTransportGet200Response.fromJson(Map<String, dynamic> json) => _$OrdersIdTransportGet200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OrdersIdTransportGet200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

