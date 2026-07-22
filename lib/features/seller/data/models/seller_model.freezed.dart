// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seller_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SalesChartPoint {

 String get label; double get value;@JsonKey(name: 'orders_count') int? get ordersCount;
/// Create a copy of SalesChartPoint
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SalesChartPointCopyWith<SalesChartPoint> get copyWith => _$SalesChartPointCopyWithImpl<SalesChartPoint>(this as SalesChartPoint, _$identity);

  /// Serializes this SalesChartPoint to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SalesChartPoint&&(identical(other.label, label) || other.label == label)&&(identical(other.value, value) || other.value == value)&&(identical(other.ordersCount, ordersCount) || other.ordersCount == ordersCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,label,value,ordersCount);

@override
String toString() {
  return 'SalesChartPoint(label: $label, value: $value, ordersCount: $ordersCount)';
}


}

/// @nodoc
abstract mixin class $SalesChartPointCopyWith<$Res>  {
  factory $SalesChartPointCopyWith(SalesChartPoint value, $Res Function(SalesChartPoint) _then) = _$SalesChartPointCopyWithImpl;
@useResult
$Res call({
 String label, double value,@JsonKey(name: 'orders_count') int? ordersCount
});




}
/// @nodoc
class _$SalesChartPointCopyWithImpl<$Res>
    implements $SalesChartPointCopyWith<$Res> {
  _$SalesChartPointCopyWithImpl(this._self, this._then);

  final SalesChartPoint _self;
  final $Res Function(SalesChartPoint) _then;

/// Create a copy of SalesChartPoint
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? label = null,Object? value = null,Object? ordersCount = freezed,}) {
  return _then(_self.copyWith(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double,ordersCount: freezed == ordersCount ? _self.ordersCount : ordersCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [SalesChartPoint].
extension SalesChartPointPatterns on SalesChartPoint {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SalesChartPoint value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SalesChartPoint() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SalesChartPoint value)  $default,){
final _that = this;
switch (_that) {
case _SalesChartPoint():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SalesChartPoint value)?  $default,){
final _that = this;
switch (_that) {
case _SalesChartPoint() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String label,  double value, @JsonKey(name: 'orders_count')  int? ordersCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SalesChartPoint() when $default != null:
return $default(_that.label,_that.value,_that.ordersCount);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String label,  double value, @JsonKey(name: 'orders_count')  int? ordersCount)  $default,) {final _that = this;
switch (_that) {
case _SalesChartPoint():
return $default(_that.label,_that.value,_that.ordersCount);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String label,  double value, @JsonKey(name: 'orders_count')  int? ordersCount)?  $default,) {final _that = this;
switch (_that) {
case _SalesChartPoint() when $default != null:
return $default(_that.label,_that.value,_that.ordersCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SalesChartPoint implements SalesChartPoint {
  const _SalesChartPoint({required this.label, required this.value, @JsonKey(name: 'orders_count') this.ordersCount});
  factory _SalesChartPoint.fromJson(Map<String, dynamic> json) => _$SalesChartPointFromJson(json);

@override final  String label;
@override final  double value;
@override@JsonKey(name: 'orders_count') final  int? ordersCount;

/// Create a copy of SalesChartPoint
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SalesChartPointCopyWith<_SalesChartPoint> get copyWith => __$SalesChartPointCopyWithImpl<_SalesChartPoint>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SalesChartPointToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SalesChartPoint&&(identical(other.label, label) || other.label == label)&&(identical(other.value, value) || other.value == value)&&(identical(other.ordersCount, ordersCount) || other.ordersCount == ordersCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,label,value,ordersCount);

@override
String toString() {
  return 'SalesChartPoint(label: $label, value: $value, ordersCount: $ordersCount)';
}


}

/// @nodoc
abstract mixin class _$SalesChartPointCopyWith<$Res> implements $SalesChartPointCopyWith<$Res> {
  factory _$SalesChartPointCopyWith(_SalesChartPoint value, $Res Function(_SalesChartPoint) _then) = __$SalesChartPointCopyWithImpl;
@override @useResult
$Res call({
 String label, double value,@JsonKey(name: 'orders_count') int? ordersCount
});




}
/// @nodoc
class __$SalesChartPointCopyWithImpl<$Res>
    implements _$SalesChartPointCopyWith<$Res> {
  __$SalesChartPointCopyWithImpl(this._self, this._then);

  final _SalesChartPoint _self;
  final $Res Function(_SalesChartPoint) _then;

/// Create a copy of SalesChartPoint
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? label = null,Object? value = null,Object? ordersCount = freezed,}) {
  return _then(_SalesChartPoint(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double,ordersCount: freezed == ordersCount ? _self.ordersCount : ordersCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$SellerStats {

@JsonKey(name: 'total_revenue') int get totalRevenue;@JsonKey(name: 'total_orders') int get totalOrders;@JsonKey(name: 'items_sold') int get itemsSold;@JsonKey(name: 'rating_score') double get ratingScore;@JsonKey(name: 'pending_orders') int get pendingOrders;@JsonKey(name: 'shipping_orders') int get shippingOrders;@JsonKey(name: 'completed_orders') int get completedOrders;@JsonKey(name: 'disputing_orders') int get disputingOrders;@JsonKey(name: 'active_products') int get activeProducts;@JsonKey(name: 'inactive_products') int get inactiveProducts;@JsonKey(name: 'violated_products') int get violatedProducts;@JsonKey(name: 'chart_data') List<SalesChartPoint>? get chartData;
/// Create a copy of SellerStats
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SellerStatsCopyWith<SellerStats> get copyWith => _$SellerStatsCopyWithImpl<SellerStats>(this as SellerStats, _$identity);

  /// Serializes this SellerStats to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SellerStats&&(identical(other.totalRevenue, totalRevenue) || other.totalRevenue == totalRevenue)&&(identical(other.totalOrders, totalOrders) || other.totalOrders == totalOrders)&&(identical(other.itemsSold, itemsSold) || other.itemsSold == itemsSold)&&(identical(other.ratingScore, ratingScore) || other.ratingScore == ratingScore)&&(identical(other.pendingOrders, pendingOrders) || other.pendingOrders == pendingOrders)&&(identical(other.shippingOrders, shippingOrders) || other.shippingOrders == shippingOrders)&&(identical(other.completedOrders, completedOrders) || other.completedOrders == completedOrders)&&(identical(other.disputingOrders, disputingOrders) || other.disputingOrders == disputingOrders)&&(identical(other.activeProducts, activeProducts) || other.activeProducts == activeProducts)&&(identical(other.inactiveProducts, inactiveProducts) || other.inactiveProducts == inactiveProducts)&&(identical(other.violatedProducts, violatedProducts) || other.violatedProducts == violatedProducts)&&const DeepCollectionEquality().equals(other.chartData, chartData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalRevenue,totalOrders,itemsSold,ratingScore,pendingOrders,shippingOrders,completedOrders,disputingOrders,activeProducts,inactiveProducts,violatedProducts,const DeepCollectionEquality().hash(chartData));

@override
String toString() {
  return 'SellerStats(totalRevenue: $totalRevenue, totalOrders: $totalOrders, itemsSold: $itemsSold, ratingScore: $ratingScore, pendingOrders: $pendingOrders, shippingOrders: $shippingOrders, completedOrders: $completedOrders, disputingOrders: $disputingOrders, activeProducts: $activeProducts, inactiveProducts: $inactiveProducts, violatedProducts: $violatedProducts, chartData: $chartData)';
}


}

/// @nodoc
abstract mixin class $SellerStatsCopyWith<$Res>  {
  factory $SellerStatsCopyWith(SellerStats value, $Res Function(SellerStats) _then) = _$SellerStatsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'total_revenue') int totalRevenue,@JsonKey(name: 'total_orders') int totalOrders,@JsonKey(name: 'items_sold') int itemsSold,@JsonKey(name: 'rating_score') double ratingScore,@JsonKey(name: 'pending_orders') int pendingOrders,@JsonKey(name: 'shipping_orders') int shippingOrders,@JsonKey(name: 'completed_orders') int completedOrders,@JsonKey(name: 'disputing_orders') int disputingOrders,@JsonKey(name: 'active_products') int activeProducts,@JsonKey(name: 'inactive_products') int inactiveProducts,@JsonKey(name: 'violated_products') int violatedProducts,@JsonKey(name: 'chart_data') List<SalesChartPoint>? chartData
});




}
/// @nodoc
class _$SellerStatsCopyWithImpl<$Res>
    implements $SellerStatsCopyWith<$Res> {
  _$SellerStatsCopyWithImpl(this._self, this._then);

  final SellerStats _self;
  final $Res Function(SellerStats) _then;

/// Create a copy of SellerStats
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalRevenue = null,Object? totalOrders = null,Object? itemsSold = null,Object? ratingScore = null,Object? pendingOrders = null,Object? shippingOrders = null,Object? completedOrders = null,Object? disputingOrders = null,Object? activeProducts = null,Object? inactiveProducts = null,Object? violatedProducts = null,Object? chartData = freezed,}) {
  return _then(_self.copyWith(
totalRevenue: null == totalRevenue ? _self.totalRevenue : totalRevenue // ignore: cast_nullable_to_non_nullable
as int,totalOrders: null == totalOrders ? _self.totalOrders : totalOrders // ignore: cast_nullable_to_non_nullable
as int,itemsSold: null == itemsSold ? _self.itemsSold : itemsSold // ignore: cast_nullable_to_non_nullable
as int,ratingScore: null == ratingScore ? _self.ratingScore : ratingScore // ignore: cast_nullable_to_non_nullable
as double,pendingOrders: null == pendingOrders ? _self.pendingOrders : pendingOrders // ignore: cast_nullable_to_non_nullable
as int,shippingOrders: null == shippingOrders ? _self.shippingOrders : shippingOrders // ignore: cast_nullable_to_non_nullable
as int,completedOrders: null == completedOrders ? _self.completedOrders : completedOrders // ignore: cast_nullable_to_non_nullable
as int,disputingOrders: null == disputingOrders ? _self.disputingOrders : disputingOrders // ignore: cast_nullable_to_non_nullable
as int,activeProducts: null == activeProducts ? _self.activeProducts : activeProducts // ignore: cast_nullable_to_non_nullable
as int,inactiveProducts: null == inactiveProducts ? _self.inactiveProducts : inactiveProducts // ignore: cast_nullable_to_non_nullable
as int,violatedProducts: null == violatedProducts ? _self.violatedProducts : violatedProducts // ignore: cast_nullable_to_non_nullable
as int,chartData: freezed == chartData ? _self.chartData : chartData // ignore: cast_nullable_to_non_nullable
as List<SalesChartPoint>?,
  ));
}

}


/// Adds pattern-matching-related methods to [SellerStats].
extension SellerStatsPatterns on SellerStats {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SellerStats value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SellerStats() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SellerStats value)  $default,){
final _that = this;
switch (_that) {
case _SellerStats():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SellerStats value)?  $default,){
final _that = this;
switch (_that) {
case _SellerStats() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'total_revenue')  int totalRevenue, @JsonKey(name: 'total_orders')  int totalOrders, @JsonKey(name: 'items_sold')  int itemsSold, @JsonKey(name: 'rating_score')  double ratingScore, @JsonKey(name: 'pending_orders')  int pendingOrders, @JsonKey(name: 'shipping_orders')  int shippingOrders, @JsonKey(name: 'completed_orders')  int completedOrders, @JsonKey(name: 'disputing_orders')  int disputingOrders, @JsonKey(name: 'active_products')  int activeProducts, @JsonKey(name: 'inactive_products')  int inactiveProducts, @JsonKey(name: 'violated_products')  int violatedProducts, @JsonKey(name: 'chart_data')  List<SalesChartPoint>? chartData)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SellerStats() when $default != null:
return $default(_that.totalRevenue,_that.totalOrders,_that.itemsSold,_that.ratingScore,_that.pendingOrders,_that.shippingOrders,_that.completedOrders,_that.disputingOrders,_that.activeProducts,_that.inactiveProducts,_that.violatedProducts,_that.chartData);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'total_revenue')  int totalRevenue, @JsonKey(name: 'total_orders')  int totalOrders, @JsonKey(name: 'items_sold')  int itemsSold, @JsonKey(name: 'rating_score')  double ratingScore, @JsonKey(name: 'pending_orders')  int pendingOrders, @JsonKey(name: 'shipping_orders')  int shippingOrders, @JsonKey(name: 'completed_orders')  int completedOrders, @JsonKey(name: 'disputing_orders')  int disputingOrders, @JsonKey(name: 'active_products')  int activeProducts, @JsonKey(name: 'inactive_products')  int inactiveProducts, @JsonKey(name: 'violated_products')  int violatedProducts, @JsonKey(name: 'chart_data')  List<SalesChartPoint>? chartData)  $default,) {final _that = this;
switch (_that) {
case _SellerStats():
return $default(_that.totalRevenue,_that.totalOrders,_that.itemsSold,_that.ratingScore,_that.pendingOrders,_that.shippingOrders,_that.completedOrders,_that.disputingOrders,_that.activeProducts,_that.inactiveProducts,_that.violatedProducts,_that.chartData);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'total_revenue')  int totalRevenue, @JsonKey(name: 'total_orders')  int totalOrders, @JsonKey(name: 'items_sold')  int itemsSold, @JsonKey(name: 'rating_score')  double ratingScore, @JsonKey(name: 'pending_orders')  int pendingOrders, @JsonKey(name: 'shipping_orders')  int shippingOrders, @JsonKey(name: 'completed_orders')  int completedOrders, @JsonKey(name: 'disputing_orders')  int disputingOrders, @JsonKey(name: 'active_products')  int activeProducts, @JsonKey(name: 'inactive_products')  int inactiveProducts, @JsonKey(name: 'violated_products')  int violatedProducts, @JsonKey(name: 'chart_data')  List<SalesChartPoint>? chartData)?  $default,) {final _that = this;
switch (_that) {
case _SellerStats() when $default != null:
return $default(_that.totalRevenue,_that.totalOrders,_that.itemsSold,_that.ratingScore,_that.pendingOrders,_that.shippingOrders,_that.completedOrders,_that.disputingOrders,_that.activeProducts,_that.inactiveProducts,_that.violatedProducts,_that.chartData);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SellerStats extends SellerStats {
  const _SellerStats({@JsonKey(name: 'total_revenue') this.totalRevenue = 0, @JsonKey(name: 'total_orders') this.totalOrders = 0, @JsonKey(name: 'items_sold') this.itemsSold = 0, @JsonKey(name: 'rating_score') this.ratingScore = 0.0, @JsonKey(name: 'pending_orders') this.pendingOrders = 0, @JsonKey(name: 'shipping_orders') this.shippingOrders = 0, @JsonKey(name: 'completed_orders') this.completedOrders = 0, @JsonKey(name: 'disputing_orders') this.disputingOrders = 0, @JsonKey(name: 'active_products') this.activeProducts = 0, @JsonKey(name: 'inactive_products') this.inactiveProducts = 0, @JsonKey(name: 'violated_products') this.violatedProducts = 0, @JsonKey(name: 'chart_data') final  List<SalesChartPoint>? chartData}): _chartData = chartData,super._();
  factory _SellerStats.fromJson(Map<String, dynamic> json) => _$SellerStatsFromJson(json);

@override@JsonKey(name: 'total_revenue') final  int totalRevenue;
@override@JsonKey(name: 'total_orders') final  int totalOrders;
@override@JsonKey(name: 'items_sold') final  int itemsSold;
@override@JsonKey(name: 'rating_score') final  double ratingScore;
@override@JsonKey(name: 'pending_orders') final  int pendingOrders;
@override@JsonKey(name: 'shipping_orders') final  int shippingOrders;
@override@JsonKey(name: 'completed_orders') final  int completedOrders;
@override@JsonKey(name: 'disputing_orders') final  int disputingOrders;
@override@JsonKey(name: 'active_products') final  int activeProducts;
@override@JsonKey(name: 'inactive_products') final  int inactiveProducts;
@override@JsonKey(name: 'violated_products') final  int violatedProducts;
 final  List<SalesChartPoint>? _chartData;
@override@JsonKey(name: 'chart_data') List<SalesChartPoint>? get chartData {
  final value = _chartData;
  if (value == null) return null;
  if (_chartData is EqualUnmodifiableListView) return _chartData;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of SellerStats
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SellerStatsCopyWith<_SellerStats> get copyWith => __$SellerStatsCopyWithImpl<_SellerStats>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SellerStatsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SellerStats&&(identical(other.totalRevenue, totalRevenue) || other.totalRevenue == totalRevenue)&&(identical(other.totalOrders, totalOrders) || other.totalOrders == totalOrders)&&(identical(other.itemsSold, itemsSold) || other.itemsSold == itemsSold)&&(identical(other.ratingScore, ratingScore) || other.ratingScore == ratingScore)&&(identical(other.pendingOrders, pendingOrders) || other.pendingOrders == pendingOrders)&&(identical(other.shippingOrders, shippingOrders) || other.shippingOrders == shippingOrders)&&(identical(other.completedOrders, completedOrders) || other.completedOrders == completedOrders)&&(identical(other.disputingOrders, disputingOrders) || other.disputingOrders == disputingOrders)&&(identical(other.activeProducts, activeProducts) || other.activeProducts == activeProducts)&&(identical(other.inactiveProducts, inactiveProducts) || other.inactiveProducts == inactiveProducts)&&(identical(other.violatedProducts, violatedProducts) || other.violatedProducts == violatedProducts)&&const DeepCollectionEquality().equals(other._chartData, _chartData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalRevenue,totalOrders,itemsSold,ratingScore,pendingOrders,shippingOrders,completedOrders,disputingOrders,activeProducts,inactiveProducts,violatedProducts,const DeepCollectionEquality().hash(_chartData));

@override
String toString() {
  return 'SellerStats(totalRevenue: $totalRevenue, totalOrders: $totalOrders, itemsSold: $itemsSold, ratingScore: $ratingScore, pendingOrders: $pendingOrders, shippingOrders: $shippingOrders, completedOrders: $completedOrders, disputingOrders: $disputingOrders, activeProducts: $activeProducts, inactiveProducts: $inactiveProducts, violatedProducts: $violatedProducts, chartData: $chartData)';
}


}

/// @nodoc
abstract mixin class _$SellerStatsCopyWith<$Res> implements $SellerStatsCopyWith<$Res> {
  factory _$SellerStatsCopyWith(_SellerStats value, $Res Function(_SellerStats) _then) = __$SellerStatsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'total_revenue') int totalRevenue,@JsonKey(name: 'total_orders') int totalOrders,@JsonKey(name: 'items_sold') int itemsSold,@JsonKey(name: 'rating_score') double ratingScore,@JsonKey(name: 'pending_orders') int pendingOrders,@JsonKey(name: 'shipping_orders') int shippingOrders,@JsonKey(name: 'completed_orders') int completedOrders,@JsonKey(name: 'disputing_orders') int disputingOrders,@JsonKey(name: 'active_products') int activeProducts,@JsonKey(name: 'inactive_products') int inactiveProducts,@JsonKey(name: 'violated_products') int violatedProducts,@JsonKey(name: 'chart_data') List<SalesChartPoint>? chartData
});




}
/// @nodoc
class __$SellerStatsCopyWithImpl<$Res>
    implements _$SellerStatsCopyWith<$Res> {
  __$SellerStatsCopyWithImpl(this._self, this._then);

  final _SellerStats _self;
  final $Res Function(_SellerStats) _then;

/// Create a copy of SellerStats
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalRevenue = null,Object? totalOrders = null,Object? itemsSold = null,Object? ratingScore = null,Object? pendingOrders = null,Object? shippingOrders = null,Object? completedOrders = null,Object? disputingOrders = null,Object? activeProducts = null,Object? inactiveProducts = null,Object? violatedProducts = null,Object? chartData = freezed,}) {
  return _then(_SellerStats(
totalRevenue: null == totalRevenue ? _self.totalRevenue : totalRevenue // ignore: cast_nullable_to_non_nullable
as int,totalOrders: null == totalOrders ? _self.totalOrders : totalOrders // ignore: cast_nullable_to_non_nullable
as int,itemsSold: null == itemsSold ? _self.itemsSold : itemsSold // ignore: cast_nullable_to_non_nullable
as int,ratingScore: null == ratingScore ? _self.ratingScore : ratingScore // ignore: cast_nullable_to_non_nullable
as double,pendingOrders: null == pendingOrders ? _self.pendingOrders : pendingOrders // ignore: cast_nullable_to_non_nullable
as int,shippingOrders: null == shippingOrders ? _self.shippingOrders : shippingOrders // ignore: cast_nullable_to_non_nullable
as int,completedOrders: null == completedOrders ? _self.completedOrders : completedOrders // ignore: cast_nullable_to_non_nullable
as int,disputingOrders: null == disputingOrders ? _self.disputingOrders : disputingOrders // ignore: cast_nullable_to_non_nullable
as int,activeProducts: null == activeProducts ? _self.activeProducts : activeProducts // ignore: cast_nullable_to_non_nullable
as int,inactiveProducts: null == inactiveProducts ? _self.inactiveProducts : inactiveProducts // ignore: cast_nullable_to_non_nullable
as int,violatedProducts: null == violatedProducts ? _self.violatedProducts : violatedProducts // ignore: cast_nullable_to_non_nullable
as int,chartData: freezed == chartData ? _self._chartData : chartData // ignore: cast_nullable_to_non_nullable
as List<SalesChartPoint>?,
  ));
}


}


