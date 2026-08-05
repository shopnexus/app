// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transport.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transport _$TransportFromJson(Map<String, dynamic> json) =>
    $checkedCreate('Transport', json, ($checkedConvert) {
      $checkKeys(
        json,
        requiredKeys: const ['created_at', 'fee', 'id', 'option', 'status'],
      );
      final val = Transport(
        createdAt: $checkedConvert(
          'created_at',
          (v) => DateTime.parse(v as String),
        ),
        fee: $checkedConvert('fee', (v) => (v as num).toInt()),
        id: $checkedConvert('id', (v) => v as String),
        option: $checkedConvert('option', (v) => v as String),
        status: $checkedConvert(
          'status',
          (v) => $enumDecode(_$TransportStatusEnumMap, v),
        ),
      );
      return val;
    }, fieldKeyMap: const {'createdAt': 'created_at'});

Map<String, dynamic> _$TransportToJson(Transport instance) => <String, dynamic>{
  'created_at': instance.createdAt.toIso8601String(),
  'fee': instance.fee,
  'id': instance.id,
  'option': instance.option,
  'status': _$TransportStatusEnumMap[instance.status]!,
};

const _$TransportStatusEnumMap = {
  TransportStatus.pending: 'pending',
  TransportStatus.pickedUp: 'picked-up',
  TransportStatus.inTransit: 'in-transit',
  TransportStatus.delivered: 'delivered',
  TransportStatus.returned: 'returned',
  TransportStatus.failed: 'failed',
  TransportStatus.cancelled: 'cancelled',
};
