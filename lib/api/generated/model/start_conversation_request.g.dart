// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'start_conversation_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StartConversationRequest _$StartConversationRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('StartConversationRequest', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['account_id']);
  final val = StartConversationRequest(
    accountId: $checkedConvert('account_id', (v) => v as String),
  );
  return val;
}, fieldKeyMap: const {'accountId': 'account_id'});

Map<String, dynamic> _$StartConversationRequestToJson(
  StartConversationRequest instance,
) => <String, dynamic>{'account_id': instance.accountId};