/// @nodoc
mixin _$ProductSpuRequest {

 String get name; String? get slug; String? get description;@JsonKey(name: 'category_id') String? get categoryId; List<String>? get tags; List<ProductSpecification>? get specifications;@JsonKey(name: 'resource_ids') List<String>? get resourceIds; String? get status;
/// Create a copy of ProductSpuRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductSpuRequestCopyWith<ProductSpuRequest> get copyWith => _$ProductSpuRequestCopyWithImpl<ProductSpuRequest>(this as ProductSpuRequest, _$identity);

  /// Serializes this ProductSpuRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductSpuRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.description, description) || other.description == description)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&const DeepCollectionEquality().equals(other.tags, tags)&&const DeepCollectionEquality().equals(other.specifications, specifications)&&const DeepCollectionEquality().equals(other.resourceIds, resourceIds)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,slug,description,categoryId,const DeepCollectionEquality().hash(tags),const DeepCollectionEquality().hash(specifications),const DeepCollectionEquality().hash(resourceIds),status);

@override
String toString() {
  return 'ProductSpuRequest(name: $name, slug: $slug, description: $description, categoryId: $categoryId, tags: $tags, specifications: $specifications, resourceIds: $resourceIds, status: $status)';
}


}

/// @nodoc
abstract mixin class $ProductSpuRequestCopyWith<$Res>  {
  factory $ProductSpuRequestCopyWith(ProductSpuRequest value, $Res Function(ProductSpuRequest) _then) = _$ProductSpuRequestCopyWithImpl;
@useResult
$Res call({
 String name, String? slug, String? description,@JsonKey(name: 'category_id') String? categoryId, List<String>? tags, List<ProductSpecification>? specifications,@JsonKey(name: 'resource_ids') List<String>? resourceIds, String? status
});




}
/// @nodoc
class _$ProductSpuRequestCopyWithImpl<$Res>
    implements $ProductSpuRequestCopyWith<$Res> {
  _$ProductSpuRequestCopyWithImpl(this._self, this._then);

  final ProductSpuRequest _self;
  final $Res Function(ProductSpuRequest) _then;

/// Create a copy of ProductSpuRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? slug = freezed,Object? description = freezed,Object? categoryId = freezed,Object? tags = freezed,Object? specifications = freezed,Object? resourceIds = freezed,Object? status = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,tags: freezed == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>?,specifications: freezed == specifications ? _self.specifications : specifications // ignore: cast_nullable_to_non_nullable
as List<ProductSpecification>?,resourceIds: freezed == resourceIds ? _self.resourceIds : resourceIds // ignore: cast_nullable_to_non_nullable
as List<String>?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductSpuRequest].
extension ProductSpuRequestPatterns on ProductSpuRequest {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductSpuRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductSpuRequest() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductSpuRequest value)  $default,){
final _that = this;
switch (_that) {
case _ProductSpuRequest():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductSpuRequest value)?  $default,){
final _that = this;
switch (_that) {
case _ProductSpuRequest() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String? slug,  String? description, @JsonKey(name: 'category_id')  String? categoryId,  List<String>? tags,  List<ProductSpecification>? specifications, @JsonKey(name: 'resource_ids')  List<String>? resourceIds,  String? status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductSpuRequest() when $default != null:
return $default(_that.name,_that.slug,_that.description,_that.categoryId,_that.tags,_that.specifications,_that.resourceIds,_that.status);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String? slug,  String? description, @JsonKey(name: 'category_id')  String? categoryId,  List<String>? tags,  List<ProductSpecification>? specifications, @JsonKey(name: 'resource_ids')  List<String>? resourceIds,  String? status)  $default,) {final _that = this;
switch (_that) {
case _ProductSpuRequest():
return $default(_that.name,_that.slug,_that.description,_that.categoryId,_that.tags,_that.specifications,_that.resourceIds,_that.status);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String? slug,  String? description, @JsonKey(name: 'category_id')  String? categoryId,  List<String>? tags,  List<ProductSpecification>? specifications, @JsonKey(name: 'resource_ids')  List<String>? resourceIds,  String? status)?  $default,) {final _that = this;
switch (_that) {
case _ProductSpuRequest() when $default != null:
return $default(_that.name,_that.slug,_that.description,_that.categoryId,_that.tags,_that.specifications,_that.resourceIds,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductSpuRequest implements ProductSpuRequest {
  const _ProductSpuRequest({required this.name, this.slug, this.description, @JsonKey(name: 'category_id') this.categoryId, final  List<String>? tags, final  List<ProductSpecification>? specifications, @JsonKey(name: 'resource_ids') final  List<String>? resourceIds, this.status}): _tags = tags,_specifications = specifications,_resourceIds = resourceIds;
  factory _ProductSpuRequest.fromJson(Map<String, dynamic> json) => _$ProductSpuRequestFromJson(json);

@override final  String name;
@override final  String? slug;
@override final  String? description;
@override@JsonKey(name: 'category_id') final  String? categoryId;
 final  List<String>? _tags;
@override List<String>? get tags {
  final value = _tags;
  if (value == null) return null;
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<ProductSpecification>? _specifications;
@override List<ProductSpecification>? get specifications {
  final value = _specifications;
  if (value == null) return null;
  if (_specifications is EqualUnmodifiableListView) return _specifications;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _resourceIds;
@override@JsonKey(name: 'resource_ids') List<String>? get resourceIds {
  final value = _resourceIds;
  if (value == null) return null;
  if (_resourceIds is EqualUnmodifiableListView) return _resourceIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? status;

/// Create a copy of ProductSpuRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductSpuRequestCopyWith<_ProductSpuRequest> get copyWith => __$ProductSpuRequestCopyWithImpl<_ProductSpuRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductSpuRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductSpuRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.description, description) || other.description == description)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&const DeepCollectionEquality().equals(other._tags, _tags)&&const DeepCollectionEquality().equals(other._specifications, _specifications)&&const DeepCollectionEquality().equals(other._resourceIds, _resourceIds)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,slug,description,categoryId,const DeepCollectionEquality().hash(_tags),const DeepCollectionEquality().hash(_specifications),const DeepCollectionEquality().hash(_resourceIds),status);

@override
String toString() {
  return 'ProductSpuRequest(name: $name, slug: $slug, description: $description, categoryId: $categoryId, tags: $tags, specifications: $specifications, resourceIds: $resourceIds, status: $status)';
}


}

/// @nodoc
abstract mixin class _$ProductSpuRequestCopyWith<$Res> implements $ProductSpuRequestCopyWith<$Res> {
  factory _$ProductSpuRequestCopyWith(_ProductSpuRequest value, $Res Function(_ProductSpuRequest) _then) = __$ProductSpuRequestCopyWithImpl;
@override @useResult
$Res call({
 String name, String? slug, String? description,@JsonKey(name: 'category_id') String? categoryId, List<String>? tags, List<ProductSpecification>? specifications,@JsonKey(name: 'resource_ids') List<String>? resourceIds, String? status
});




}
/// @nodoc
class __$ProductSpuRequestCopyWithImpl<$Res>
    implements _$ProductSpuRequestCopyWith<$Res> {
  __$ProductSpuRequestCopyWithImpl(this._self, this._then);

  final _ProductSpuRequest _self;
  final $Res Function(_ProductSpuRequest) _then;

/// Create a copy of ProductSpuRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? slug = freezed,Object? description = freezed,Object? categoryId = freezed,Object? tags = freezed,Object? specifications = freezed,Object? resourceIds = freezed,Object? status = freezed,}) {
  return _then(_ProductSpuRequest(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,tags: freezed == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>?,specifications: freezed == specifications ? _self._specifications : specifications // ignore: cast_nullable_to_non_nullable
as List<ProductSpecification>?,resourceIds: freezed == resourceIds ? _self._resourceIds : resourceIds // ignore: cast_nullable_to_non_nullable
as List<String>?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ProductSkuRequest {

@JsonKey(name: 'spu_id') String? get spuId; String? get name; int get price;@JsonKey(name: 'original_price') int? get originalPrice; int get stock; double? get weight; List<SkuAttribute>? get attributes;@JsonKey(name: 'resource_ids') List<String>? get resourceIds; String? get status;
/// Create a copy of ProductSkuRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductSkuRequestCopyWith<ProductSkuRequest> get copyWith => _$ProductSkuRequestCopyWithImpl<ProductSkuRequest>(this as ProductSkuRequest, _$identity);

  /// Serializes this ProductSkuRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductSkuRequest&&(identical(other.spuId, spuId) || other.spuId == spuId)&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price)&&(identical(other.originalPrice, originalPrice) || other.originalPrice == originalPrice)&&(identical(other.stock, stock) || other.stock == stock)&&(identical(other.weight, weight) || other.weight == weight)&&const DeepCollectionEquality().equals(other.attributes, attributes)&&const DeepCollectionEquality().equals(other.resourceIds, resourceIds)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,spuId,name,price,originalPrice,stock,weight,const DeepCollectionEquality().hash(attributes),const DeepCollectionEquality().hash(resourceIds),status);

@override
String toString() {
  return 'ProductSkuRequest(spuId: $spuId, name: $name, price: $price, originalPrice: $originalPrice, stock: $stock, weight: $weight, attributes: $attributes, resourceIds: $resourceIds, status: $status)';
}


}

/// @nodoc
abstract mixin class $ProductSkuRequestCopyWith<$Res>  {
  factory $ProductSkuRequestCopyWith(ProductSkuRequest value, $Res Function(ProductSkuRequest) _then) = _$ProductSkuRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'spu_id') String? spuId, String? name, int price,@JsonKey(name: 'original_price') int? originalPrice, int stock, double? weight, List<SkuAttribute>? attributes,@JsonKey(name: 'resource_ids') List<String>? resourceIds, String? status
});




}
/// @nodoc
class _$ProductSkuRequestCopyWithImpl<$Res>
    implements $ProductSkuRequestCopyWith<$Res> {
  _$ProductSkuRequestCopyWithImpl(this._self, this._then);

  final ProductSkuRequest _self;
  final $Res Function(ProductSkuRequest) _then;

/// Create a copy of ProductSkuRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? spuId = freezed,Object? name = freezed,Object? price = null,Object? originalPrice = freezed,Object? stock = null,Object? weight = freezed,Object? attributes = freezed,Object? resourceIds = freezed,Object? status = freezed,}) {
  return _then(_self.copyWith(
spuId: freezed == spuId ? _self.spuId : spuId // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,originalPrice: freezed == originalPrice ? _self.originalPrice : originalPrice // ignore: cast_nullable_to_non_nullable
as int?,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int,weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double?,attributes: freezed == attributes ? _self.attributes : attributes // ignore: cast_nullable_to_non_nullable
as List<SkuAttribute>?,resourceIds: freezed == resourceIds ? _self.resourceIds : resourceIds // ignore: cast_nullable_to_non_nullable
as List<String>?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductSkuRequest].
extension ProductSkuRequestPatterns on ProductSkuRequest {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductSkuRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductSkuRequest() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductSkuRequest value)  $default,){
final _that = this;
switch (_that) {
case _ProductSkuRequest():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductSkuRequest value)?  $default,){
final _that = this;
switch (_that) {
case _ProductSkuRequest() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'spu_id')  String? spuId,  String? name,  int price, @JsonKey(name: 'original_price')  int? originalPrice,  int stock,  double? weight,  List<SkuAttribute>? attributes, @JsonKey(name: 'resource_ids')  List<String>? resourceIds,  String? status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductSkuRequest() when $default != null:
return $default(_that.spuId,_that.name,_that.price,_that.originalPrice,_that.stock,_that.weight,_that.attributes,_that.resourceIds,_that.status);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'spu_id')  String? spuId,  String? name,  int price, @JsonKey(name: 'original_price')  int? originalPrice,  int stock,  double? weight,  List<SkuAttribute>? attributes, @JsonKey(name: 'resource_ids')  List<String>? resourceIds,  String? status)  $default,) {final _that = this;
switch (_that) {
case _ProductSkuRequest():
return $default(_that.spuId,_that.name,_that.price,_that.originalPrice,_that.stock,_that.weight,_that.attributes,_that.resourceIds,_that.status);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'spu_id')  String? spuId,  String? name,  int price, @JsonKey(name: 'original_price')  int? originalPrice,  int stock,  double? weight,  List<SkuAttribute>? attributes, @JsonKey(name: 'resource_ids')  List<String>? resourceIds,  String? status)?  $default,) {final _that = this;
switch (_that) {
case _ProductSkuRequest() when $default != null:
return $default(_that.spuId,_that.name,_that.price,_that.originalPrice,_that.stock,_that.weight,_that.attributes,_that.resourceIds,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductSkuRequest extends ProductSkuRequest {
  const _ProductSkuRequest({@JsonKey(name: 'spu_id') this.spuId, this.name, required this.price, @JsonKey(name: 'original_price') this.originalPrice, required this.stock, this.weight, final  List<SkuAttribute>? attributes, @JsonKey(name: 'resource_ids') final  List<String>? resourceIds, this.status}): _attributes = attributes,_resourceIds = resourceIds,super._();
  factory _ProductSkuRequest.fromJson(Map<String, dynamic> json) => _$ProductSkuRequestFromJson(json);

@override@JsonKey(name: 'spu_id') final  String? spuId;
@override final  String? name;
@override final  int price;
@override@JsonKey(name: 'original_price') final  int? originalPrice;
@override final  int stock;
@override final  double? weight;
 final  List<SkuAttribute>? _attributes;
@override List<SkuAttribute>? get attributes {
  final value = _attributes;
  if (value == null) return null;
  if (_attributes is EqualUnmodifiableListView) return _attributes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _resourceIds;
@override@JsonKey(name: 'resource_ids') List<String>? get resourceIds {
  final value = _resourceIds;
  if (value == null) return null;
  if (_resourceIds is EqualUnmodifiableListView) return _resourceIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? status;

/// Create a copy of ProductSkuRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductSkuRequestCopyWith<_ProductSkuRequest> get copyWith => __$ProductSkuRequestCopyWithImpl<_ProductSkuRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductSkuRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductSkuRequest&&(identical(other.spuId, spuId) || other.spuId == spuId)&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price)&&(identical(other.originalPrice, originalPrice) || other.originalPrice == originalPrice)&&(identical(other.stock, stock) || other.stock == stock)&&(identical(other.weight, weight) || other.weight == weight)&&const DeepCollectionEquality().equals(other._attributes, _attributes)&&const DeepCollectionEquality().equals(other._resourceIds, _resourceIds)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,spuId,name,price,originalPrice,stock,weight,const DeepCollectionEquality().hash(_attributes),const DeepCollectionEquality().hash(_resourceIds),status);

@override
String toString() {
  return 'ProductSkuRequest(spuId: $spuId, name: $name, price: $price, originalPrice: $originalPrice, stock: $stock, weight: $weight, attributes: $attributes, resourceIds: $resourceIds, status: $status)';
}


}

/// @nodoc
abstract mixin class _$ProductSkuRequestCopyWith<$Res> implements $ProductSkuRequestCopyWith<$Res> {
  factory _$ProductSkuRequestCopyWith(_ProductSkuRequest value, $Res Function(_ProductSkuRequest) _then) = __$ProductSkuRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'spu_id') String? spuId, String? name, int price,@JsonKey(name: 'original_price') int? originalPrice, int stock, double? weight, List<SkuAttribute>? attributes,@JsonKey(name: 'resource_ids') List<String>? resourceIds, String? status
});




}
/// @nodoc
class __$ProductSkuRequestCopyWithImpl<$Res>
    implements _$ProductSkuRequestCopyWith<$Res> {
  __$ProductSkuRequestCopyWithImpl(this._self, this._then);

  final _ProductSkuRequest _self;
  final $Res Function(_ProductSkuRequest) _then;

/// Create a copy of ProductSkuRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? spuId = freezed,Object? name = freezed,Object? price = null,Object? originalPrice = freezed,Object? stock = null,Object? weight = freezed,Object? attributes = freezed,Object? resourceIds = freezed,Object? status = freezed,}) {
  return _then(_ProductSkuRequest(
spuId: freezed == spuId ? _self.spuId : spuId // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,originalPrice: freezed == originalPrice ? _self.originalPrice : originalPrice // ignore: cast_nullable_to_non_nullable
as int?,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int,weight: freezed == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double?,attributes: freezed == attributes ? _self._attributes : attributes // ignore: cast_nullable_to_non_nullable
as List<SkuAttribute>?,resourceIds: freezed == resourceIds ? _self._resourceIds : resourceIds // ignore: cast_nullable_to_non_nullable
as List<String>?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$SellerPendingItem {

 String get id;@JsonKey(name: 'order_id') String? get orderId;@JsonKey(name: 'buyer_id') String? get buyerId;@JsonKey(name: 'buyer_name') String? get buyerName;@JsonKey(name: 'spu_id') String? get spuId;@JsonKey(name: 'sku_id') String? get skuId;@JsonKey(name: 'product_name') String? get productName;@JsonKey(name: 'sku_name') String? get skuName; String? get thumbnail; int get quantity; int get price;@JsonKey(name: 'created_at') String? get createdAt; String? get status;
/// Create a copy of SellerPendingItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SellerPendingItemCopyWith<SellerPendingItem> get copyWith => _$SellerPendingItemCopyWithImpl<SellerPendingItem>(this as SellerPendingItem, _$identity);

  /// Serializes this SellerPendingItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SellerPendingItem&&(identical(other.id, id) || other.id == id)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.buyerId, buyerId) || other.buyerId == buyerId)&&(identical(other.buyerName, buyerName) || other.buyerName == buyerName)&&(identical(other.spuId, spuId) || other.spuId == spuId)&&(identical(other.skuId, skuId) || other.skuId == skuId)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.skuName, skuName) || other.skuName == skuName)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.price, price) || other.price == price)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,orderId,buyerId,buyerName,spuId,skuId,productName,skuName,thumbnail,quantity,price,createdAt,status);

@override
String toString() {
  return 'SellerPendingItem(id: $id, orderId: $orderId, buyerId: $buyerId, buyerName: $buyerName, spuId: $spuId, skuId: $skuId, productName: $productName, skuName: $skuName, thumbnail: $thumbnail, quantity: $quantity, price: $price, createdAt: $createdAt, status: $status)';
}


}

/// @nodoc
abstract mixin class $SellerPendingItemCopyWith<$Res>  {
  factory $SellerPendingItemCopyWith(SellerPendingItem value, $Res Function(SellerPendingItem) _then) = _$SellerPendingItemCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'order_id') String? orderId,@JsonKey(name: 'buyer_id') String? buyerId,@JsonKey(name: 'buyer_name') String? buyerName,@JsonKey(name: 'spu_id') String? spuId,@JsonKey(name: 'sku_id') String? skuId,@JsonKey(name: 'product_name') String? productName,@JsonKey(name: 'sku_name') String? skuName, String? thumbnail, int quantity, int price,@JsonKey(name: 'created_at') String? createdAt, String? status
});




}
/// @nodoc
class _$SellerPendingItemCopyWithImpl<$Res>
    implements $SellerPendingItemCopyWith<$Res> {
  _$SellerPendingItemCopyWithImpl(this._self, this._then);

  final SellerPendingItem _self;
  final $Res Function(SellerPendingItem) _then;

/// Create a copy of SellerPendingItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? orderId = freezed,Object? buyerId = freezed,Object? buyerName = freezed,Object? spuId = freezed,Object? skuId = freezed,Object? productName = freezed,Object? skuName = freezed,Object? thumbnail = freezed,Object? quantity = null,Object? price = null,Object? createdAt = freezed,Object? status = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,orderId: freezed == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String?,buyerId: freezed == buyerId ? _self.buyerId : buyerId // ignore: cast_nullable_to_non_nullable
as String?,buyerName: freezed == buyerName ? _self.buyerName : buyerName // ignore: cast_nullable_to_non_nullable
as String?,spuId: freezed == spuId ? _self.spuId : spuId // ignore: cast_nullable_to_non_nullable
as String?,skuId: freezed == skuId ? _self.skuId : skuId // ignore: cast_nullable_to_non_nullable
as String?,productName: freezed == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String?,skuName: freezed == skuName ? _self.skuName : skuName // ignore: cast_nullable_to_non_nullable
as String?,thumbnail: freezed == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String?,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SellerPendingItem].
extension SellerPendingItemPatterns on SellerPendingItem {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SellerPendingItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SellerPendingItem() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SellerPendingItem value)  $default,){
final _that = this;
switch (_that) {
case _SellerPendingItem():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SellerPendingItem value)?  $default,){
final _that = this;
switch (_that) {
case _SellerPendingItem() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'order_id')  String? orderId, @JsonKey(name: 'buyer_id')  String? buyerId, @JsonKey(name: 'buyer_name')  String? buyerName, @JsonKey(name: 'spu_id')  String? spuId, @JsonKey(name: 'sku_id')  String? skuId, @JsonKey(name: 'product_name')  String? productName, @JsonKey(name: 'sku_name')  String? skuName,  String? thumbnail,  int quantity,  int price, @JsonKey(name: 'created_at')  String? createdAt,  String? status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SellerPendingItem() when $default != null:
return $default(_that.id,_that.orderId,_that.buyerId,_that.buyerName,_that.spuId,_that.skuId,_that.productName,_that.skuName,_that.thumbnail,_that.quantity,_that.price,_that.createdAt,_that.status);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'order_id')  String? orderId, @JsonKey(name: 'buyer_id')  String? buyerId, @JsonKey(name: 'buyer_name')  String? buyerName, @JsonKey(name: 'spu_id')  String? spuId, @JsonKey(name: 'sku_id')  String? skuId, @JsonKey(name: 'product_name')  String? productName, @JsonKey(name: 'sku_name')  String? skuName,  String? thumbnail,  int quantity,  int price, @JsonKey(name: 'created_at')  String? createdAt,  String? status)  $default,) {final _that = this;
switch (_that) {
case _SellerPendingItem():
return $default(_that.id,_that.orderId,_that.buyerId,_that.buyerName,_that.spuId,_that.skuId,_that.productName,_that.skuName,_that.thumbnail,_that.quantity,_that.price,_that.createdAt,_that.status);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'order_id')  String? orderId, @JsonKey(name: 'buyer_id')  String? buyerId, @JsonKey(name: 'buyer_name')  String? buyerName, @JsonKey(name: 'spu_id')  String? spuId, @JsonKey(name: 'sku_id')  String? skuId, @JsonKey(name: 'product_name')  String? productName, @JsonKey(name: 'sku_name')  String? skuName,  String? thumbnail,  int quantity,  int price, @JsonKey(name: 'created_at')  String? createdAt,  String? status)?  $default,) {final _that = this;
switch (_that) {
case _SellerPendingItem() when $default != null:
return $default(_that.id,_that.orderId,_that.buyerId,_that.buyerName,_that.spuId,_that.skuId,_that.productName,_that.skuName,_that.thumbnail,_that.quantity,_that.price,_that.createdAt,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SellerPendingItem implements SellerPendingItem {
  const _SellerPendingItem({required this.id, @JsonKey(name: 'order_id') this.orderId, @JsonKey(name: 'buyer_id') this.buyerId, @JsonKey(name: 'buyer_name') this.buyerName, @JsonKey(name: 'spu_id') this.spuId, @JsonKey(name: 'sku_id') this.skuId, @JsonKey(name: 'product_name') this.productName, @JsonKey(name: 'sku_name') this.skuName, this.thumbnail, this.quantity = 1, this.price = 0, @JsonKey(name: 'created_at') this.createdAt, this.status});
  factory _SellerPendingItem.fromJson(Map<String, dynamic> json) => _$SellerPendingItemFromJson(json);

@override final  String id;
@override@JsonKey(name: 'order_id') final  String? orderId;
@override@JsonKey(name: 'buyer_id') final  String? buyerId;
@override@JsonKey(name: 'buyer_name') final  String? buyerName;
@override@JsonKey(name: 'spu_id') final  String? spuId;
@override@JsonKey(name: 'sku_id') final  String? skuId;
@override@JsonKey(name: 'product_name') final  String? productName;
@override@JsonKey(name: 'sku_name') final  String? skuName;
@override final  String? thumbnail;
@override@JsonKey() final  int quantity;
@override@JsonKey() final  int price;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override final  String? status;

/// Create a copy of SellerPendingItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SellerPendingItemCopyWith<_SellerPendingItem> get copyWith => __$SellerPendingItemCopyWithImpl<_SellerPendingItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SellerPendingItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SellerPendingItem&&(identical(other.id, id) || other.id == id)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.buyerId, buyerId) || other.buyerId == buyerId)&&(identical(other.buyerName, buyerName) || other.buyerName == buyerName)&&(identical(other.spuId, spuId) || other.spuId == spuId)&&(identical(other.skuId, skuId) || other.skuId == skuId)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.skuName, skuName) || other.skuName == skuName)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.price, price) || other.price == price)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,orderId,buyerId,buyerName,spuId,skuId,productName,skuName,thumbnail,quantity,price,createdAt,status);

@override
String toString() {
  return 'SellerPendingItem(id: $id, orderId: $orderId, buyerId: $buyerId, buyerName: $buyerName, spuId: $spuId, skuId: $skuId, productName: $productName, skuName: $skuName, thumbnail: $thumbnail, quantity: $quantity, price: $price, createdAt: $createdAt, status: $status)';
}


}

/// @nodoc
abstract mixin class _$SellerPendingItemCopyWith<$Res> implements $SellerPendingItemCopyWith<$Res> {
  factory _$SellerPendingItemCopyWith(_SellerPendingItem value, $Res Function(_SellerPendingItem) _then) = __$SellerPendingItemCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'order_id') String? orderId,@JsonKey(name: 'buyer_id') String? buyerId,@JsonKey(name: 'buyer_name') String? buyerName,@JsonKey(name: 'spu_id') String? spuId,@JsonKey(name: 'sku_id') String? skuId,@JsonKey(name: 'product_name') String? productName,@JsonKey(name: 'sku_name') String? skuName, String? thumbnail, int quantity, int price,@JsonKey(name: 'created_at') String? createdAt, String? status
});




}
/// @nodoc
class __$SellerPendingItemCopyWithImpl<$Res>
    implements _$SellerPendingItemCopyWith<$Res> {
  __$SellerPendingItemCopyWithImpl(this._self, this._then);

  final _SellerPendingItem _self;
  final $Res Function(_SellerPendingItem) _then;

/// Create a copy of SellerPendingItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? orderId = freezed,Object? buyerId = freezed,Object? buyerName = freezed,Object? spuId = freezed,Object? skuId = freezed,Object? productName = freezed,Object? skuName = freezed,Object? thumbnail = freezed,Object? quantity = null,Object? price = null,Object? createdAt = freezed,Object? status = freezed,}) {
  return _then(_SellerPendingItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,orderId: freezed == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String?,buyerId: freezed == buyerId ? _self.buyerId : buyerId // ignore: cast_nullable_to_non_nullable
as String?,buyerName: freezed == buyerName ? _self.buyerName : buyerName // ignore: cast_nullable_to_non_nullable
as String?,spuId: freezed == spuId ? _self.spuId : spuId // ignore: cast_nullable_to_non_nullable
as String?,skuId: freezed == skuId ? _self.skuId : skuId // ignore: cast_nullable_to_non_nullable
as String?,productName: freezed == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String?,skuName: freezed == skuName ? _self.skuName : skuName // ignore: cast_nullable_to_non_nullable
as String?,thumbnail: freezed == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String?,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ConfirmSellerPendingRequest {

@JsonKey(name: 'item_ids') List<String> get itemIds;
/// Create a copy of ConfirmSellerPendingRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConfirmSellerPendingRequestCopyWith<ConfirmSellerPendingRequest> get copyWith => _$ConfirmSellerPendingRequestCopyWithImpl<ConfirmSellerPendingRequest>(this as ConfirmSellerPendingRequest, _$identity);

  /// Serializes this ConfirmSellerPendingRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConfirmSellerPendingRequest&&const DeepCollectionEquality().equals(other.itemIds, itemIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(itemIds));

@override
String toString() {
  return 'ConfirmSellerPendingRequest(itemIds: $itemIds)';
}


}

/// @nodoc
abstract mixin class $ConfirmSellerPendingRequestCopyWith<$Res>  {
  factory $ConfirmSellerPendingRequestCopyWith(ConfirmSellerPendingRequest value, $Res Function(ConfirmSellerPendingRequest) _then) = _$ConfirmSellerPendingRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'item_ids') List<String> itemIds
});




}
/// @nodoc
class _$ConfirmSellerPendingRequestCopyWithImpl<$Res>
    implements $ConfirmSellerPendingRequestCopyWith<$Res> {
  _$ConfirmSellerPendingRequestCopyWithImpl(this._self, this._then);

  final ConfirmSellerPendingRequest _self;
  final $Res Function(ConfirmSellerPendingRequest) _then;

/// Create a copy of ConfirmSellerPendingRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? itemIds = null,}) {
  return _then(_self.copyWith(
itemIds: null == itemIds ? _self.itemIds : itemIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [ConfirmSellerPendingRequest].
extension ConfirmSellerPendingRequestPatterns on ConfirmSellerPendingRequest {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConfirmSellerPendingRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConfirmSellerPendingRequest() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConfirmSellerPendingRequest value)  $default,){
final _that = this;
switch (_that) {
case _ConfirmSellerPendingRequest():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConfirmSellerPendingRequest value)?  $default,){
final _that = this;
switch (_that) {
case _ConfirmSellerPendingRequest() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'item_ids')  List<String> itemIds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConfirmSellerPendingRequest() when $default != null:
return $default(_that.itemIds);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'item_ids')  List<String> itemIds)  $default,) {final _that = this;
switch (_that) {
case _ConfirmSellerPendingRequest():
return $default(_that.itemIds);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'item_ids')  List<String> itemIds)?  $default,) {final _that = this;
switch (_that) {
case _ConfirmSellerPendingRequest() when $default != null:
return $default(_that.itemIds);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ConfirmSellerPendingRequest implements ConfirmSellerPendingRequest {
  const _ConfirmSellerPendingRequest({@JsonKey(name: 'item_ids') required final  List<String> itemIds}): _itemIds = itemIds;
  factory _ConfirmSellerPendingRequest.fromJson(Map<String, dynamic> json) => _$ConfirmSellerPendingRequestFromJson(json);

 final  List<String> _itemIds;
@override@JsonKey(name: 'item_ids') List<String> get itemIds {
  if (_itemIds is EqualUnmodifiableListView) return _itemIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_itemIds);
}


/// Create a copy of ConfirmSellerPendingRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConfirmSellerPendingRequestCopyWith<_ConfirmSellerPendingRequest> get copyWith => __$ConfirmSellerPendingRequestCopyWithImpl<_ConfirmSellerPendingRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConfirmSellerPendingRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConfirmSellerPendingRequest&&const DeepCollectionEquality().equals(other._itemIds, _itemIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_itemIds));

@override
String toString() {
  return 'ConfirmSellerPendingRequest(itemIds: $itemIds)';
}


}

/// @nodoc
abstract mixin class _$ConfirmSellerPendingRequestCopyWith<$Res> implements $ConfirmSellerPendingRequestCopyWith<$Res> {
  factory _$ConfirmSellerPendingRequestCopyWith(_ConfirmSellerPendingRequest value, $Res Function(_ConfirmSellerPendingRequest) _then) = __$ConfirmSellerPendingRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'item_ids') List<String> itemIds
});




}
/// @nodoc
class __$ConfirmSellerPendingRequestCopyWithImpl<$Res>
    implements _$ConfirmSellerPendingRequestCopyWith<$Res> {
  __$ConfirmSellerPendingRequestCopyWithImpl(this._self, this._then);

  final _ConfirmSellerPendingRequest _self;
  final $Res Function(_ConfirmSellerPendingRequest) _then;

/// Create a copy of ConfirmSellerPendingRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? itemIds = null,}) {
  return _then(_ConfirmSellerPendingRequest(
itemIds: null == itemIds ? _self._itemIds : itemIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}


/// @nodoc
mixin _$SellerConfirmResponse {

@JsonKey(name: 'session_id') String? get sessionId;@JsonKey(name: 'payment_url') String? get paymentUrl; int? get amount; String? get message;
/// Create a copy of SellerConfirmResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SellerConfirmResponseCopyWith<SellerConfirmResponse> get copyWith => _$SellerConfirmResponseCopyWithImpl<SellerConfirmResponse>(this as SellerConfirmResponse, _$identity);

  /// Serializes this SellerConfirmResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SellerConfirmResponse&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.paymentUrl, paymentUrl) || other.paymentUrl == paymentUrl)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sessionId,paymentUrl,amount,message);

@override
String toString() {
  return 'SellerConfirmResponse(sessionId: $sessionId, paymentUrl: $paymentUrl, amount: $amount, message: $message)';
}


}

/// @nodoc
abstract mixin class $SellerConfirmResponseCopyWith<$Res>  {
  factory $SellerConfirmResponseCopyWith(SellerConfirmResponse value, $Res Function(SellerConfirmResponse) _then) = _$SellerConfirmResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'session_id') String? sessionId,@JsonKey(name: 'payment_url') String? paymentUrl, int? amount, String? message
});




}
/// @nodoc
class _$SellerConfirmResponseCopyWithImpl<$Res>
    implements $SellerConfirmResponseCopyWith<$Res> {
  _$SellerConfirmResponseCopyWithImpl(this._self, this._then);

  final SellerConfirmResponse _self;
  final $Res Function(SellerConfirmResponse) _then;

/// Create a copy of SellerConfirmResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sessionId = freezed,Object? paymentUrl = freezed,Object? amount = freezed,Object? message = freezed,}) {
  return _then(_self.copyWith(
sessionId: freezed == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String?,paymentUrl: freezed == paymentUrl ? _self.paymentUrl : paymentUrl // ignore: cast_nullable_to_non_nullable
as String?,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SellerConfirmResponse].
extension SellerConfirmResponsePatterns on SellerConfirmResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SellerConfirmResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SellerConfirmResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SellerConfirmResponse value)  $default,){
final _that = this;
switch (_that) {
case _SellerConfirmResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SellerConfirmResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SellerConfirmResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'session_id')  String? sessionId, @JsonKey(name: 'payment_url')  String? paymentUrl,  int? amount,  String? message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SellerConfirmResponse() when $default != null:
return $default(_that.sessionId,_that.paymentUrl,_that.amount,_that.message);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'session_id')  String? sessionId, @JsonKey(name: 'payment_url')  String? paymentUrl,  int? amount,  String? message)  $default,) {final _that = this;
switch (_that) {
case _SellerConfirmResponse():
return $default(_that.sessionId,_that.paymentUrl,_that.amount,_that.message);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'session_id')  String? sessionId, @JsonKey(name: 'payment_url')  String? paymentUrl,  int? amount,  String? message)?  $default,) {final _that = this;
switch (_that) {
case _SellerConfirmResponse() when $default != null:
return $default(_that.sessionId,_that.paymentUrl,_that.amount,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SellerConfirmResponse implements SellerConfirmResponse {
  const _SellerConfirmResponse({@JsonKey(name: 'session_id') this.sessionId, @JsonKey(name: 'payment_url') this.paymentUrl, this.amount, this.message});
  factory _SellerConfirmResponse.fromJson(Map<String, dynamic> json) => _$SellerConfirmResponseFromJson(json);

@override@JsonKey(name: 'session_id') final  String? sessionId;
@override@JsonKey(name: 'payment_url') final  String? paymentUrl;
@override final  int? amount;
@override final  String? message;

/// Create a copy of SellerConfirmResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SellerConfirmResponseCopyWith<_SellerConfirmResponse> get copyWith => __$SellerConfirmResponseCopyWithImpl<_SellerConfirmResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SellerConfirmResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SellerConfirmResponse&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.paymentUrl, paymentUrl) || other.paymentUrl == paymentUrl)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sessionId,paymentUrl,amount,message);

@override
String toString() {
  return 'SellerConfirmResponse(sessionId: $sessionId, paymentUrl: $paymentUrl, amount: $amount, message: $message)';
}


}

/// @nodoc
abstract mixin class _$SellerConfirmResponseCopyWith<$Res> implements $SellerConfirmResponseCopyWith<$Res> {
  factory _$SellerConfirmResponseCopyWith(_SellerConfirmResponse value, $Res Function(_SellerConfirmResponse) _then) = __$SellerConfirmResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'session_id') String? sessionId,@JsonKey(name: 'payment_url') String? paymentUrl, int? amount, String? message
});




}
/// @nodoc
class __$SellerConfirmResponseCopyWithImpl<$Res>
    implements _$SellerConfirmResponseCopyWith<$Res> {
  __$SellerConfirmResponseCopyWithImpl(this._self, this._then);

  final _SellerConfirmResponse _self;
  final $Res Function(_SellerConfirmResponse) _then;

/// Create a copy of SellerConfirmResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sessionId = freezed,Object? paymentUrl = freezed,Object? amount = freezed,Object? message = freezed,}) {
  return _then(_SellerConfirmResponse(
sessionId: freezed == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String?,paymentUrl: freezed == paymentUrl ? _self.paymentUrl : paymentUrl // ignore: cast_nullable_to_non_nullable
as String?,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$RejectSellerPendingRequest {

@JsonKey(name: 'item_id') String get itemId; String? get reason;
/// Create a copy of RejectSellerPendingRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RejectSellerPendingRequestCopyWith<RejectSellerPendingRequest> get copyWith => _$RejectSellerPendingRequestCopyWithImpl<RejectSellerPendingRequest>(this as RejectSellerPendingRequest, _$identity);

  /// Serializes this RejectSellerPendingRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RejectSellerPendingRequest&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.reason, reason) || other.reason == reason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemId,reason);

@override
String toString() {
  return 'RejectSellerPendingRequest(itemId: $itemId, reason: $reason)';
}


}

/// @nodoc
abstract mixin class $RejectSellerPendingRequestCopyWith<$Res>  {
  factory $RejectSellerPendingRequestCopyWith(RejectSellerPendingRequest value, $Res Function(RejectSellerPendingRequest) _then) = _$RejectSellerPendingRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'item_id') String itemId, String? reason
});




}
/// @nodoc
class _$RejectSellerPendingRequestCopyWithImpl<$Res>
    implements $RejectSellerPendingRequestCopyWith<$Res> {
  _$RejectSellerPendingRequestCopyWithImpl(this._self, this._then);

  final RejectSellerPendingRequest _self;
  final $Res Function(RejectSellerPendingRequest) _then;

/// Create a copy of RejectSellerPendingRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? itemId = null,Object? reason = freezed,}) {
  return _then(_self.copyWith(
itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RejectSellerPendingRequest].
extension RejectSellerPendingRequestPatterns on RejectSellerPendingRequest {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RejectSellerPendingRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RejectSellerPendingRequest() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RejectSellerPendingRequest value)  $default,){
final _that = this;
switch (_that) {
case _RejectSellerPendingRequest():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RejectSellerPendingRequest value)?  $default,){
final _that = this;
switch (_that) {
case _RejectSellerPendingRequest() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'item_id')  String itemId,  String? reason)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RejectSellerPendingRequest() when $default != null:
return $default(_that.itemId,_that.reason);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'item_id')  String itemId,  String? reason)  $default,) {final _that = this;
switch (_that) {
case _RejectSellerPendingRequest():
return $default(_that.itemId,_that.reason);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'item_id')  String itemId,  String? reason)?  $default,) {final _that = this;
switch (_that) {
case _RejectSellerPendingRequest() when $default != null:
return $default(_that.itemId,_that.reason);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RejectSellerPendingRequest implements RejectSellerPendingRequest {
  const _RejectSellerPendingRequest({@JsonKey(name: 'item_id') required this.itemId, this.reason});
  factory _RejectSellerPendingRequest.fromJson(Map<String, dynamic> json) => _$RejectSellerPendingRequestFromJson(json);

@override@JsonKey(name: 'item_id') final  String itemId;
@override final  String? reason;

/// Create a copy of RejectSellerPendingRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RejectSellerPendingRequestCopyWith<_RejectSellerPendingRequest> get copyWith => __$RejectSellerPendingRequestCopyWithImpl<_RejectSellerPendingRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RejectSellerPendingRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RejectSellerPendingRequest&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.reason, reason) || other.reason == reason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemId,reason);

@override
String toString() {
  return 'RejectSellerPendingRequest(itemId: $itemId, reason: $reason)';
}


}

/// @nodoc
abstract mixin class _$RejectSellerPendingRequestCopyWith<$Res> implements $RejectSellerPendingRequestCopyWith<$Res> {
  factory _$RejectSellerPendingRequestCopyWith(_RejectSellerPendingRequest value, $Res Function(_RejectSellerPendingRequest) _then) = __$RejectSellerPendingRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'item_id') String itemId, String? reason
});




}
/// @nodoc
class __$RejectSellerPendingRequestCopyWithImpl<$Res>
    implements _$RejectSellerPendingRequestCopyWith<$Res> {
  __$RejectSellerPendingRequestCopyWithImpl(this._self, this._then);

  final _RejectSellerPendingRequest _self;
  final $Res Function(_RejectSellerPendingRequest) _then;

/// Create a copy of RejectSellerPendingRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? itemId = null,Object? reason = freezed,}) {
  return _then(_RejectSellerPendingRequest(
itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$VideoToProductResponse {

@JsonKey(name: 'suggested_title') String? get suggestedTitle;@JsonKey(name: 'suggested_description') String? get suggestedDescription;@JsonKey(name: 'category_id') String? get categoryId;@JsonKey(name: 'category_name') String? get categoryName; double? get confidence; List<String>? get tags; List<ProductSpecification>? get specifications;@JsonKey(name: 'suggested_skus') List<ProductSkuRequest>? get suggestedSkus;@JsonKey(name: 'extracted_frames') List<String>? get extractedFrames;
/// Create a copy of VideoToProductResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VideoToProductResponseCopyWith<VideoToProductResponse> get copyWith => _$VideoToProductResponseCopyWithImpl<VideoToProductResponse>(this as VideoToProductResponse, _$identity);

  /// Serializes this VideoToProductResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VideoToProductResponse&&(identical(other.suggestedTitle, suggestedTitle) || other.suggestedTitle == suggestedTitle)&&(identical(other.suggestedDescription, suggestedDescription) || other.suggestedDescription == suggestedDescription)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.confidence, confidence) || other.confidence == confidence)&&const DeepCollectionEquality().equals(other.tags, tags)&&const DeepCollectionEquality().equals(other.specifications, specifications)&&const DeepCollectionEquality().equals(other.suggestedSkus, suggestedSkus)&&const DeepCollectionEquality().equals(other.extractedFrames, extractedFrames));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,suggestedTitle,suggestedDescription,categoryId,categoryName,confidence,const DeepCollectionEquality().hash(tags),const DeepCollectionEquality().hash(specifications),const DeepCollectionEquality().hash(suggestedSkus),const DeepCollectionEquality().hash(extractedFrames));

@override
String toString() {
  return 'VideoToProductResponse(suggestedTitle: $suggestedTitle, suggestedDescription: $suggestedDescription, categoryId: $categoryId, categoryName: $categoryName, confidence: $confidence, tags: $tags, specifications: $specifications, suggestedSkus: $suggestedSkus, extractedFrames: $extractedFrames)';
}


}

/// @nodoc
abstract mixin class $VideoToProductResponseCopyWith<$Res>  {
  factory $VideoToProductResponseCopyWith(VideoToProductResponse value, $Res Function(VideoToProductResponse) _then) = _$VideoToProductResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'suggested_title') String? suggestedTitle,@JsonKey(name: 'suggested_description') String? suggestedDescription,@JsonKey(name: 'category_id') String? categoryId,@JsonKey(name: 'category_name') String? categoryName, double? confidence, List<String>? tags, List<ProductSpecification>? specifications,@JsonKey(name: 'suggested_skus') List<ProductSkuRequest>? suggestedSkus,@JsonKey(name: 'extracted_frames') List<String>? extractedFrames
});




}
/// @nodoc
class _$VideoToProductResponseCopyWithImpl<$Res>
    implements $VideoToProductResponseCopyWith<$Res> {
  _$VideoToProductResponseCopyWithImpl(this._self, this._then);

  final VideoToProductResponse _self;
  final $Res Function(VideoToProductResponse) _then;

/// Create a copy of VideoToProductResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? suggestedTitle = freezed,Object? suggestedDescription = freezed,Object? categoryId = freezed,Object? categoryName = freezed,Object? confidence = freezed,Object? tags = freezed,Object? specifications = freezed,Object? suggestedSkus = freezed,Object? extractedFrames = freezed,}) {
  return _then(_self.copyWith(
suggestedTitle: freezed == suggestedTitle ? _self.suggestedTitle : suggestedTitle // ignore: cast_nullable_to_non_nullable
as String?,suggestedDescription: freezed == suggestedDescription ? _self.suggestedDescription : suggestedDescription // ignore: cast_nullable_to_non_nullable
as String?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,categoryName: freezed == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String?,confidence: freezed == confidence ? _self.confidence : confidence // ignore: cast_nullable_to_non_nullable
as double?,tags: freezed == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>?,specifications: freezed == specifications ? _self.specifications : specifications // ignore: cast_nullable_to_non_nullable
as List<ProductSpecification>?,suggestedSkus: freezed == suggestedSkus ? _self.suggestedSkus : suggestedSkus // ignore: cast_nullable_to_non_nullable
as List<ProductSkuRequest>?,extractedFrames: freezed == extractedFrames ? _self.extractedFrames : extractedFrames // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

}


/// Adds pattern-matching-related methods to [VideoToProductResponse].
extension VideoToProductResponsePatterns on VideoToProductResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VideoToProductResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VideoToProductResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VideoToProductResponse value)  $default,){
final _that = this;
switch (_that) {
case _VideoToProductResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VideoToProductResponse value)?  $default,){
final _that = this;
switch (_that) {
case _VideoToProductResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'suggested_title')  String? suggestedTitle, @JsonKey(name: 'suggested_description')  String? suggestedDescription, @JsonKey(name: 'category_id')  String? categoryId, @JsonKey(name: 'category_name')  String? categoryName,  double? confidence,  List<String>? tags,  List<ProductSpecification>? specifications, @JsonKey(name: 'suggested_skus')  List<ProductSkuRequest>? suggestedSkus, @JsonKey(name: 'extracted_frames')  List<String>? extractedFrames)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VideoToProductResponse() when $default != null:
return $default(_that.suggestedTitle,_that.suggestedDescription,_that.categoryId,_that.categoryName,_that.confidence,_that.tags,_that.specifications,_that.suggestedSkus,_that.extractedFrames);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'suggested_title')  String? suggestedTitle, @JsonKey(name: 'suggested_description')  String? suggestedDescription, @JsonKey(name: 'category_id')  String? categoryId, @JsonKey(name: 'category_name')  String? categoryName,  double? confidence,  List<String>? tags,  List<ProductSpecification>? specifications, @JsonKey(name: 'suggested_skus')  List<ProductSkuRequest>? suggestedSkus, @JsonKey(name: 'extracted_frames')  List<String>? extractedFrames)  $default,) {final _that = this;
switch (_that) {
case _VideoToProductResponse():
return $default(_that.suggestedTitle,_that.suggestedDescription,_that.categoryId,_that.categoryName,_that.confidence,_that.tags,_that.specifications,_that.suggestedSkus,_that.extractedFrames);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'suggested_title')  String? suggestedTitle, @JsonKey(name: 'suggested_description')  String? suggestedDescription, @JsonKey(name: 'category_id')  String? categoryId, @JsonKey(name: 'category_name')  String? categoryName,  double? confidence,  List<String>? tags,  List<ProductSpecification>? specifications, @JsonKey(name: 'suggested_skus')  List<ProductSkuRequest>? suggestedSkus, @JsonKey(name: 'extracted_frames')  List<String>? extractedFrames)?  $default,) {final _that = this;
switch (_that) {
case _VideoToProductResponse() when $default != null:
return $default(_that.suggestedTitle,_that.suggestedDescription,_that.categoryId,_that.categoryName,_that.confidence,_that.tags,_that.specifications,_that.suggestedSkus,_that.extractedFrames);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VideoToProductResponse implements VideoToProductResponse {
  const _VideoToProductResponse({@JsonKey(name: 'suggested_title') this.suggestedTitle, @JsonKey(name: 'suggested_description') this.suggestedDescription, @JsonKey(name: 'category_id') this.categoryId, @JsonKey(name: 'category_name') this.categoryName, this.confidence, final  List<String>? tags, final  List<ProductSpecification>? specifications, @JsonKey(name: 'suggested_skus') final  List<ProductSkuRequest>? suggestedSkus, @JsonKey(name: 'extracted_frames') final  List<String>? extractedFrames}): _tags = tags,_specifications = specifications,_suggestedSkus = suggestedSkus,_extractedFrames = extractedFrames;
  factory _VideoToProductResponse.fromJson(Map<String, dynamic> json) => _$VideoToProductResponseFromJson(json);

@override@JsonKey(name: 'suggested_title') final  String? suggestedTitle;
@override@JsonKey(name: 'suggested_description') final  String? suggestedDescription;
@override@JsonKey(name: 'category_id') final  String? categoryId;
@override@JsonKey(name: 'category_name') final  String? categoryName;
@override final  double? confidence;
 final  List<String>? _tags;
@override List<String>? get tags {
  final value = _tags;
  if (value == null) return null;
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<ProductSpecification>? _specifications;
@override List<ProductSpecification>? get specifications {
  final value = _specifications;
  if (value == null) return null;
  if (_specifications is EqualUnmodifiableListView) return _specifications;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<ProductSkuRequest>? _suggestedSkus;
@override@JsonKey(name: 'suggested_skus') List<ProductSkuRequest>? get suggestedSkus {
  final value = _suggestedSkus;
  if (value == null) return null;
  if (_suggestedSkus is EqualUnmodifiableListView) return _suggestedSkus;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _extractedFrames;
@override@JsonKey(name: 'extracted_frames') List<String>? get extractedFrames {
  final value = _extractedFrames;
  if (value == null) return null;
  if (_extractedFrames is EqualUnmodifiableListView) return _extractedFrames;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of VideoToProductResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VideoToProductResponseCopyWith<_VideoToProductResponse> get copyWith => __$VideoToProductResponseCopyWithImpl<_VideoToProductResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VideoToProductResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VideoToProductResponse&&(identical(other.suggestedTitle, suggestedTitle) || other.suggestedTitle == suggestedTitle)&&(identical(other.suggestedDescription, suggestedDescription) || other.suggestedDescription == suggestedDescription)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.confidence, confidence) || other.confidence == confidence)&&const DeepCollectionEquality().equals(other._tags, _tags)&&const DeepCollectionEquality().equals(other._specifications, _specifications)&&const DeepCollectionEquality().equals(other._suggestedSkus, _suggestedSkus)&&const DeepCollectionEquality().equals(other._extractedFrames, _extractedFrames));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,suggestedTitle,suggestedDescription,categoryId,categoryName,confidence,const DeepCollectionEquality().hash(_tags),const DeepCollectionEquality().hash(_specifications),const DeepCollectionEquality().hash(_suggestedSkus),const DeepCollectionEquality().hash(_extractedFrames));

@override
String toString() {
  return 'VideoToProductResponse(suggestedTitle: $suggestedTitle, suggestedDescription: $suggestedDescription, categoryId: $categoryId, categoryName: $categoryName, confidence: $confidence, tags: $tags, specifications: $specifications, suggestedSkus: $suggestedSkus, extractedFrames: $extractedFrames)';
}


}

/// @nodoc
abstract mixin class _$VideoToProductResponseCopyWith<$Res> implements $VideoToProductResponseCopyWith<$Res> {
  factory _$VideoToProductResponseCopyWith(_VideoToProductResponse value, $Res Function(_VideoToProductResponse) _then) = __$VideoToProductResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'suggested_title') String? suggestedTitle,@JsonKey(name: 'suggested_description') String? suggestedDescription,@JsonKey(name: 'category_id') String? categoryId,@JsonKey(name: 'category_name') String? categoryName, double? confidence, List<String>? tags, List<ProductSpecification>? specifications,@JsonKey(name: 'suggested_skus') List<ProductSkuRequest>? suggestedSkus,@JsonKey(name: 'extracted_frames') List<String>? extractedFrames
});




}
/// @nodoc
class __$VideoToProductResponseCopyWithImpl<$Res>
    implements _$VideoToProductResponseCopyWith<$Res> {
  __$VideoToProductResponseCopyWithImpl(this._self, this._then);

  final _VideoToProductResponse _self;
  final $Res Function(_VideoToProductResponse) _then;

/// Create a copy of VideoToProductResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? suggestedTitle = freezed,Object? suggestedDescription = freezed,Object? categoryId = freezed,Object? categoryName = freezed,Object? confidence = freezed,Object? tags = freezed,Object? specifications = freezed,Object? suggestedSkus = freezed,Object? extractedFrames = freezed,}) {
  return _then(_VideoToProductResponse(
suggestedTitle: freezed == suggestedTitle ? _self.suggestedTitle : suggestedTitle // ignore: cast_nullable_to_non_nullable
as String?,suggestedDescription: freezed == suggestedDescription ? _self.suggestedDescription : suggestedDescription // ignore: cast_nullable_to_non_nullable
as String?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,categoryName: freezed == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String?,confidence: freezed == confidence ? _self.confidence : confidence // ignore: cast_nullable_to_non_nullable
as double?,tags: freezed == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>?,specifications: freezed == specifications ? _self._specifications : specifications // ignore: cast_nullable_to_non_nullable
as List<ProductSpecification>?,suggestedSkus: freezed == suggestedSkus ? _self._suggestedSkus : suggestedSkus // ignore: cast_nullable_to_non_nullable
as List<ProductSkuRequest>?,extractedFrames: freezed == extractedFrames ? _self._extractedFrames : extractedFrames // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}


/// @nodoc
mixin _$AudioToDescriptionResponse {

@JsonKey(name: 'raw_text') String? get rawText;@JsonKey(name: 'refined_description') String? get refinedDescription; double? get confidence;
/// Create a copy of AudioToDescriptionResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AudioToDescriptionResponseCopyWith<AudioToDescriptionResponse> get copyWith => _$AudioToDescriptionResponseCopyWithImpl<AudioToDescriptionResponse>(this as AudioToDescriptionResponse, _$identity);

  /// Serializes this AudioToDescriptionResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AudioToDescriptionResponse&&(identical(other.rawText, rawText) || other.rawText == rawText)&&(identical(other.refinedDescription, refinedDescription) || other.refinedDescription == refinedDescription)&&(identical(other.confidence, confidence) || other.confidence == confidence));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rawText,refinedDescription,confidence);

@override
String toString() {
  return 'AudioToDescriptionResponse(rawText: $rawText, refinedDescription: $refinedDescription, confidence: $confidence)';
}


}

/// @nodoc
abstract mixin class $AudioToDescriptionResponseCopyWith<$Res>  {
  factory $AudioToDescriptionResponseCopyWith(AudioToDescriptionResponse value, $Res Function(AudioToDescriptionResponse) _then) = _$AudioToDescriptionResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'raw_text') String? rawText,@JsonKey(name: 'refined_description') String? refinedDescription, double? confidence
});




}
/// @nodoc
class _$AudioToDescriptionResponseCopyWithImpl<$Res>
    implements $AudioToDescriptionResponseCopyWith<$Res> {
  _$AudioToDescriptionResponseCopyWithImpl(this._self, this._then);

  final AudioToDescriptionResponse _self;
  final $Res Function(AudioToDescriptionResponse) _then;

/// Create a copy of AudioToDescriptionResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rawText = freezed,Object? refinedDescription = freezed,Object? confidence = freezed,}) {
  return _then(_self.copyWith(
rawText: freezed == rawText ? _self.rawText : rawText // ignore: cast_nullable_to_non_nullable
as String?,refinedDescription: freezed == refinedDescription ? _self.refinedDescription : refinedDescription // ignore: cast_nullable_to_non_nullable
as String?,confidence: freezed == confidence ? _self.confidence : confidence // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [AudioToDescriptionResponse].
extension AudioToDescriptionResponsePatterns on AudioToDescriptionResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AudioToDescriptionResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AudioToDescriptionResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AudioToDescriptionResponse value)  $default,){
final _that = this;
switch (_that) {
case _AudioToDescriptionResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AudioToDescriptionResponse value)?  $default,){
final _that = this;
switch (_that) {
case _AudioToDescriptionResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'raw_text')  String? rawText, @JsonKey(name: 'refined_description')  String? refinedDescription,  double? confidence)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AudioToDescriptionResponse() when $default != null:
return $default(_that.rawText,_that.refinedDescription,_that.confidence);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'raw_text')  String? rawText, @JsonKey(name: 'refined_description')  String? refinedDescription,  double? confidence)  $default,) {final _that = this;
switch (_that) {
case _AudioToDescriptionResponse():
return $default(_that.rawText,_that.refinedDescription,_that.confidence);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'raw_text')  String? rawText, @JsonKey(name: 'refined_description')  String? refinedDescription,  double? confidence)?  $default,) {final _that = this;
switch (_that) {
case _AudioToDescriptionResponse() when $default != null:
return $default(_that.rawText,_that.refinedDescription,_that.confidence);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AudioToDescriptionResponse implements AudioToDescriptionResponse {
  const _AudioToDescriptionResponse({@JsonKey(name: 'raw_text') this.rawText, @JsonKey(name: 'refined_description') this.refinedDescription, this.confidence});
  factory _AudioToDescriptionResponse.fromJson(Map<String, dynamic> json) => _$AudioToDescriptionResponseFromJson(json);

@override@JsonKey(name: 'raw_text') final  String? rawText;
@override@JsonKey(name: 'refined_description') final  String? refinedDescription;
@override final  double? confidence;

/// Create a copy of AudioToDescriptionResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AudioToDescriptionResponseCopyWith<_AudioToDescriptionResponse> get copyWith => __$AudioToDescriptionResponseCopyWithImpl<_AudioToDescriptionResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AudioToDescriptionResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AudioToDescriptionResponse&&(identical(other.rawText, rawText) || other.rawText == rawText)&&(identical(other.refinedDescription, refinedDescription) || other.refinedDescription == refinedDescription)&&(identical(other.confidence, confidence) || other.confidence == confidence));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rawText,refinedDescription,confidence);

@override
String toString() {
  return 'AudioToDescriptionResponse(rawText: $rawText, refinedDescription: $refinedDescription, confidence: $confidence)';
}


}

/// @nodoc
abstract mixin class _$AudioToDescriptionResponseCopyWith<$Res> implements $AudioToDescriptionResponseCopyWith<$Res> {
  factory _$AudioToDescriptionResponseCopyWith(_AudioToDescriptionResponse value, $Res Function(_AudioToDescriptionResponse) _then) = __$AudioToDescriptionResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'raw_text') String? rawText,@JsonKey(name: 'refined_description') String? refinedDescription, double? confidence
});




}
/// @nodoc
class __$AudioToDescriptionResponseCopyWithImpl<$Res>
    implements _$AudioToDescriptionResponseCopyWith<$Res> {
  __$AudioToDescriptionResponseCopyWithImpl(this._self, this._then);

  final _AudioToDescriptionResponse _self;
  final $Res Function(_AudioToDescriptionResponse) _then;

/// Create a copy of AudioToDescriptionResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rawText = freezed,Object? refinedDescription = freezed,Object? confidence = freezed,}) {
  return _then(_AudioToDescriptionResponse(
rawText: freezed == rawText ? _self.rawText : rawText // ignore: cast_nullable_to_non_nullable
as String?,refinedDescription: freezed == refinedDescription ? _self.refinedDescription : refinedDescription // ignore: cast_nullable_to_non_nullable
as String?,confidence: freezed == confidence ? _self.confidence : confidence // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}


/// @nodoc
mixin _$RefineDescriptionRequest {

@JsonKey(name: 'raw_text') String get rawText; String? get tone; String? get prompt;
/// Create a copy of RefineDescriptionRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RefineDescriptionRequestCopyWith<RefineDescriptionRequest> get copyWith => _$RefineDescriptionRequestCopyWithImpl<RefineDescriptionRequest>(this as RefineDescriptionRequest, _$identity);

  /// Serializes this RefineDescriptionRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RefineDescriptionRequest&&(identical(other.rawText, rawText) || other.rawText == rawText)&&(identical(other.tone, tone) || other.tone == tone)&&(identical(other.prompt, prompt) || other.prompt == prompt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rawText,tone,prompt);

@override
String toString() {
  return 'RefineDescriptionRequest(rawText: $rawText, tone: $tone, prompt: $prompt)';
}


}

/// @nodoc
abstract mixin class $RefineDescriptionRequestCopyWith<$Res>  {
  factory $RefineDescriptionRequestCopyWith(RefineDescriptionRequest value, $Res Function(RefineDescriptionRequest) _then) = _$RefineDescriptionRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'raw_text') String rawText, String? tone, String? prompt
});




}
/// @nodoc
class _$RefineDescriptionRequestCopyWithImpl<$Res>
    implements $RefineDescriptionRequestCopyWith<$Res> {
  _$RefineDescriptionRequestCopyWithImpl(this._self, this._then);

  final RefineDescriptionRequest _self;
  final $Res Function(RefineDescriptionRequest) _then;

/// Create a copy of RefineDescriptionRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rawText = null,Object? tone = freezed,Object? prompt = freezed,}) {
  return _then(_self.copyWith(
rawText: null == rawText ? _self.rawText : rawText // ignore: cast_nullable_to_non_nullable
as String,tone: freezed == tone ? _self.tone : tone // ignore: cast_nullable_to_non_nullable
as String?,prompt: freezed == prompt ? _self.prompt : prompt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RefineDescriptionRequest].
extension RefineDescriptionRequestPatterns on RefineDescriptionRequest {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RefineDescriptionRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RefineDescriptionRequest() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RefineDescriptionRequest value)  $default,){
final _that = this;
switch (_that) {
case _RefineDescriptionRequest():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RefineDescriptionRequest value)?  $default,){
final _that = this;
switch (_that) {
case _RefineDescriptionRequest() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'raw_text')  String rawText,  String? tone,  String? prompt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RefineDescriptionRequest() when $default != null:
return $default(_that.rawText,_that.tone,_that.prompt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'raw_text')  String rawText,  String? tone,  String? prompt)  $default,) {final _that = this;
switch (_that) {
case _RefineDescriptionRequest():
return $default(_that.rawText,_that.tone,_that.prompt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'raw_text')  String rawText,  String? tone,  String? prompt)?  $default,) {final _that = this;
switch (_that) {
case _RefineDescriptionRequest() when $default != null:
return $default(_that.rawText,_that.tone,_that.prompt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RefineDescriptionRequest implements RefineDescriptionRequest {
  const _RefineDescriptionRequest({@JsonKey(name: 'raw_text') required this.rawText, this.tone, this.prompt});
  factory _RefineDescriptionRequest.fromJson(Map<String, dynamic> json) => _$RefineDescriptionRequestFromJson(json);

@override@JsonKey(name: 'raw_text') final  String rawText;
@override final  String? tone;
@override final  String? prompt;

/// Create a copy of RefineDescriptionRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RefineDescriptionRequestCopyWith<_RefineDescriptionRequest> get copyWith => __$RefineDescriptionRequestCopyWithImpl<_RefineDescriptionRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RefineDescriptionRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RefineDescriptionRequest&&(identical(other.rawText, rawText) || other.rawText == rawText)&&(identical(other.tone, tone) || other.tone == tone)&&(identical(other.prompt, prompt) || other.prompt == prompt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rawText,tone,prompt);

@override
String toString() {
  return 'RefineDescriptionRequest(rawText: $rawText, tone: $tone, prompt: $prompt)';
}


}

/// @nodoc
abstract mixin class _$RefineDescriptionRequestCopyWith<$Res> implements $RefineDescriptionRequestCopyWith<$Res> {
  factory _$RefineDescriptionRequestCopyWith(_RefineDescriptionRequest value, $Res Function(_RefineDescriptionRequest) _then) = __$RefineDescriptionRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'raw_text') String rawText, String? tone, String? prompt
});




}
/// @nodoc
class __$RefineDescriptionRequestCopyWithImpl<$Res>
    implements _$RefineDescriptionRequestCopyWith<$Res> {
  __$RefineDescriptionRequestCopyWithImpl(this._self, this._then);

  final _RefineDescriptionRequest _self;
  final $Res Function(_RefineDescriptionRequest) _then;

/// Create a copy of RefineDescriptionRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rawText = null,Object? tone = freezed,Object? prompt = freezed,}) {
  return _then(_RefineDescriptionRequest(
rawText: null == rawText ? _self.rawText : rawText // ignore: cast_nullable_to_non_nullable
as String,tone: freezed == tone ? _self.tone : tone // ignore: cast_nullable_to_non_nullable
as String?,prompt: freezed == prompt ? _self.prompt : prompt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$RefineDescriptionResponse {

@JsonKey(name: 'refined_description') String? get refinedDescription;@JsonKey(name: 'raw_text') String? get rawText;
/// Create a copy of RefineDescriptionResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RefineDescriptionResponseCopyWith<RefineDescriptionResponse> get copyWith => _$RefineDescriptionResponseCopyWithImpl<RefineDescriptionResponse>(this as RefineDescriptionResponse, _$identity);

  /// Serializes this RefineDescriptionResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RefineDescriptionResponse&&(identical(other.refinedDescription, refinedDescription) || other.refinedDescription == refinedDescription)&&(identical(other.rawText, rawText) || other.rawText == rawText));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,refinedDescription,rawText);

@override
String toString() {
  return 'RefineDescriptionResponse(refinedDescription: $refinedDescription, rawText: $rawText)';
}


}

/// @nodoc
abstract mixin class $RefineDescriptionResponseCopyWith<$Res>  {
  factory $RefineDescriptionResponseCopyWith(RefineDescriptionResponse value, $Res Function(RefineDescriptionResponse) _then) = _$RefineDescriptionResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'refined_description') String? refinedDescription,@JsonKey(name: 'raw_text') String? rawText
});




}
/// @nodoc
class _$RefineDescriptionResponseCopyWithImpl<$Res>
    implements $RefineDescriptionResponseCopyWith<$Res> {
  _$RefineDescriptionResponseCopyWithImpl(this._self, this._then);

  final RefineDescriptionResponse _self;
  final $Res Function(RefineDescriptionResponse) _then;

/// Create a copy of RefineDescriptionResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? refinedDescription = freezed,Object? rawText = freezed,}) {
  return _then(_self.copyWith(
refinedDescription: freezed == refinedDescription ? _self.refinedDescription : refinedDescription // ignore: cast_nullable_to_non_nullable
as String?,rawText: freezed == rawText ? _self.rawText : rawText // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RefineDescriptionResponse].
extension RefineDescriptionResponsePatterns on RefineDescriptionResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RefineDescriptionResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RefineDescriptionResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RefineDescriptionResponse value)  $default,){
final _that = this;
switch (_that) {
case _RefineDescriptionResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RefineDescriptionResponse value)?  $default,){
final _that = this;
switch (_that) {
case _RefineDescriptionResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'refined_description')  String? refinedDescription, @JsonKey(name: 'raw_text')  String? rawText)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RefineDescriptionResponse() when $default != null:
return $default(_that.refinedDescription,_that.rawText);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'refined_description')  String? refinedDescription, @JsonKey(name: 'raw_text')  String? rawText)  $default,) {final _that = this;
switch (_that) {
case _RefineDescriptionResponse():
return $default(_that.refinedDescription,_that.rawText);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'refined_description')  String? refinedDescription, @JsonKey(name: 'raw_text')  String? rawText)?  $default,) {final _that = this;
switch (_that) {
case _RefineDescriptionResponse() when $default != null:
return $default(_that.refinedDescription,_that.rawText);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RefineDescriptionResponse implements RefineDescriptionResponse {
  const _RefineDescriptionResponse({@JsonKey(name: 'refined_description') this.refinedDescription, @JsonKey(name: 'raw_text') this.rawText});
  factory _RefineDescriptionResponse.fromJson(Map<String, dynamic> json) => _$RefineDescriptionResponseFromJson(json);

@override@JsonKey(name: 'refined_description') final  String? refinedDescription;
@override@JsonKey(name: 'raw_text') final  String? rawText;

/// Create a copy of RefineDescriptionResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RefineDescriptionResponseCopyWith<_RefineDescriptionResponse> get copyWith => __$RefineDescriptionResponseCopyWithImpl<_RefineDescriptionResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RefineDescriptionResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RefineDescriptionResponse&&(identical(other.refinedDescription, refinedDescription) || other.refinedDescription == refinedDescription)&&(identical(other.rawText, rawText) || other.rawText == rawText));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,refinedDescription,rawText);

@override
String toString() {
  return 'RefineDescriptionResponse(refinedDescription: $refinedDescription, rawText: $rawText)';
}


}

/// @nodoc
abstract mixin class _$RefineDescriptionResponseCopyWith<$Res> implements $RefineDescriptionResponseCopyWith<$Res> {
  factory _$RefineDescriptionResponseCopyWith(_RefineDescriptionResponse value, $Res Function(_RefineDescriptionResponse) _then) = __$RefineDescriptionResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'refined_description') String? refinedDescription,@JsonKey(name: 'raw_text') String? rawText
});




}
/// @nodoc
class __$RefineDescriptionResponseCopyWithImpl<$Res>
    implements _$RefineDescriptionResponseCopyWith<$Res> {
  __$RefineDescriptionResponseCopyWithImpl(this._self, this._then);

  final _RefineDescriptionResponse _self;
  final $Res Function(_RefineDescriptionResponse) _then;

/// Create a copy of RefineDescriptionResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? refinedDescription = freezed,Object? rawText = freezed,}) {
  return _then(_RefineDescriptionResponse(
refinedDescription: freezed == refinedDescription ? _self.refinedDescription : refinedDescription // ignore: cast_nullable_to_non_nullable
as String?,rawText: freezed == rawText ? _self.rawText : rawText // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$SellerOrder {

 String get id;@JsonKey(name: 'tx_id') String? get txId;@JsonKey(name: 'buyer_id') String? get buyerId;@JsonKey(name: 'buyer_name') String? get buyerName;@JsonKey(name: 'total_amount') int get totalAmount; String? get status;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'shipping_address') String? get shippingAddress; List<SellerPendingItem>? get items;
/// Create a copy of SellerOrder
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SellerOrderCopyWith<SellerOrder> get copyWith => _$SellerOrderCopyWithImpl<SellerOrder>(this as SellerOrder, _$identity);

  /// Serializes this SellerOrder to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SellerOrder&&(identical(other.id, id) || other.id == id)&&(identical(other.txId, txId) || other.txId == txId)&&(identical(other.buyerId, buyerId) || other.buyerId == buyerId)&&(identical(other.buyerName, buyerName) || other.buyerName == buyerName)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.shippingAddress, shippingAddress) || other.shippingAddress == shippingAddress)&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,txId,buyerId,buyerName,totalAmount,status,createdAt,shippingAddress,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'SellerOrder(id: $id, txId: $txId, buyerId: $buyerId, buyerName: $buyerName, totalAmount: $totalAmount, status: $status, createdAt: $createdAt, shippingAddress: $shippingAddress, items: $items)';
}


}

