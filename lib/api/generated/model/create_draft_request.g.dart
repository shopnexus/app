// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_draft_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateDraftRequest _$CreateDraftRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('CreateDraftRequest', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['listing_id']);
      final val = CreateDraftRequest(
        listingId: $checkedConvert('listing_id', (v) => v as String),
      );
      return val;
    }, fieldKeyMap: const {'listingId': 'listing_id'});

Map<String, dynamic> _$CreateDraftRequestToJson(CreateDraftRequest instance) =>
    <String, dynamic>{'listing_id': instance.listingId};
