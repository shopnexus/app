// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionList _$TransactionListFromJson(Map<String, dynamic> json) =>
    $checkedCreate('TransactionList', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['data']);
      final val = TransactionList(
        data: $checkedConvert(
          'data',
          (v) => (v as List<dynamic>)
              .map((e) => Transaction.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$TransactionListToJson(TransactionList instance) =>
    <String, dynamic>{'data': instance.data.map((e) => e.toJson()).toList()};