/// @nodoc
abstract mixin class $SellerOrderCopyWith<$Res>  {
  factory $SellerOrderCopyWith(SellerOrder value, $Res Function(SellerOrder) _then) = _$SellerOrderCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'tx_id') String? txId,@JsonKey(name: 'buyer_id') String? buyerId,@JsonKey(name: 'buyer_name') String? buyerName,@JsonKey(name: 'total_amount') int totalAmount, String? status,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'shipping_address') String? shippingAddress, List<SellerPendingItem>? items
});




}
/// @nodoc
class _$SellerOrderCopyWithImpl<$Res>
    implements $SellerOrderCopyWith<$Res> {
  _$SellerOrderCopyWithImpl(this._self, this._then);

  final SellerOrder _self;
  final $Res Function(SellerOrder) _then;

/// Create a copy of SellerOrder
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? txId = freezed,Object? buyerId = freezed,Object? buyerName = freezed,Object? totalAmount = null,Object? status = freezed,Object? createdAt = freezed,Object? shippingAddress = freezed,Object? items = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,txId: freezed == txId ? _self.txId : txId // ignore: cast_nullable_to_non_nullable
as String?,buyerId: freezed == buyerId ? _self.buyerId : buyerId // ignore: cast_nullable_to_non_nullable
as String?,buyerName: freezed == buyerName ? _self.buyerName : buyerName // ignore: cast_nullable_to_non_nullable
as String?,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as int,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,shippingAddress: freezed == shippingAddress ? _self.shippingAddress : shippingAddress // ignore: cast_nullable_to_non_nullable
as String?,items: freezed == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<SellerPendingItem>?,
  ));
}

}


