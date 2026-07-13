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
      _$TProductCardFromJson(TProductCard._preprocessJson(json));

  static Map<String, dynamic> _preprocessJson(Map<String, dynamic> json) {
    // Trích xuất thumbnail từ resources nếu thumbnail null
    String? thumb = json['thumbnail'] as String?;
    if (thumb == null && json['resources'] != null) {
      final resList = json['resources'] as List<dynamic>;
      if (resList.isNotEmpty) {
        final firstRes = resList.first as Map<String, dynamic>;
        thumb = firstRes['url'] as String?;
      }
    }

    // Ánh xạ seller_id sang vendor_id nếu vendor_id null
    String? vId = json['vendor_id'] as String? ?? json['seller_id'] as String?;

    final modifiedJson = Map<String, dynamic>.from(json);
    modifiedJson['thumbnail'] = thumb;
    modifiedJson['vendor_id'] = vId;

    return modifiedJson;
  }
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
  const factory SkuAttribute({required String key, required String value}) =
      _SkuAttribute;

  factory SkuAttribute.fromJson(Map<String, dynamic> json) =>
      _$SkuAttributeFromJson(json);
}

@freezed
abstract class ProductSku with _$ProductSku {
  const factory ProductSku({
    required String id,
    @JsonKey(name: 'spu_id') @Default('') String spuId,
    @JsonKey(name: 'name') @Default('') String name,
    required int price,
    @JsonKey(name: 'original_price') int? originalPrice,
    required int stock,
    @JsonKey(name: 'resources') List<ResourceModel>? images,
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
    @Default(0) int price,
    @JsonKey(name: 'original_price') int? originalPrice,
    RatingModel? rating,
    @JsonKey(name: 'sold_count') int? soldCount,
    @JsonKey(name: 'resources') List<ResourceModel>? images,
    List<ProductSpecification>? specifications,
    List<ProductSku>? skus,
    @JsonKey(name: 'vendor_id') String? vendorId,
    @JsonKey(name: 'vendor_name') String? vendorName,
    @JsonKey(name: 'vendor_avatar') String? vendorAvatar,
    @JsonKey(name: 'category_id') String? categoryId,
  }) = _TProductDetail;

  factory TProductDetail.fromJson(Map<String, dynamic> json) =>
      _$TProductDetailFromJson(TProductDetail._preprocessJson(json));

  static Map<String, dynamic> _preprocessJson(Map<String, dynamic> json) {
    // Ánh xạ seller_id sang vendor_id nếu vendor_id null
    String? vId = json['vendor_id'] as String? ?? json['seller_id'] as String?;
    final modifiedJson = Map<String, dynamic>.from(json);
    modifiedJson['vendor_id'] = vId;
    return modifiedJson;
  }
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
abstract class ProductComment with _$ProductComment {
  const factory ProductComment({
    required String id,
    @JsonKey(name: 'ref_id') required String refId,
    @JsonKey(name: 'ref_type') required String refType,
    @JsonKey(name: 'account_id') String? accountId,
    @JsonKey(name: 'order_id') String? orderId,
    CommentProfile? profile,
    String? body,
    int? upvote,
    int? downvote,
    required double score,
    @JsonKey(name: 'date_created') String? dateCreated,
    @JsonKey(name: 'date_updated') String? dateUpdated,
    @JsonKey(name: 'resources') List<ResourceModel>? attachments,
    List<SkuAttribute>? attributes,
  }) = _ProductComment;

  factory ProductComment.fromJson(Map<String, dynamic> json) =>
      _$ProductCommentFromJson(json);
}
