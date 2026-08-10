// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'publish_listing_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PublishListingRequest _$PublishListingRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'PublishListingRequest',
  json,
  ($checkedConvert) {
    final val = PublishListingRequest(
      pickupContactId: $checkedConvert(
        'pickup_contact_id',
        (v) => v as String?,
      ),
    );
    return val;
  },
  fieldKeyMap: const {'pickupContactId': 'pickup_contact_id'},
);

Map<String, dynamic> _$PublishListingRequestToJson(
  PublishListingRequest instance,
) => <String, dynamic>{
  if (instance.pickupContactId case final value?) 'pickup_contact_id': value,
};
