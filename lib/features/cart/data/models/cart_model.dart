import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopnexus_flutter_app/shared/models/resource_model.dart';
import 'package:shopnexus_flutter_app/features/catalog/data/models/catalog_model.dart';

part 'cart_model.freezed.dart';

part 'cart_model.g.dart';

@freezed
abstract class PackageDetails with _$PackageDetails {
  const factory PackageDetails({
    @JsonKey(name: 'weight_grams') required int weightGrams,
    @JsonKey(name: 'length_cm') required int lengthCm,
    @JsonKey(name: 'width_cm') required int widthCm,
    @JsonKey(name: 'height_cm') required int heightCm,
  }) = _PackageDetails;

  factory PackageDetails.fromJson(Map<String, dynamic> json) =>
      _$PackageDetailsFromJson(json);
}

@freezed
abstract class CartSku with _$CartSku {
  const factory CartSku({
    required String id,
    @JsonKey(name: 'spu_id') required String spuId,
    @JsonKey(name: 'name') @Default('') String name,
    required int price,
    required int stock,
    List<SkuAttribute>? attributes,
    @JsonKey(name: 'package_details') PackageDetails? packageDetails,
  }) = _CartSku;

  factory CartSku.fromJson(Map<String, dynamic> json) =>
      _$CartSkuFromJson(json);
}

@freezed
abstract class CartItem with _$CartItem {
  const factory CartItem({
    required String id,
    @JsonKey(name: 'listing_id') required String listingId,
    @JsonKey(name: 'variant_id') required String variantId,
    required int quantity,
    @JsonKey(name: 'created_at') String? createdAt,
    // Optional populated / UI display helper fields:
    @JsonKey(name: 'spu_id') String? spuId,
    CartSku? sku,
    ResourceModel? resource,
    @Default('VND') String currency,
  }) = _CartItem;

  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);
}

@freezed
abstract class AddCartItemRequest with _$AddCartItemRequest {
  const factory AddCartItemRequest({
    @JsonKey(name: 'variant_id') required String variantId,
    required int quantity,
  }) = _AddCartItemRequest;

  factory AddCartItemRequest.fromJson(Map<String, dynamic> json) =>
      _$AddCartItemRequestFromJson(json);
}

@freezed
abstract class UpdateCartItemRequest with _$UpdateCartItemRequest {
  const factory UpdateCartItemRequest({required int quantity}) =
      _UpdateCartItemRequest;

  factory UpdateCartItemRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateCartItemRequestFromJson(json);
}
