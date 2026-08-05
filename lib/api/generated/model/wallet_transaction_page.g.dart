// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_transaction_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WalletTransactionPage _$WalletTransactionPageFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('WalletTransactionPage', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['data', 'meta']);
  final val = WalletTransactionPage(
    data: $checkedConvert(
      'data',
      (v) => (v as List<dynamic>)
          .map((e) => WalletTransaction.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
    meta: $checkedConvert(
      'meta',
      (v) => PageMeta.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$WalletTransactionPageToJson(
  WalletTransactionPage instance,
) => <String, dynamic>{
  'data': instance.data.map((e) => e.toJson()).toList(),
  'meta': instance.meta.toJson(),
};
