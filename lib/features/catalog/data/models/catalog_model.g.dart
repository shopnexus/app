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

_ListingSeller _$ListingSellerFromJson(Map<String, dynamic> json) =>
    _ListingSeller(
      id: json['id'] as String,
      name: json['name'] as String,
      avatar: json['avatar'] == null
          ? null
          : Resource.fromJson(json['avatar'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ListingSellerToJson(_ListingSeller instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'avatar': instance.avatar,
    };

_TProductCard _$TProductCardFromJson(Map<String, dynamic> json) =>
    _TProductCard(
      id: json['id'] as String,
      name: json['name'] as String,
      slug: json['slug'] as String? ?? '',
      price: (json['price'] as num?)?.toInt() ?? 0,
      priceMode: json['price_mode'] as String?,
      currency: json['currency'] as String?,
      categoryId: json['category_id'] as String?,
      condition: json['condition'] as String?,
      cover: json['cover'] == null
          ? null
          : Resource.fromJson(json['cover'] as Map<String, dynamic>),
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      reviewCount: (json['review_count'] as num?)?.toInt() ?? 0,
      sold: (json['sold'] as num?)?.toInt() ?? 0,
      status: json['status'] as String?,
      favorited: json['favorited'] as bool? ?? false,
      seller: json['seller'] == null
          ? null
          : ListingSeller.fromJson(json['seller'] as Map<String, dynamic>),
      location: json['location'] == null
          ? null
          : ListingLocation.fromJson(json['location'] as Map<String, dynamic>),
      createdAt: json['created_at'] as String?,
      deletedAt: json['deleted_at'] as String?,
      score: (json['score'] as num?)?.toDouble(),
      thumbnail: json['thumbnail'] as String?,
      originalPrice: (json['original_price'] as num?)?.toInt(),
      discountRate: (json['discount_rate'] as num?)?.toDouble(),
      soldCount: (json['sold_count'] as num?)?.toInt(),
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      vendorId: json['vendor_id'] as String?,
      vendorName: json['vendor_name'] as String?,
      isNegotiable: json['is_negotiable'] as bool? ?? false,
    );

Map<String, dynamic> _$TProductCardToJson(_TProductCard instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'price': instance.price,
      'price_mode': instance.priceMode,
      'currency': instance.currency,
      'category_id': instance.categoryId,
      'condition': instance.condition,
      'cover': instance.cover,
      'rating': instance.rating,
      'review_count': instance.reviewCount,
      'sold': instance.sold,
      'status': instance.status,
      'favorited': instance.favorited,
      'seller': instance.seller,
      'location': instance.location,
      'created_at': instance.createdAt,
      'deleted_at': instance.deletedAt,
      'score': instance.score,
      'thumbnail': instance.thumbnail,
      'original_price': instance.originalPrice,
      'discount_rate': instance.discountRate,
      'sold_count': instance.soldCount,
      'tags': instance.tags,
      'vendor_id': instance.vendorId,
      'vendor_name': instance.vendorName,
      'is_negotiable': instance.isNegotiable,
    };

_ProductSpecification _$ProductSpecificationFromJson(
  Map<String, dynamic> json,
) => _ProductSpecification(
  key: json['name'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$ProductSpecificationToJson(
  _ProductSpecification instance,
) => <String, dynamic>{'name': instance.key, 'value': instance.value};

_SkuAttribute _$SkuAttributeFromJson(Map<String, dynamic> json) =>
    _SkuAttribute(key: json['name'] as String, value: json['value'] as String);

Map<String, dynamic> _$SkuAttributeToJson(_SkuAttribute instance) =>
    <String, dynamic>{'name': instance.key, 'value': instance.value};

_VariantStock _$VariantStockFromJson(Map<String, dynamic> json) =>
    _VariantStock(
      available: (json['available'] as num?)?.toInt() ?? 0,
      quantity: (json['quantity'] as num?)?.toInt() ?? 0,
      reserved: (json['reserved'] as num?)?.toInt() ?? 0,
      sold: (json['sold'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$VariantStockToJson(_VariantStock instance) =>
    <String, dynamic>{
      'available': instance.available,
      'quantity': instance.quantity,
      'reserved': instance.reserved,
      'sold': instance.sold,
    };

_ProductSku _$ProductSkuFromJson(Map<String, dynamic> json) => _ProductSku(
  id: json['id'] as String,
  spuId: json['spu_id'] as String? ?? '',
  name: json['name'] as String? ?? '',
  price: (json['price'] as num?)?.toInt() ?? 0,
  originalPrice: (json['original_price'] as num?)?.toInt(),
  stock: (json['stock'] as num?)?.toInt() ?? 0,
  stockInfo: json['stockInfo'] == null
      ? null
      : VariantStock.fromJson(json['stockInfo'] as Map<String, dynamic>),
  isFeatured: json['is_featured'] as bool? ?? false,
  createdAt: json['created_at'] as String?,
  images: (json['resources'] as List<dynamic>?)
      ?.map((e) => Resource.fromJson(e as Map<String, dynamic>))
      .toList(),
  attributes: (json['attributes'] as List<dynamic>?)
      ?.map((e) => SkuAttribute.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ProductSkuToJson(_ProductSku instance) =>
    <String, dynamic>{
      'id': instance.id,
      'spu_id': instance.spuId,
      'name': instance.name,
      'price': instance.price,
      'original_price': instance.originalPrice,
      'stock': instance.stock,
      'stockInfo': instance.stockInfo,
      'is_featured': instance.isFeatured,
      'created_at': instance.createdAt,
      'resources': instance.images,
      'attributes': instance.attributes,
    };

_TProductDetail _$TProductDetailFromJson(Map<String, dynamic> json) =>
    _TProductDetail(
      id: json['id'] as String,
      name: json['name'] as String,
      slug: json['slug'] as String? ?? '',
      description: json['description'] as String?,
      price: (json['price'] as num?)?.toInt() ?? 0,
      priceMode: json['price_mode'] as String?,
      currency: json['currency'] as String?,
      condition: json['condition'] as String?,
      status: json['status'] as String?,
      originalPrice: (json['original_price'] as num?)?.toInt(),
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      reviewCount: (json['review_count'] as num?)?.toInt() ?? 0,
      favoriteCount: (json['favorite_count'] as num?)?.toInt() ?? 0,
      favorited: json['favorited'] as bool? ?? false,
      sold: (json['sold'] as num?)?.toInt() ?? 0,
      soldCount: (json['sold_count'] as num?)?.toInt(),
      category: json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
      seller: json['seller'] == null
          ? null
          : ListingSeller.fromJson(json['seller'] as Map<String, dynamic>),
      location: json['location'] == null
          ? null
          : ListingLocation.fromJson(json['location'] as Map<String, dynamic>),
      images: (json['resources'] as List<dynamic>?)
          ?.map((e) => Resource.fromJson(e as Map<String, dynamic>))
          .toList(),
      specifications: (json['specifications'] as List<dynamic>?)
          ?.map((e) => ProductSpecification.fromJson(e as Map<String, dynamic>))
          .toList(),
      skus: (json['skus'] as List<dynamic>?)
          ?.map((e) => ProductSku.fromJson(e as Map<String, dynamic>))
          .toList(),
      variants: (json['variants'] as List<dynamic>?)
          ?.map((e) => ProductSku.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      createdAt: json['created_at'] as String?,
      deletedAt: json['deleted_at'] as String?,
      vendorId: json['vendor_id'] as String?,
      vendorName: json['vendor_name'] as String?,
      vendorAvatar: json['vendor_avatar'] as String?,
      categoryId: json['category_id'] as String?,
      isNegotiable: json['is_negotiable'] as bool? ?? false,
    );

Map<String, dynamic> _$TProductDetailToJson(_TProductDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'description': instance.description,
      'price': instance.price,
      'price_mode': instance.priceMode,
      'currency': instance.currency,
      'condition': instance.condition,
      'status': instance.status,
      'original_price': instance.originalPrice,
      'rating': instance.rating,
      'review_count': instance.reviewCount,
      'favorite_count': instance.favoriteCount,
      'favorited': instance.favorited,
      'sold': instance.sold,
      'sold_count': instance.soldCount,
      'category': instance.category,
      'seller': instance.seller,
      'location': instance.location,
      'resources': instance.images,
      'specifications': instance.specifications,
      'skus': instance.skus,
      'variants': instance.variants,
      'tags': instance.tags,
      'created_at': instance.createdAt,
      'deleted_at': instance.deletedAt,
      'vendor_id': instance.vendorId,
      'vendor_name': instance.vendorName,
      'vendor_avatar': instance.vendorAvatar,
      'category_id': instance.categoryId,
      'is_negotiable': instance.isNegotiable,
    };
