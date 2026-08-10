// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logout_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogoutRequest _$LogoutRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('LogoutRequest', json, ($checkedConvert) {
      final val = LogoutRequest(
        deviceId: $checkedConvert('device_id', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {'deviceId': 'device_id'});

Map<String, dynamic> _$LogoutRequestToJson(LogoutRequest instance) =>
    <String, dynamic>{
      if (instance.deviceId case final value?) 'device_id': value,
    };
