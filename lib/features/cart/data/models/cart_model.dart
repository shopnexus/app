import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../shared/models/resource_model.dart';
import '../../../catalog/data/models/catalog_model.dart';

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
    @JsonKey(name: 'spu_id') required String spuId,
    required CartSku sku,
    required int quantity,
    ResourceModel? resource,
    required String currency,
  }) = _CartItem;

  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);
}

@freezed
abstract class UpdateCartRequest with _$UpdateCartRequest {
  const factory UpdateCartRequest({
    @JsonKey(name: 'sku_id') required String skuId,
    int? quantity,
    @JsonKey(name: 'delta_quantity') int? deltaQuantity,
  }) = _UpdateCartRequest;

  factory UpdateCartRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateCartRequestFromJson(json);
}
