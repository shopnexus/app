//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/order_feedback.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'orders_order_id_feedback_get200_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class OrdersOrderIDFeedbackGet200Response {
  /// Returns a new [OrdersOrderIDFeedbackGet200Response] instance.
  OrdersOrderIDFeedbackGet200Response({

    required  this.data,
  });

  @JsonKey(
    
    name: r'data',
    required: true,
    includeIfNull: false,
  )


  final OrderFeedback data;





    @override
    bool operator ==(Object other) => identical(this, other) || other is OrdersOrderIDFeedbackGet200Response &&
      other.data == data;

    @override
    int get hashCode =>
        data.hashCode;

  factory OrdersOrderIDFeedbackGet200Response.fromJson(Map<String, dynamic> json) => _$OrdersOrderIDFeedbackGet200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OrdersOrderIDFeedbackGet200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

