import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopnexus_flutter_app/api/generated/model/listing_location.dart';
import 'package:shopnexus_flutter_app/shared/models/rating_model.dart';
import 'package:shopnexus_flutter_app/shared/models/resource_model.dart';

part 'catalog_model.freezed.dart';
part 'catalog_model.g.dart';

/// The `sort` values `GET /listings` accepts. `newest` is also what a null sort
/// means, so the UI keeps sending null for the default.
abstract final class ListingSort {
  static const newest = 'newest';
  static const rating = 'rating';
  static const priceAsc = 'price-asc';
  static const priceDesc = 'price-desc';
  static const bestSelling = 'best-selling';
  static const relevance = 'relevance';
  static const recommended = 'recommended';
  static const distance = 'distance';
}

@freezed
abstract class Category with _$Category {
  const Category._();

  const factory Category({
    required String id,
    required String name,
    @Default('') String description,
    @JsonKey(name: 'parent_id') String? parentId,
    double? score,
    String? slug,
    String? icon,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(Category._preprocessJson(json));

  static Map<String, dynamic> _preprocessJson(Map<String, dynamic> json) {
    final modified = Map<String, dynamic>.from(json);
    if (!modified.containsKey('slug') || modified['slug'] == null) {
      modified['slug'] = modified['id'];
    }
    return modified;
  }

  String get effectiveSlug => slug ?? id;
}

@freezed
abstract class Tag with _$Tag {
  const factory Tag({
    required String slug,
    String? description,
    double? score,
  }) = _Tag;

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);
}

@freezed
abstract class ListingSeller with _$ListingSeller {
  const factory ListingSeller({
    required String id,
    required String name,
    ResourceModel? avatar,
  }) = _ListingSeller;

  factory ListingSeller.fromJson(Map<String, dynamic> json) =>
      _$ListingSellerFromJson(json);
}

@freezed
abstract class TProductCard with _$TProductCard {
  const TProductCard._();

  const factory TProductCard({
    required String id,
    required String name,
    @Default('') String slug,
    @Default(0) int price,
    @JsonKey(name: 'price_mode') String? priceMode,
    String? currency,
    @JsonKey(name: 'category_id') String? categoryId,
    String? condition,
    ResourceModel? cover,
    @Default(0.0) double rating,
    @JsonKey(name: 'review_count') @Default(0) int reviewCount,
    @Default(0) int sold,
    String? status,
    @Default(false) bool favorited,
    ListingSeller? seller,
    ListingLocation? location,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'deleted_at') String? deletedAt,
    double? score,

    // Backward-compatibility legacy fields
    String? thumbnail,
    @JsonKey(name: 'original_price') int? originalPrice,
    @JsonKey(name: 'discount_rate') double? discountRate,
    RatingModel? ratingModel,
    @JsonKey(name: 'sold_count') int? soldCount,
    List<String>? tags,
    @JsonKey(name: 'vendor_id') String? vendorId,
    @JsonKey(name: 'vendor_name') String? vendorName,
    @JsonKey(name: 'is_negotiable') @Default(false) bool isNegotiable,
  }) = _TProductCard;

  factory TProductCard.fromJson(Map<String, dynamic> json) =>
      _$TProductCardFromJson(TProductCard._preprocessJson(json));

  static Map<String, dynamic> _preprocessJson(Map<String, dynamic> json) {
    final modified = Map<String, dynamic>.from(json);

    // Extract thumbnail from cover or resources
    String? thumb = modified['thumbnail'] as String?;
    if (thumb == null && modified['cover'] != null) {
      final coverObj = modified['cover'] as Map<String, dynamic>;
      thumb = coverObj['url'] as String?;
    } else if (thumb == null && modified['resources'] != null) {
      final resList = modified['resources'] as List<dynamic>;
      if (resList.isNotEmpty) {
        final firstRes = resList.first as Map<String, dynamic>;
        thumb = firstRes['url'] as String?;
      }
    }

    // Extract vendor info from seller
    String? vId = modified['vendor_id'] as String?;
    String? vName = modified['vendor_name'] as String?;
    if (modified['seller'] != null) {
      final sObj = modified['seller'] as Map<String, dynamic>;
      vId ??= sObj['id'] as String?;
      vName ??= sObj['name'] as String?;
    }
    vId ??= modified['seller_id'] as String?;

    modified['thumbnail'] = thumb;
    modified['vendor_id'] = vId;
    modified['vendor_name'] = vName;

    return modified;
  }

