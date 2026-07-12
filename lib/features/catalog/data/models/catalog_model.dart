import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../shared/models/rating_model.dart';
import '../../../../shared/models/resource_model.dart';

part 'catalog_model.freezed.dart';

part 'catalog_model.g.dart';

@freezed
abstract class Category with _$Category {
  const factory Category({
    required String id,
    required String name,
    required String slug,
    String? icon,
    @JsonKey(name: 'parent_id') String? parentId,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}

@freezed
abstract class TProductCard with _$TProductCard {
  const factory TProductCard({
    required String id,
    required String name,
    required String slug,
    String? thumbnail,
    required int price,
    @JsonKey(name: 'original_price') int? originalPrice,
    @JsonKey(name: 'discount_rate') double? discountRate,
    RatingModel? rating,
    @JsonKey(name: 'sold_count') int? soldCount,
    List<String>? tags,
    @JsonKey(name: 'vendor_id') String? vendorId,
    @JsonKey(name: 'vendor_name') String? vendorName,
  }) = _TProductCard;

  factory TProductCard.fromJson(Map<String, dynamic> json) =>
      _$TProductCardFromJson(json);
}

@freezed
abstract class ProductSpecification with _$ProductSpecification {
  const factory ProductSpecification({
    required String key,
    required String value,
  }) = _ProductSpecification;

  factory ProductSpecification.fromJson(Map<String, dynamic> json) =>
      _$ProductSpecificationFromJson(json);
}

@freezed
abstract class SkuAttribute with _$SkuAttribute {
  const factory SkuAttribute({required String key, required String value}) =
      _SkuAttribute;

  factory SkuAttribute.fromJson(Map<String, dynamic> json) =>
      _$SkuAttributeFromJson(json);
}

@freezed
abstract class ProductSku with _$ProductSku {
  const factory ProductSku({
    required String id,
    @JsonKey(name: 'spu_id') required String spuId,
    required String name,
    required int price,
    @JsonKey(name: 'original_price') int? originalPrice,
    required int stock,
    List<ResourceModel>? images,
    List<SkuAttribute>? attributes,
  }) = _ProductSku;

  factory ProductSku.fromJson(Map<String, dynamic> json) =>
      _$ProductSkuFromJson(json);
}

@freezed
abstract class TProductDetail with _$TProductDetail {
  const factory TProductDetail({
    required String id,
    required String name,
    required String slug,
    String? description,
    required int price,
    @JsonKey(name: 'original_price') int? originalPrice,
    RatingModel? rating,
    @JsonKey(name: 'sold_count') int? soldCount,
    List<ResourceModel>? images,
    List<ProductSpecification>? specifications,
    List<ProductSku>? skus,
    @JsonKey(name: 'vendor_id') String? vendorId,
    @JsonKey(name: 'vendor_name') String? vendorName,
    @JsonKey(name: 'vendor_avatar') String? vendorAvatar,
    @JsonKey(name: 'category_id') String? categoryId,
  }) = _TProductDetail;

  factory TProductDetail.fromJson(Map<String, dynamic> json) =>
      _$TProductDetailFromJson(json);
}

@freezed
abstract class ProductComment with _$ProductComment {
  const factory ProductComment({
    required String id,
    @JsonKey(name: 'spu_id') required String spuId,
    @JsonKey(name: 'user_id') String? userId,
    String? username,
    @JsonKey(name: 'user_avatar') String? userAvatar,
    required double score,
    String? content,
    @JsonKey(name: 'created_at') String? createdAt,
    List<ResourceModel>? attachments,
    List<SkuAttribute>? attributes,
  }) = _ProductComment;

  factory ProductComment.fromJson(Map<String, dynamic> json) =>
      _$ProductCommentFromJson(json);
}
