// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WalletList _$WalletListFromJson(Map<String, dynamic> json) =>
    $checkedCreate('WalletList', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['data']);
      final val = WalletList(
        data: $checkedConvert(
          'data',
          (v) => (v as List<dynamic>)
              .map((e) => Wallet.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$WalletListToJson(WalletList instance) =>
    <String, dynamic>{'data': instance.data.map((e) => e.toJson()).toList()};
