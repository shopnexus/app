// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deleted_message_ref.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeletedMessageRef _$DeletedMessageRefFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'DeletedMessageRef',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['conversation_id', 'created_at', 'id'],
        );
        final val = DeletedMessageRef(
          conversationId: $checkedConvert(
            'conversation_id',
            (v) => v as String,
          ),
          createdAt: $checkedConvert(
            'created_at',
            (v) => DateTime.parse(v as String),
          ),
          id: $checkedConvert('id', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {
        'conversationId': 'conversation_id',
        'createdAt': 'created_at',
      },
    );

Map<String, dynamic> _$DeletedMessageRefToJson(DeletedMessageRef instance) =>
    <String, dynamic>{
      'conversation_id': instance.conversationId,
      'created_at': instance.createdAt.toIso8601String(),
      'id': instance.id,
    };
