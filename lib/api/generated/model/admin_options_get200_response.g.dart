// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_options_get200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminOptionsGet200Response _$AdminOptionsGet200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('AdminOptionsGet200Response', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['data']);
  final val = AdminOptionsGet200Response(
    data: $checkedConvert(
      'data',
      (v) => OptionList.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$AdminOptionsGet200ResponseToJson(
  AdminOptionsGet200Response instance,
) => <String, dynamic>{'data': instance.data.toJson()};
