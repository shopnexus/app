// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suggest_listing_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuggestListingRequest _$SuggestListingRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'SuggestListingRequest',
  json,
  ($checkedConvert) {
    final val = SuggestListingRequest(
      attachments: $checkedConvert(
        'attachments',
        (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
      ),
      language: $checkedConvert('language', (v) => v as String?),
      note: $checkedConvert('note', (v) => v as String?),
      voiceNote: $checkedConvert('voice_note', (v) => v as String?),
      voiceNoteMime: $checkedConvert('voice_note_mime', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'voiceNote': 'voice_note',
    'voiceNoteMime': 'voice_note_mime',
  },
);

Map<String, dynamic> _$SuggestListingRequestToJson(
  SuggestListingRequest instance,
) => <String, dynamic>{
  'attachments': ?instance.attachments,
  'language': ?instance.language,
  'note': ?instance.note,
  'voice_note': ?instance.voiceNote,
  'voice_note_mime': ?instance.voiceNoteMime,
};
