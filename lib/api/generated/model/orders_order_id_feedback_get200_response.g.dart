// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_order_id_feedback_get200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrdersOrderIDFeedbackGet200Response
_$OrdersOrderIDFeedbackGet200ResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate('OrdersOrderIDFeedbackGet200Response', json, (
      $checkedConvert,
    ) {
      $checkKeys(json, requiredKeys: const ['data']);
      final val = OrdersOrderIDFeedbackGet200Response(
        data: $checkedConvert(
          'data',
          (v) => OrderFeedback.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$OrdersOrderIDFeedbackGet200ResponseToJson(
  OrdersOrderIDFeedbackGet200Response instance,
) => <String, dynamic>{'data': instance.data.toJson()};
