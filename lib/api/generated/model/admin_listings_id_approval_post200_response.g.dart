// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_listings_id_approval_post200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminListingsIdApprovalPost200Response
_$AdminListingsIdApprovalPost200ResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate('AdminListingsIdApprovalPost200Response', json, (
      $checkedConvert,
    ) {
      $checkKeys(json, requiredKeys: const ['data']);
      final val = AdminListingsIdApprovalPost200Response(
        data: $checkedConvert(
          'data',
          (v) => ListingDetail.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$AdminListingsIdApprovalPost200ResponseToJson(
  AdminListingsIdApprovalPost200Response instance,
) => <String, dynamic>{'data': instance.data.toJson()};
