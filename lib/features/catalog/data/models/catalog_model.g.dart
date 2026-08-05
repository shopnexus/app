// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RecentListing _$RecentListingFromJson(Map<String, dynamic> json) =>
    _RecentListing(
      id: json['id'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toInt(),
      coverUrl: json['cover_url'] as String?,
      sellerName: json['seller_name'] as String?,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      negotiable: json['negotiable'] as bool? ?? false,
    );

Map<String, dynamic> _$RecentListingToJson(_RecentListing instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'cover_url': instance.coverUrl,
      'seller_name': instance.sellerName,
      'rating': instance.rating,
      'negotiable': instance.negotiable,
    };