  String? get effectiveThumbnail => thumbnail ?? cover?.url;
  String? get effectiveVendorId => vendorId ?? seller?.id;
  String? get effectiveVendorName => vendorName ?? seller?.name;
  bool get effectiveIsNegotiable => isNegotiable || priceMode == 'negotiable';

  /// Only set when the browse sent a position, so its absence is "not asked",
  /// not "far away".
  double? get distanceKm => location?.distanceKm;
  RatingModel get effectiveRating =>
      ratingModel ?? RatingModel(score: rating, count: reviewCount);
  int get effectiveSoldCount => soldCount ?? sold;
}

@freezed
abstract class ProductSpecification with _$ProductSpecification {
  const factory ProductSpecification({
    @JsonKey(name: 'name') required String key,
    required String value,
  }) = _ProductSpecification;

  factory ProductSpecification.fromJson(Map<String, dynamic> json) =>
      _$ProductSpecificationFromJson(json);
}

@freezed
abstract class SkuAttribute with _$SkuAttribute {
  const factory SkuAttribute({
    @JsonKey(name: 'name') required String key,
    required String value,
  }) = _SkuAttribute;

  factory SkuAttribute.fromJson(Map<String, dynamic> json) =>
      _$SkuAttributeFromJson(json);
}

@freezed
abstract class VariantStock with _$VariantStock {
  const factory VariantStock({
    @Default(0) int available,
    @Default(0) int quantity,
    @Default(0) int reserved,
    @Default(0) int sold,
  }) = _VariantStock;

  factory VariantStock.fromJson(Map<String, dynamic> json) =>
      _$VariantStockFromJson(json);
}

@freezed
abstract class ProductSku with _$ProductSku {
  const ProductSku._();

  const factory ProductSku({
    required String id,
    @JsonKey(name: 'spu_id') @Default('') String spuId,
    @JsonKey(name: 'name') @Default('') String name,
    @Default(0) int price,
    @JsonKey(name: 'original_price') int? originalPrice,
    @Default(0) int stock,
    VariantStock? stockInfo,
    @JsonKey(name: 'is_featured') @Default(false) bool isFeatured,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'resources') List<ResourceModel>? images,
    List<SkuAttribute>? attributes,
  }) = _ProductSku;

  factory ProductSku.fromJson(Map<String, dynamic> json) =>
      _$ProductSkuFromJson(ProductSku._preprocessJson(json));

  static Map<String, dynamic> _preprocessJson(Map<String, dynamic> json) {
    final modified = Map<String, dynamic>.from(json);

    // Extract stock count from stock object if present
    if (modified['stock'] is Map) {
      final stockObj = modified['stock'] as Map<String, dynamic>;
      modified['stockInfo'] = stockObj;
      modified['stock'] = stockObj['available'] ?? stockObj['quantity'] ?? 0;
    }

    return modified;
  }

  int get availableStock => stockInfo?.available ?? stock;
}

@freezed
abstract class TProductDetail with _$TProductDetail {
  const TProductDetail._();

