// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drafts_post201_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DraftsPost201Response _$DraftsPost201ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('DraftsPost201Response', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['data']);
  final val = DraftsPost201Response(
    data: $checkedConvert(
      'data',
      (v) => DraftOrder.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$DraftsPost201ResponseToJson(
  DraftsPost201Response instance,
) => <String, dynamic>{'data': instance.data.toJson()};
