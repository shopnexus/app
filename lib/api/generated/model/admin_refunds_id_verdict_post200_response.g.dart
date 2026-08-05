// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_refunds_id_verdict_post200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminRefundsIdVerdictPost200Response
_$AdminRefundsIdVerdictPost200ResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate('AdminRefundsIdVerdictPost200Response', json, (
      $checkedConvert,
    ) {
      $checkKeys(json, requiredKeys: const ['data']);
      final val = AdminRefundsIdVerdictPost200Response(
        data: $checkedConvert(
          'data',
          (v) => Refund.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$AdminRefundsIdVerdictPost200ResponseToJson(
  AdminRefundsIdVerdictPost200Response instance,
) => <String, dynamic>{'data': instance.data.toJson()};
