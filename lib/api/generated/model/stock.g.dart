// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Stock _$StockFromJson(Map<String, dynamic> json) =>
    $checkedCreate('Stock', json, ($checkedConvert) {
      $checkKeys(
        json,
        requiredKeys: const ['available', 'quantity', 'reserved', 'sold'],
      );
      final val = Stock(
        available: $checkedConvert('available', (v) => (v as num).toInt()),
        quantity: $checkedConvert('quantity', (v) => (v as num).toInt()),
        reserved: $checkedConvert('reserved', (v) => (v as num).toInt()),
        sold: $checkedConvert('sold', (v) => (v as num).toInt()),
      );
      return val;
    });

Map<String, dynamic> _$StockToJson(Stock instance) => <String, dynamic>{
  'available': instance.available,
  'quantity': instance.quantity,
  'reserved': instance.reserved,
  'sold': instance.sold,
};
