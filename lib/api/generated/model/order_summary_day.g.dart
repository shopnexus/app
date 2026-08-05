// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_summary_day.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderSummaryDay _$OrderSummaryDayFromJson(Map<String, dynamic> json) =>
    $checkedCreate('OrderSummaryDay', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['completed', 'date', 'placed']);
      final val = OrderSummaryDay(
        completed: $checkedConvert('completed', (v) => (v as num).toInt()),
        date: $checkedConvert('date', (v) => v as String),
        placed: $checkedConvert('placed', (v) => (v as num).toInt()),
      );
      return val;
    });

Map<String, dynamic> _$OrderSummaryDayToJson(OrderSummaryDay instance) =>
    <String, dynamic>{
      'completed': instance.completed,
      'date': instance.date,
      'placed': instance.placed,
    };
