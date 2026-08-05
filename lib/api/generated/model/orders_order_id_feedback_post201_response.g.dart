// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_order_id_feedback_post201_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrdersOrderIDFeedbackPost201Response
_$OrdersOrderIDFeedbackPost201ResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate('OrdersOrderIDFeedbackPost201Response', json, (
      $checkedConvert,
    ) {
      $checkKeys(json, requiredKeys: const ['data']);
      final val = OrdersOrderIDFeedbackPost201Response(
        data: $checkedConvert(
          'data',
          (v) => Feedback.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$OrdersOrderIDFeedbackPost201ResponseToJson(
  OrdersOrderIDFeedbackPost201Response instance,
) => <String, dynamic>{'data': instance.data.toJson()};