/// Adds pattern-matching-related methods to [SellerOrder].
extension SellerOrderPatterns on SellerOrder {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SellerOrder value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SellerOrder() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SellerOrder value)  $default,){
final _that = this;
switch (_that) {
case _SellerOrder():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SellerOrder value)?  $default,){
final _that = this;
switch (_that) {
case _SellerOrder() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'tx_id')  String? txId, @JsonKey(name: 'buyer_id')  String? buyerId, @JsonKey(name: 'buyer_name')  String? buyerName, @JsonKey(name: 'total_amount')  int totalAmount,  String? status, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'shipping_address')  String? shippingAddress,  List<SellerPendingItem>? items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SellerOrder() when $default != null:
return $default(_that.id,_that.txId,_that.buyerId,_that.buyerName,_that.totalAmount,_that.status,_that.createdAt,_that.shippingAddress,_that.items);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'tx_id')  String? txId, @JsonKey(name: 'buyer_id')  String? buyerId, @JsonKey(name: 'buyer_name')  String? buyerName, @JsonKey(name: 'total_amount')  int totalAmount,  String? status, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'shipping_address')  String? shippingAddress,  List<SellerPendingItem>? items)  $default,) {final _that = this;
switch (_that) {
case _SellerOrder():
return $default(_that.id,_that.txId,_that.buyerId,_that.buyerName,_that.totalAmount,_that.status,_that.createdAt,_that.shippingAddress,_that.items);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'tx_id')  String? txId, @JsonKey(name: 'buyer_id')  String? buyerId, @JsonKey(name: 'buyer_name')  String? buyerName, @JsonKey(name: 'total_amount')  int totalAmount,  String? status, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'shipping_address')  String? shippingAddress,  List<SellerPendingItem>? items)?  $default,) {final _that = this;
switch (_that) {
case _SellerOrder() when $default != null:
return $default(_that.id,_that.txId,_that.buyerId,_that.buyerName,_that.totalAmount,_that.status,_that.createdAt,_that.shippingAddress,_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SellerOrder implements SellerOrder {
  const _SellerOrder({required this.id, @JsonKey(name: 'tx_id') this.txId, @JsonKey(name: 'buyer_id') this.buyerId, @JsonKey(name: 'buyer_name') this.buyerName, @JsonKey(name: 'total_amount') this.totalAmount = 0, this.status, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'shipping_address') this.shippingAddress, final  List<SellerPendingItem>? items}): _items = items;
  factory _SellerOrder.fromJson(Map<String, dynamic> json) => _$SellerOrderFromJson(json);

@override final  String id;
@override@JsonKey(name: 'tx_id') final  String? txId;
@override@JsonKey(name: 'buyer_id') final  String? buyerId;
@override@JsonKey(name: 'buyer_name') final  String? buyerName;
@override@JsonKey(name: 'total_amount') final  int totalAmount;
@override final  String? status;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'shipping_address') final  String? shippingAddress;
 final  List<SellerPendingItem>? _items;
@override List<SellerPendingItem>? get items {
  final value = _items;
  if (value == null) return null;
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of SellerOrder
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SellerOrderCopyWith<_SellerOrder> get copyWith => __$SellerOrderCopyWithImpl<_SellerOrder>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SellerOrderToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SellerOrder&&(identical(other.id, id) || other.id == id)&&(identical(other.txId, txId) || other.txId == txId)&&(identical(other.buyerId, buyerId) || other.buyerId == buyerId)&&(identical(other.buyerName, buyerName) || other.buyerName == buyerName)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.shippingAddress, shippingAddress) || other.shippingAddress == shippingAddress)&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,txId,buyerId,buyerName,totalAmount,status,createdAt,shippingAddress,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'SellerOrder(id: $id, txId: $txId, buyerId: $buyerId, buyerName: $buyerName, totalAmount: $totalAmount, status: $status, createdAt: $createdAt, shippingAddress: $shippingAddress, items: $items)';
}


}

