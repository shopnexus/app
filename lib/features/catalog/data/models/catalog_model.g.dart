// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Category _$CategoryFromJson(Map<String, dynamic> json) => _Category(
  id: json['id'] as String,
  name: json['name'] as String,
  slug: json['slug'] as String,
  icon: json['icon'] as String?,
  parentId: json['parent_id'] as String?,
);

Map<String, dynamic> _$CategoryToJson(_Category instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'slug': instance.slug,
  'icon': instance.icon,
  'parent_id': instance.parentId,
};

_TProductCard _$TProductCardFromJson(Map<String, dynamic> json) =>
    _TProductCard(
      id: json['id'] as String,
      name: json['name'] as String,
      slug: json['slug'] as String,
      thumbnail: json['thumbnail'] as String?,
      price: (json['price'] as num).toInt(),
      originalPrice: (json['original_price'] as num?)?.toInt(),
      discountRate: (json['discount_rate'] as num?)?.toDouble(),
      rating: json['rating'] == null
          ? null
          : RatingModel.fromJson(json['rating'] as Map<String, dynamic>),
      soldCount: (json['sold_count'] as num?)?.toInt(),
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      vendorId: json['vendor_id'] as String?,
      vendorName: json['vendor_name'] as String?,
    );

Map<String, dynamic> _$TProductCardToJson(_TProductCard instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'thumbnail': instance.thumbnail,
      'price': instance.price,
      'original_price': instance.originalPrice,
      'discount_rate': instance.discountRate,
      'rating': instance.rating,
      'sold_count': instance.soldCount,
      'tags': instance.tags,
      'vendor_id': instance.vendorId,
      'vendor_name': instance.vendorName,
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
    _SkuAttribute(key: json['key'] as String, value: json['value'] as String);

Map<String, dynamic> _$SkuAttributeToJson(_SkuAttribute instance) =>
    <String, dynamic>{'key': instance.key, 'value': instance.value};

_ProductSku _$ProductSkuFromJson(Map<String, dynamic> json) => _ProductSku(
  id: json['id'] as String,
  spuId: json['spu_id'] as String? ?? '',
  name: json['name'] as String? ?? '',
  price: (json['price'] as num).toInt(),
  originalPrice: (json['original_price'] as num?)?.toInt(),
  stock: (json['stock'] as num).toInt(),
  images: (json['resources'] as List<dynamic>?)
      ?.map((e) => ResourceModel.fromJson(e as Map<String, dynamic>))
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
      'resources': instance.images,
      'attributes': instance.attributes,
    };

_TProductDetail _$TProductDetailFromJson(Map<String, dynamic> json) =>
    _TProductDetail(
      id: json['id'] as String,
      name: json['name'] as String,
      slug: json['slug'] as String,
      description: json['description'] as String?,
      price: (json['price'] as num?)?.toInt() ?? 0,
      originalPrice: (json['original_price'] as num?)?.toInt(),
      rating: json['rating'] == null
          ? null
          : RatingModel.fromJson(json['rating'] as Map<String, dynamic>),
      soldCount: (json['sold_count'] as num?)?.toInt(),
      images: (json['resources'] as List<dynamic>?)
          ?.map((e) => ResourceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      specifications: (json['specifications'] as List<dynamic>?)
          ?.map((e) => ProductSpecification.fromJson(e as Map<String, dynamic>))
          .toList(),
      skus: (json['skus'] as List<dynamic>?)
          ?.map((e) => ProductSku.fromJson(e as Map<String, dynamic>))
          .toList(),
      vendorId: json['vendor_id'] as String?,
      vendorName: json['vendor_name'] as String?,
      vendorAvatar: json['vendor_avatar'] as String?,
      categoryId: json['category_id'] as String?,
    );

Map<String, dynamic> _$TProductDetailToJson(_TProductDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'description': instance.description,
      'price': instance.price,
      'original_price': instance.originalPrice,
      'rating': instance.rating,
      'sold_count': instance.soldCount,
      'resources': instance.images,
      'specifications': instance.specifications,
      'skus': instance.skus,
      'vendor_id': instance.vendorId,
      'vendor_name': instance.vendorName,
      'vendor_avatar': instance.vendorAvatar,
      'category_id': instance.categoryId,
    };

_CommentProfile _$CommentProfileFromJson(Map<String, dynamic> json) =>
    _CommentProfile(
      id: json['id'] as String,
      username: json['username'] as String?,
      name: json['name'] as String?,
      avatarUrl: json['avatar_url'] as String?,
    );

Map<String, dynamic> _$CommentProfileToJson(_CommentProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'name': instance.name,
      'avatar_url': instance.avatarUrl,
    };

_ProductComment _$ProductCommentFromJson(Map<String, dynamic> json) =>
    _ProductComment(
      id: json['id'] as String,
      refId: json['ref_id'] as String,
      refType: json['ref_type'] as String,
      accountId: json['account_id'] as String?,
      orderId: json['order_id'] as String?,
      profile: json['profile'] == null
          ? null
          : CommentProfile.fromJson(json['profile'] as Map<String, dynamic>),
      body: json['body'] as String?,
      upvote: (json['upvote'] as num?)?.toInt(),
      downvote: (json['downvote'] as num?)?.toInt(),
      score: (json['score'] as num).toDouble(),
      dateCreated: json['date_created'] as String?,
      dateUpdated: json['date_updated'] as String?,
      attachments: (json['resources'] as List<dynamic>?)
          ?.map((e) => ResourceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      attributes: (json['attributes'] as List<dynamic>?)
          ?.map((e) => SkuAttribute.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductCommentToJson(_ProductComment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ref_id': instance.refId,
      'ref_type': instance.refType,
      'account_id': instance.accountId,
      'order_id': instance.orderId,
      'profile': instance.profile,
      'body': instance.body,
      'upvote': instance.upvote,
      'downvote': instance.downvote,
      'score': instance.score,
      'date_created': instance.dateCreated,
      'date_updated': instance.dateUpdated,
      'resources': instance.attachments,
      'attributes': instance.attributes,
    };
