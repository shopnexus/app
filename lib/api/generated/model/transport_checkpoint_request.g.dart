// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transport_checkpoint_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransportCheckpointRequest _$TransportCheckpointRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('TransportCheckpointRequest', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['status']);
  final val = TransportCheckpointRequest(
    status: $checkedConvert(
      'status',
      (v) => $enumDecode(_$TransportCheckpointEnumMap, v),
    ),
  );
  return val;
});

Map<String, dynamic> _$TransportCheckpointRequestToJson(
  TransportCheckpointRequest instance,
) => <String, dynamic>{
  'status': _$TransportCheckpointEnumMap[instance.status]!,
};

const _$TransportCheckpointEnumMap = {
  TransportCheckpoint.pickedUp: 'picked-up',
  TransportCheckpoint.inTransit: 'in-transit',
  TransportCheckpoint.delivered: 'delivered',
  TransportCheckpoint.returned: 'returned',
  TransportCheckpoint.failed: 'failed',
};
