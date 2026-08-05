// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_options_id_patch200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminOptionsIdPatch200Response _$AdminOptionsIdPatch200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('AdminOptionsIdPatch200Response', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['data']);
  final val = AdminOptionsIdPatch200Response(
    data: $checkedConvert(
      'data',
      (v) => Option.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$AdminOptionsIdPatch200ResponseToJson(
  AdminOptionsIdPatch200Response instance,
) => <String, dynamic>{'data': instance.data.toJson()};
