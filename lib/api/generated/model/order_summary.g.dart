// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderSummary _$OrderSummaryFromJson(Map<String, dynamic> json) =>
    $checkedCreate('OrderSummary', json, ($checkedConvert) {
      $checkKeys(
        json,
        requiredKeys: const [
          'cancelled',
          'completed',
          'daily',
          'from',
          'open',
          'to',
          'totals',
        ],
      );
      final val = OrderSummary(
        cancelled: $checkedConvert('cancelled', (v) => (v as num).toInt()),
        completed: $checkedConvert('completed', (v) => (v as num).toInt()),
        daily: $checkedConvert(
          'daily',
          (v) => (v as List<dynamic>)
              .map((e) => OrderSummaryDay.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        from: $checkedConvert('from', (v) => DateTime.parse(v as String)),
        open: $checkedConvert('open', (v) => (v as num).toInt()),
        to: $checkedConvert('to', (v) => DateTime.parse(v as String)),
        totals: $checkedConvert(
          'totals',
          (v) => (v as List<dynamic>)
              .map((e) => MoneyByCurrency.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$OrderSummaryToJson(OrderSummary instance) =>
    <String, dynamic>{
      'cancelled': instance.cancelled,
      'completed': instance.completed,
      'daily': instance.daily.map((e) => e.toJson()).toList(),
      'from': instance.from.toIso8601String(),
      'open': instance.open,
      'to': instance.to.toIso8601String(),
      'totals': instance.totals.map((e) => e.toJson()).toList(),
    };
