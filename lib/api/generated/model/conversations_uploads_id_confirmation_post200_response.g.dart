// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversations_uploads_id_confirmation_post200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConversationsUploadsIdConfirmationPost200Response
_$ConversationsUploadsIdConfirmationPost200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ConversationsUploadsIdConfirmationPost200Response', json, (
  $checkedConvert,
) {
  $checkKeys(json, requiredKeys: const ['data']);
  final val = ConversationsUploadsIdConfirmationPost200Response(
    data: $checkedConvert(
      'data',
      (v) => Resource.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$ConversationsUploadsIdConfirmationPost200ResponseToJson(
  ConversationsUploadsIdConfirmationPost200Response instance,
) => <String, dynamic>{'data': instance.data.toJson()};
