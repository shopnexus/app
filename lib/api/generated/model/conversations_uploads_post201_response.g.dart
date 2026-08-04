// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversations_uploads_post201_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConversationsUploadsPost201Response
_$ConversationsUploadsPost201ResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ConversationsUploadsPost201Response', json, (
      $checkedConvert,
    ) {
      $checkKeys(json, requiredKeys: const ['data']);
      final val = ConversationsUploadsPost201Response(
        data: $checkedConvert(
          'data',
          (v) => UploadSlot.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$ConversationsUploadsPost201ResponseToJson(
  ConversationsUploadsPost201Response instance,
) => <String, dynamic>{'data': instance.data.toJson()};
