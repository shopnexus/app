// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_history_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderHistoryEntry _$OrderHistoryEntryFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'OrderHistoryEntry',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'actor_kind',
            'changed_at',
            'code',
            'evidence',
            'reason',
            'shipment_status',
            'version',
          ],
        );
        final val = OrderHistoryEntry(
          actorKind: $checkedConvert(
            'actor_kind',
            (v) => $enumDecode(_$OrderHistoryEntryActorKindEnumEnumMap, v),
          ),
          changedAt: $checkedConvert(
            'changed_at',
            (v) => DateTime.parse(v as String),
          ),
          code: $checkedConvert('code', (v) => v as String),
          evidence: $checkedConvert('evidence', (v) => (v as num).toInt()),
          reason: $checkedConvert('reason', (v) => v as String),
          shipmentStatus: $checkedConvert(
            'shipment_status',
            (v) => v as String,
          ),
          version: $checkedConvert('version', (v) => (v as num).toInt()),
        );
        return val;
      },
      fieldKeyMap: const {
        'actorKind': 'actor_kind',
        'changedAt': 'changed_at',
        'shipmentStatus': 'shipment_status',
      },
    );

Map<String, dynamic> _$OrderHistoryEntryToJson(
  OrderHistoryEntry instance,
) => <String, dynamic>{
  'actor_kind': _$OrderHistoryEntryActorKindEnumEnumMap[instance.actorKind]!,
  'changed_at': instance.changedAt.toIso8601String(),
  'code': instance.code,
  'evidence': instance.evidence,
  'reason': instance.reason,
  'shipment_status': instance.shipmentStatus,
  'version': instance.version,
};

const _$OrderHistoryEntryActorKindEnumEnumMap = {
  OrderHistoryEntryActorKindEnum.buyer: 'buyer',
  OrderHistoryEntryActorKindEnum.seller: 'seller',
  OrderHistoryEntryActorKindEnum.carrier: 'carrier',
  OrderHistoryEntryActorKindEnum.system: 'system',
};