  const factory TProductDetail({
    required String id,
    required String name,
    @Default('') String slug,
    String? description,
    @Default(0) int price,
    @JsonKey(name: 'price_mode') String? priceMode,
    String? currency,
    String? condition,
    String? status,
    @JsonKey(name: 'original_price') int? originalPrice,
    @Default(0.0) double rating,
    @JsonKey(name: 'review_count') @Default(0) int reviewCount,
    @JsonKey(name: 'favorite_count') @Default(0) int favoriteCount,
    @Default(false) bool favorited,
    @Default(0) int sold,
    @JsonKey(name: 'sold_count') int? soldCount,
    Category? category,
    ListingSeller? seller,
    ListingLocation? location,
    @JsonKey(name: 'resources') List<ResourceModel>? images,
    List<ProductSpecification>? specifications,
    List<ProductSku>? skus,
    List<ProductSku>? variants,
    List<String>? tags,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'deleted_at') String? deletedAt,
    @JsonKey(name: 'vendor_id') String? vendorId,
    @JsonKey(name: 'vendor_name') String? vendorName,
    @JsonKey(name: 'vendor_avatar') String? vendorAvatar,
    @JsonKey(name: 'category_id') String? categoryId,
    @JsonKey(name: 'is_negotiable') @Default(false) bool isNegotiable,
    @JsonKey(name: 'min_negotiable_price') int? minNegotiablePrice,
    @JsonKey(name: 'max_negotiable_price') int? maxNegotiablePrice,
  }) = _TProductDetail;

  factory TProductDetail.fromJson(Map<String, dynamic> json) =>
      _$TProductDetailFromJson(TProductDetail._preprocessJson(json));

  static Map<String, dynamic> _preprocessJson(Map<String, dynamic> json) {
    final modified = Map<String, dynamic>.from(json);

    // Vendor mapping from seller
    String? vId = modified['vendor_id'] as String?;
    String? vName = modified['vendor_name'] as String?;
    String? vAvatar = modified['vendor_avatar'] as String?;
    if (modified['seller'] != null) {
      final sObj = modified['seller'] as Map<String, dynamic>;
      vId ??= sObj['id'] as String?;
      vName ??= sObj['name'] as String?;
      if (sObj['avatar'] != null) {
        final av = sObj['avatar'] as Map<String, dynamic>;
        vAvatar ??= av['url'] as String?;
      }
    }
    vId ??= modified['seller_id'] as String?;

    // Category mapping
    String? catId = modified['category_id'] as String?;
    if (modified['category'] != null) {
      final cObj = modified['category'] as Map<String, dynamic>;
      catId ??= cObj['id'] as String?;
    }

    // Variants/SKUs mapping
    if (modified['skus'] == null && modified['variants'] != null) {
      modified['skus'] = modified['variants'];
    }

    modified['vendor_id'] = vId;
    modified['vendor_name'] = vName;
    modified['vendor_avatar'] = vAvatar;
    modified['category_id'] = catId;

    return modified;
  }

  String? get effectiveVendorId => vendorId ?? seller?.id;
  String? get effectiveVendorName => vendorName ?? seller?.name;
  String? get effectiveVendorAvatar => vendorAvatar ?? seller?.avatar?.url;
  String? get effectiveCategoryId => categoryId ?? category?.id;
  bool get effectiveIsNegotiable => isNegotiable || priceMode == 'negotiable';
  List<ProductSku> get effectiveSkus => skus ?? variants ?? const [];
  int get effectiveSoldCount => soldCount ?? sold;
}

@freezed
abstract class CommentProfile with _$CommentProfile {
  const factory CommentProfile({
    required String id,
    String? username,
    String? name,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
  }) = _CommentProfile;

  factory CommentProfile.fromJson(Map<String, dynamic> json) =>
      _$CommentProfileFromJson(json);
}

@freezed
abstract class ReviewAuthor with _$ReviewAuthor {
  const factory ReviewAuthor({
    required String id,
    required String name,
    ResourceModel? avatar,
  }) = _ReviewAuthor;

  factory ReviewAuthor.fromJson(Map<String, dynamic> json) =>
      _$ReviewAuthorFromJson(json);
}

@freezed
abstract class ReviewVoteTally with _$ReviewVoteTally {
  const factory ReviewVoteTally({
    @Default(0) int helpful,
    @JsonKey(name: 'not_helpful') @Default(0) int notHelpful,
    @JsonKey(name: 'my_vote') int? myVote,
  }) = _ReviewVoteTally;