/// @nodoc
abstract mixin class _$SellerOrderCopyWith<$Res> implements $SellerOrderCopyWith<$Res> {
  factory _$SellerOrderCopyWith(_SellerOrder value, $Res Function(_SellerOrder) _then) = __$SellerOrderCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'tx_id') String? txId,@JsonKey(name: 'buyer_id') String? buyerId,@JsonKey(name: 'buyer_name') String? buyerName,@JsonKey(name: 'total_amount') int totalAmount, String? status,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'shipping_address') String? shippingAddress, List<SellerPendingItem>? items
});




}
/// @nodoc
class __$SellerOrderCopyWithImpl<$Res>
    implements _$SellerOrderCopyWith<$Res> {
  __$SellerOrderCopyWithImpl(this._self, this._then);

  final _SellerOrder _self;
  final $Res Function(_SellerOrder) _then;

/// Create a copy of SellerOrder
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? txId = freezed,Object? buyerId = freezed,Object? buyerName = freezed,Object? totalAmount = null,Object? status = freezed,Object? createdAt = freezed,Object? shippingAddress = freezed,Object? items = freezed,}) {
  return _then(_SellerOrder(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,txId: freezed == txId ? _self.txId : txId // ignore: cast_nullable_to_non_nullable
as String?,buyerId: freezed == buyerId ? _self.buyerId : buyerId // ignore: cast_nullable_to_non_nullable
as String?,buyerName: freezed == buyerName ? _self.buyerName : buyerName // ignore: cast_nullable_to_non_nullable
as String?,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as int,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,shippingAddress: freezed == shippingAddress ? _self.shippingAddress : shippingAddress // ignore: cast_nullable_to_non_nullable
as String?,items: freezed == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<SellerPendingItem>?,
  ));
}


}

// dart format on
