// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer_listing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OfferListing _$OfferListingFromJson(Map<String, dynamic> json) =>
    $checkedCreate('OfferListing', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['cover', 'name']);
      final val = OfferListing(
        cover: $checkedConvert(
          'cover',
          (v) =>
              v == null ? null : Resource.fromJson(v as Map<String, dynamic>),
        ),
        name: $checkedConvert('name', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$OfferListingToJson(OfferListing instance) =>
    <String, dynamic>{'cover': instance.cover?.toJson(), 'name': instance.name};
