// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PackageDetails _$PackageDetailsFromJson(Map<String, dynamic> json) =>
    _PackageDetails(
      weightGrams: (json['weight_grams'] as num).toInt(),
      lengthCm: (json['length_cm'] as num).toInt(),
      widthCm: (json['width_cm'] as num).toInt(),
      heightCm: (json['height_cm'] as num).toInt(),
    );

Map<String, dynamic> _$PackageDetailsToJson(_PackageDetails instance) =>
    <String, dynamic>{
      'weight_grams': instance.weightGrams,
      'length_cm': instance.lengthCm,
      'width_cm': instance.widthCm,
      'height_cm': instance.heightCm,
    };

_CartSku _$CartSkuFromJson(Map<String, dynamic> json) => _CartSku(
  id: json['id'] as String,
  spuId: json['spu_id'] as String,
  name: json['name'] as String? ?? '',
  price: (json['price'] as num).toInt(),
  stock: (json['stock'] as num).toInt(),
  attributes: (json['attributes'] as List<dynamic>?)
      ?.map((e) => SkuAttribute.fromJson(e as Map<String, dynamic>))
      .toList(),
  packageDetails: json['package_details'] == null
      ? null
      : PackageDetails.fromJson(
          json['package_details'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$CartSkuToJson(_CartSku instance) => <String, dynamic>{
  'id': instance.id,
  'spu_id': instance.spuId,
  'name': instance.name,
  'price': instance.price,
  'stock': instance.stock,
  'attributes': instance.attributes,
  'package_details': instance.packageDetails,
};

_CartItem _$CartItemFromJson(Map<String, dynamic> json) => _CartItem(
  spuId: json['spu_id'] as String,
  sku: CartSku.fromJson(json['sku'] as Map<String, dynamic>),
  quantity: (json['quantity'] as num).toInt(),
  resource: json['resource'] == null
      ? null
      : ResourceModel.fromJson(json['resource'] as Map<String, dynamic>),
  currency: json['currency'] as String,
);

Map<String, dynamic> _$CartItemToJson(_CartItem instance) => <String, dynamic>{
  'spu_id': instance.spuId,
  'sku': instance.sku,
  'quantity': instance.quantity,
  'resource': instance.resource,
  'currency': instance.currency,
};

_UpdateCartRequest _$UpdateCartRequestFromJson(Map<String, dynamic> json) =>
    _UpdateCartRequest(
      skuId: json['sku_id'] as String,
      quantity: (json['quantity'] as num?)?.toInt(),
      deltaQuantity: (json['delta_quantity'] as num?)?.toInt(),
    );

Map<String, dynamic> _$UpdateCartRequestToJson(_UpdateCartRequest instance) =>
    <String, dynamic>{
      'sku_id': instance.skuId,
      'quantity': instance.quantity,
      'delta_quantity': instance.deltaQuantity,
    };
