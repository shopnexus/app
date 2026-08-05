import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopnexus_flutter_app/api/generated/model/category.dart';
import 'package:shopnexus_flutter_app/api/generated/model/listing_detail.dart';
import 'package:shopnexus_flutter_app/api/generated/model/listing_location.dart';
import 'package:shopnexus_flutter_app/api/generated/model/price_mode.dart';
import 'package:shopnexus_flutter_app/api/generated/model/resource.dart';
import 'package:shopnexus_flutter_app/api/generated/model/variant.dart';

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

/// What the "vừa xem" carousel draws, cached in Hive. Not a wire type: a
/// `ListingDetail` carries no card price, so the featured variant's price is
/// resolved here instead of being stored as if the server had sent one.
@freezed
abstract class RecentListing with _$RecentListing {
  const RecentListing._();

  const factory RecentListing({
    required String id,
    required String name,
    required int price,
    @JsonKey(name: 'cover_url') String? coverUrl,
    @JsonKey(name: 'seller_name') String? sellerName,
    @Default(0.0) double rating,
    @Default(false) bool negotiable,
  }) = _RecentListing;

  factory RecentListing.fromJson(Map<String, dynamic> json) =>
      _$RecentListingFromJson(json);

  factory RecentListing.fromDetail(ListingDetail detail) => RecentListing(
    id: detail.id,
    name: detail.name,
    price: featuredPrice(detail),
    coverUrl: detail.images.firstOrNull?.url,
    sellerName: detail.seller.name,
    rating: detail.rating,
    negotiable: detail.priceMode == PriceMode.negotiable,
  );
}

/// The one price a card can show for a listing whose variants may differ: the
/// featured variant's, or the cheapest when none is featured — the same rule
/// `Listing.price` follows on the feed.
int featuredPrice(ListingDetail detail) {
  for (final variant in detail.variants) {
    if (variant.id == detail.featuredVariantId || variant.isFeatured) {
      return variant.price;
    }
  }
  if (detail.variants.isEmpty) return 0;
  return detail.variants.map((v) => v.price).reduce((a, b) => a < b ? a : b);
}

/// Size and colour, in the order the seller entered them. `Variant.attributes` is
/// an open `type: object`, so a value may be any JSON scalar.
String variantLabel(Variant variant) =>
    variant.attributes.values.map((v) => v.toString()).join(' • ');

// Everything below is the pre-generated-client shape, kept alive only because
// `lib/features/seller` still parses and constructs it. Catalog itself reads the
// generated `Listing`/`ListingDetail`/`Variant`/`Review`. It goes when that
// feature migrates — along with the legacy fields no response has ever carried
// (`thumbnail`, `original_price`, `sold_count`, `vendor_*`, `is_negotiable`,
// `skus`), which cannot be dropped while its literals still pass them.

@freezed
abstract class ListingSeller with _$ListingSeller {
  const factory ListingSeller({
    required String id,
    required String name,
    Resource? avatar,
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
    Resource? cover,
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
    @JsonKey(name: 'resources') List<Resource>? images,
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
    @JsonKey(name: 'resources') List<Resource>? images,
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