  factory ReviewVoteTally.fromJson(Map<String, dynamic> json) =>
      _$ReviewVoteTallyFromJson(json);
}

@freezed
abstract class ProductComment with _$ProductComment {
  const ProductComment._();

  const factory ProductComment({
    required String id,
    @JsonKey(name: 'listing_id') String? listingId,
    @JsonKey(name: 'ref_id') String? refId,
    @JsonKey(name: 'ref_type') String? refType,
    @JsonKey(name: 'account_id') String? accountId,
    @JsonKey(name: 'order_id') String? orderId,
    CommentProfile? profile,
    ReviewAuthor? author,
    String? body,
    @Default(0) int rating,
    int? upvote,
    int? downvote,
    double? score,
    ReviewVoteTally? votes,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'date_created') String? dateCreated,
    @JsonKey(name: 'date_updated') String? dateUpdated,
    @JsonKey(name: 'resources') List<ResourceModel>? attachments,
    List<SkuAttribute>? attributes,
  }) = _ProductComment;

  factory ProductComment.fromJson(Map<String, dynamic> json) =>
      _$ProductCommentFromJson(ProductComment._preprocessJson(json));

  static Map<String, dynamic> _preprocessJson(Map<String, dynamic> json) {
    final modified = Map<String, dynamic>.from(json);

    // Profile mapping from author
    if (modified['profile'] == null && modified['author'] != null) {
      final aObj = modified['author'] as Map<String, dynamic>;
      String? avUrl;
      if (aObj['avatar'] != null) {
        avUrl = (aObj['avatar'] as Map<String, dynamic>)['url'] as String?;
      }
      modified['profile'] = {
        'id': aObj['id'],
        'name': aObj['name'],
        'avatar_url': avUrl,
      };
    }

    modified['ref_id'] ??= modified['listing_id'];
    modified['date_created'] ??= modified['created_at'];

    return modified;
  }

  String get effectiveRefId => refId ?? listingId ?? '';
  double get effectiveScore => score ?? rating.toDouble();
  CommentProfile? get effectiveProfile =>
      profile ??
      (author != null
          ? CommentProfile(
              id: author!.id,
              name: author!.name,
              avatarUrl: author!.avatar?.url,
            )
          : null);
}

@freezed
abstract class CreateListingRequest with _$CreateListingRequest {
  const factory CreateListingRequest({
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'category_id') required String categoryId,
    @JsonKey(name: 'condition') required String condition,
    @JsonKey(name: 'currency') required String currency,
    @JsonKey(name: 'price_mode') required String priceMode,
    String? description,
    List<String>? tags,
    List<String>? attachments,
    Map<String, dynamic>? specifications,
    required List<Map<String, dynamic>> variants,
  }) = _CreateListingRequest;

  factory CreateListingRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateListingRequestFromJson(json);
}

@freezed
abstract class UpdateListingRequest with _$UpdateListingRequest {
  const factory UpdateListingRequest({
    String? name,
    @JsonKey(name: 'category_id') String? categoryId,
    String? condition,
    String? description,
    @JsonKey(name: 'price_mode') String? priceMode,
    List<String>? tags,
    List<String>? attachments,
    Map<String, dynamic>? specifications,
  }) = _UpdateListingRequest;

  factory UpdateListingRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateListingRequestFromJson(json);
}

@freezed
abstract class SubmitReviewRequest with _$SubmitReviewRequest {
  const factory SubmitReviewRequest({
    @JsonKey(name: 'order_id') required String orderId,
    required int rating,
    String? body,
    List<String>? attachments,
  }) = _SubmitReviewRequest;

  factory SubmitReviewRequest.fromJson(Map<String, dynamic> json) =>
      _$SubmitReviewRequestFromJson(json);
}

@freezed
abstract class VoteReviewRequest with _$VoteReviewRequest {
  const factory VoteReviewRequest({required int vote}) = _VoteReviewRequest;

  factory VoteReviewRequest.fromJson(Map<String, dynamic> json) =>
      _$VoteReviewRequestFromJson(json);
}
