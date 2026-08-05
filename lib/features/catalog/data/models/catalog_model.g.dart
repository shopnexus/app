// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Category _$CategoryFromJson(Map<String, dynamic> json) => _Category(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String? ?? '',
  parentId: json['parent_id'] as String?,
  score: (json['score'] as num?)?.toDouble(),
  slug: json['slug'] as String?,
  icon: json['icon'] as String?,
);

Map<String, dynamic> _$CategoryToJson(_Category instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'parent_id': instance.parentId,
  'score': instance.score,
  'slug': instance.slug,
  'icon': instance.icon,
};

_Tag _$TagFromJson(Map<String, dynamic> json) => _Tag(
  slug: json['slug'] as String,
  description: json['description'] as String?,
  score: (json['score'] as num?)?.toDouble(),
);

Map<String, dynamic> _$TagToJson(_Tag instance) => <String, dynamic>{
  'slug': instance.slug,
  'description': instance.description,
  'score': instance.score,
};

_ListingSeller _$ListingSellerFromJson(Map<String, dynamic> json) =>
    _ListingSeller(
      id: json['id'] as String,
      name: json['name'] as String,
      avatar: json['avatar'] == null
          ? null
          : ResourceModel.fromJson(json['avatar'] as Map<String, dynamic>),
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
          : ResourceModel.fromJson(json['cover'] as Map<String, dynamic>),
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
      ratingModel: json['ratingModel'] == null
          ? null
          : RatingModel.fromJson(json['ratingModel'] as Map<String, dynamic>),
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
      'ratingModel': instance.ratingModel,
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
          ?.map((e) => ResourceModel.fromJson(e as Map<String, dynamic>))
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
      minNegotiablePrice: (json['min_negotiable_price'] as num?)?.toInt(),
      maxNegotiablePrice: (json['max_negotiable_price'] as num?)?.toInt(),
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
      'min_negotiable_price': instance.minNegotiablePrice,
      'max_negotiable_price': instance.maxNegotiablePrice,
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

_ReviewAuthor _$ReviewAuthorFromJson(Map<String, dynamic> json) =>
    _ReviewAuthor(
      id: json['id'] as String,
      name: json['name'] as String,
      avatar: json['avatar'] == null
          ? null
          : ResourceModel.fromJson(json['avatar'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReviewAuthorToJson(_ReviewAuthor instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'avatar': instance.avatar,
    };

_ReviewVoteTally _$ReviewVoteTallyFromJson(Map<String, dynamic> json) =>
    _ReviewVoteTally(
      helpful: (json['helpful'] as num?)?.toInt() ?? 0,
      notHelpful: (json['not_helpful'] as num?)?.toInt() ?? 0,
      myVote: (json['my_vote'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ReviewVoteTallyToJson(_ReviewVoteTally instance) =>
    <String, dynamic>{
      'helpful': instance.helpful,
      'not_helpful': instance.notHelpful,
      'my_vote': instance.myVote,
    };

_ProductComment _$ProductCommentFromJson(Map<String, dynamic> json) =>
    _ProductComment(
      id: json['id'] as String,
      listingId: json['listing_id'] as String?,
      refId: json['ref_id'] as String?,
      refType: json['ref_type'] as String?,
      accountId: json['account_id'] as String?,
      orderId: json['order_id'] as String?,
      profile: json['profile'] == null
          ? null
          : CommentProfile.fromJson(json['profile'] as Map<String, dynamic>),
      author: json['author'] == null
          ? null
          : ReviewAuthor.fromJson(json['author'] as Map<String, dynamic>),
      body: json['body'] as String?,
      rating: (json['rating'] as num?)?.toInt() ?? 0,
      upvote: (json['upvote'] as num?)?.toInt(),
      downvote: (json['downvote'] as num?)?.toInt(),
      score: (json['score'] as num?)?.toDouble(),
      votes: json['votes'] == null
          ? null
          : ReviewVoteTally.fromJson(json['votes'] as Map<String, dynamic>),
      createdAt: json['created_at'] as String?,
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
      'listing_id': instance.listingId,
      'ref_id': instance.refId,
      'ref_type': instance.refType,
      'account_id': instance.accountId,
      'order_id': instance.orderId,
      'profile': instance.profile,
      'author': instance.author,
      'body': instance.body,
      'rating': instance.rating,
      'upvote': instance.upvote,
      'downvote': instance.downvote,
      'score': instance.score,
      'votes': instance.votes,
      'created_at': instance.createdAt,
      'date_created': instance.dateCreated,
      'date_updated': instance.dateUpdated,
      'resources': instance.attachments,
      'attributes': instance.attributes,
    };

_CreateListingRequest _$CreateListingRequestFromJson(
  Map<String, dynamic> json,
) => _CreateListingRequest(
  name: json['name'] as String,
  categoryId: json['category_id'] as String,
  condition: json['condition'] as String,
  currency: json['currency'] as String,
  priceMode: json['price_mode'] as String,
  description: json['description'] as String?,
  tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
  attachments: (json['attachments'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  specifications: json['specifications'] as Map<String, dynamic>?,
  variants: (json['variants'] as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .toList(),
);

Map<String, dynamic> _$CreateListingRequestToJson(
  _CreateListingRequest instance,
) => <String, dynamic>{
  'name': instance.name,
  'category_id': instance.categoryId,
  'condition': instance.condition,
  'currency': instance.currency,
  'price_mode': instance.priceMode,
  'description': instance.description,
  'tags': instance.tags,
  'attachments': instance.attachments,
  'specifications': instance.specifications,
  'variants': instance.variants,
};

_UpdateListingRequest _$UpdateListingRequestFromJson(
  Map<String, dynamic> json,
) => _UpdateListingRequest(
  name: json['name'] as String?,
  categoryId: json['category_id'] as String?,
  condition: json['condition'] as String?,
  description: json['description'] as String?,
  priceMode: json['price_mode'] as String?,
  tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
  attachments: (json['attachments'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  specifications: json['specifications'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$UpdateListingRequestToJson(
  _UpdateListingRequest instance,
) => <String, dynamic>{
  'name': instance.name,
  'category_id': instance.categoryId,
  'condition': instance.condition,
  'description': instance.description,
  'price_mode': instance.priceMode,
  'tags': instance.tags,
  'attachments': instance.attachments,
  'specifications': instance.specifications,
};

_SubmitReviewRequest _$SubmitReviewRequestFromJson(Map<String, dynamic> json) =>
    _SubmitReviewRequest(
      orderId: json['order_id'] as String,
      rating: (json['rating'] as num).toInt(),
      body: json['body'] as String?,
      attachments: (json['attachments'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$SubmitReviewRequestToJson(
  _SubmitReviewRequest instance,
) => <String, dynamic>{
  'order_id': instance.orderId,
  'rating': instance.rating,
  'body': instance.body,
  'attachments': instance.attachments,
};

_VoteReviewRequest _$VoteReviewRequestFromJson(Map<String, dynamic> json) =>
    _VoteReviewRequest(vote: (json['vote'] as num).toInt());

Map<String, dynamic> _$VoteReviewRequestToJson(_VoteReviewRequest instance) =>
    <String, dynamic>{'vote': instance.vote};
