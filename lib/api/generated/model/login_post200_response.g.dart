// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_post200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginPost200Response _$LoginPost200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('LoginPost200Response', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['data']);
  final val = LoginPost200Response(
    data: $checkedConvert(
      'data',
      (v) => AuthResult.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$LoginPost200ResponseToJson(
  LoginPost200Response instance,
) => <String, dynamic>{'data': instance.data.toJson()};
