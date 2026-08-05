// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contacts_post201_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactsPost201Response _$ContactsPost201ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ContactsPost201Response', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['data']);
  final val = ContactsPost201Response(
    data: $checkedConvert(
      'data',
      (v) => Contact.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$ContactsPost201ResponseToJson(
  ContactsPost201Response instance,
) => <String, dynamic>{'data': instance.data.toJson()};
