// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dispute_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BuyerRefundFormState {

 String get orderId; String get reason; List<RefundAttachment> get attachments; bool get isUploadingMedia; bool get isSubmitting; String? get errorMessage;
/// Create a copy of BuyerRefundFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BuyerRefundFormStateCopyWith<BuyerRefundFormState> get copyWith => _$BuyerRefundFormStateCopyWithImpl<BuyerRefundFormState>(this as BuyerRefundFormState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BuyerRefundFormState&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.reason, reason) || other.reason == reason)&&const DeepCollectionEquality().equals(other.attachments, attachments)&&(identical(other.isUploadingMedia, isUploadingMedia) || other.isUploadingMedia == isUploadingMedia)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,orderId,reason,const DeepCollectionEquality().hash(attachments),isUploadingMedia,isSubmitting,errorMessage);

@override
String toString() {
  return 'BuyerRefundFormState(orderId: $orderId, reason: $reason, attachments: $attachments, isUploadingMedia: $isUploadingMedia, isSubmitting: $isSubmitting, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $BuyerRefundFormStateCopyWith<$Res>  {
  factory $BuyerRefundFormStateCopyWith(BuyerRefundFormState value, $Res Function(BuyerRefundFormState) _then) = _$BuyerRefundFormStateCopyWithImpl;
@useResult
$Res call({
 String orderId, String reason, List<RefundAttachment> attachments, bool isUploadingMedia, bool isSubmitting, String? errorMessage
});




}
/// @nodoc
class _$BuyerRefundFormStateCopyWithImpl<$Res>
    implements $BuyerRefundFormStateCopyWith<$Res> {
  _$BuyerRefundFormStateCopyWithImpl(this._self, this._then);

  final BuyerRefundFormState _self;
  final $Res Function(BuyerRefundFormState) _then;

/// Create a copy of BuyerRefundFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? orderId = null,Object? reason = null,Object? attachments = null,Object? isUploadingMedia = null,Object? isSubmitting = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,attachments: null == attachments ? _self.attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<RefundAttachment>,isUploadingMedia: null == isUploadingMedia ? _self.isUploadingMedia : isUploadingMedia // ignore: cast_nullable_to_non_nullable
as bool,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BuyerRefundFormState].
extension BuyerRefundFormStatePatterns on BuyerRefundFormState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BuyerRefundFormState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BuyerRefundFormState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BuyerRefundFormState value)  $default,){
final _that = this;
switch (_that) {
case _BuyerRefundFormState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BuyerRefundFormState value)?  $default,){
final _that = this;
switch (_that) {
case _BuyerRefundFormState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String orderId,  String reason,  List<RefundAttachment> attachments,  bool isUploadingMedia,  bool isSubmitting,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BuyerRefundFormState() when $default != null:
return $default(_that.orderId,_that.reason,_that.attachments,_that.isUploadingMedia,_that.isSubmitting,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String orderId,  String reason,  List<RefundAttachment> attachments,  bool isUploadingMedia,  bool isSubmitting,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _BuyerRefundFormState():
return $default(_that.orderId,_that.reason,_that.attachments,_that.isUploadingMedia,_that.isSubmitting,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String orderId,  String reason,  List<RefundAttachment> attachments,  bool isUploadingMedia,  bool isSubmitting,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _BuyerRefundFormState() when $default != null:
return $default(_that.orderId,_that.reason,_that.attachments,_that.isUploadingMedia,_that.isSubmitting,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _BuyerRefundFormState extends BuyerRefundFormState {
  const _BuyerRefundFormState({this.orderId = '', this.reason = '', final  List<RefundAttachment> attachments = const [], this.isUploadingMedia = false, this.isSubmitting = false, this.errorMessage}): _attachments = attachments,super._();
  

@override@JsonKey() final  String orderId;
@override@JsonKey() final  String reason;
 final  List<RefundAttachment> _attachments;
@override@JsonKey() List<RefundAttachment> get attachments {
  if (_attachments is EqualUnmodifiableListView) return _attachments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_attachments);
}

@override@JsonKey() final  bool isUploadingMedia;
@override@JsonKey() final  bool isSubmitting;
@override final  String? errorMessage;

/// Create a copy of BuyerRefundFormState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BuyerRefundFormStateCopyWith<_BuyerRefundFormState> get copyWith => __$BuyerRefundFormStateCopyWithImpl<_BuyerRefundFormState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BuyerRefundFormState&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.reason, reason) || other.reason == reason)&&const DeepCollectionEquality().equals(other._attachments, _attachments)&&(identical(other.isUploadingMedia, isUploadingMedia) || other.isUploadingMedia == isUploadingMedia)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,orderId,reason,const DeepCollectionEquality().hash(_attachments),isUploadingMedia,isSubmitting,errorMessage);

@override
String toString() {
  return 'BuyerRefundFormState(orderId: $orderId, reason: $reason, attachments: $attachments, isUploadingMedia: $isUploadingMedia, isSubmitting: $isSubmitting, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$BuyerRefundFormStateCopyWith<$Res> implements $BuyerRefundFormStateCopyWith<$Res> {
  factory _$BuyerRefundFormStateCopyWith(_BuyerRefundFormState value, $Res Function(_BuyerRefundFormState) _then) = __$BuyerRefundFormStateCopyWithImpl;
@override @useResult
$Res call({
 String orderId, String reason, List<RefundAttachment> attachments, bool isUploadingMedia, bool isSubmitting, String? errorMessage
});




}
/// @nodoc
class __$BuyerRefundFormStateCopyWithImpl<$Res>
    implements _$BuyerRefundFormStateCopyWith<$Res> {
  __$BuyerRefundFormStateCopyWithImpl(this._self, this._then);

  final _BuyerRefundFormState _self;
  final $Res Function(_BuyerRefundFormState) _then;

/// Create a copy of BuyerRefundFormState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orderId = null,Object? reason = null,Object? attachments = null,Object? isUploadingMedia = null,Object? isSubmitting = null,Object? errorMessage = freezed,}) {
  return _then(_BuyerRefundFormState(
orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,attachments: null == attachments ? _self._attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<RefundAttachment>,isUploadingMedia: null == isUploadingMedia ? _self.isUploadingMedia : isUploadingMedia // ignore: cast_nullable_to_non_nullable
as bool,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$SellerDisputeFormState {

 String get refundId; String get reason; List<RefundAttachment> get attachments; bool get isUploadingMedia; bool get isSubmitting; String? get errorMessage;
/// Create a copy of SellerDisputeFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SellerDisputeFormStateCopyWith<SellerDisputeFormState> get copyWith => _$SellerDisputeFormStateCopyWithImpl<SellerDisputeFormState>(this as SellerDisputeFormState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SellerDisputeFormState&&(identical(other.refundId, refundId) || other.refundId == refundId)&&(identical(other.reason, reason) || other.reason == reason)&&const DeepCollectionEquality().equals(other.attachments, attachments)&&(identical(other.isUploadingMedia, isUploadingMedia) || other.isUploadingMedia == isUploadingMedia)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,refundId,reason,const DeepCollectionEquality().hash(attachments),isUploadingMedia,isSubmitting,errorMessage);

@override
String toString() {
  return 'SellerDisputeFormState(refundId: $refundId, reason: $reason, attachments: $attachments, isUploadingMedia: $isUploadingMedia, isSubmitting: $isSubmitting, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $SellerDisputeFormStateCopyWith<$Res>  {
  factory $SellerDisputeFormStateCopyWith(SellerDisputeFormState value, $Res Function(SellerDisputeFormState) _then) = _$SellerDisputeFormStateCopyWithImpl;
@useResult
$Res call({
 String refundId, String reason, List<RefundAttachment> attachments, bool isUploadingMedia, bool isSubmitting, String? errorMessage
});




}
/// @nodoc
class _$SellerDisputeFormStateCopyWithImpl<$Res>
    implements $SellerDisputeFormStateCopyWith<$Res> {
  _$SellerDisputeFormStateCopyWithImpl(this._self, this._then);

  final SellerDisputeFormState _self;
  final $Res Function(SellerDisputeFormState) _then;

/// Create a copy of SellerDisputeFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? refundId = null,Object? reason = null,Object? attachments = null,Object? isUploadingMedia = null,Object? isSubmitting = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
refundId: null == refundId ? _self.refundId : refundId // ignore: cast_nullable_to_non_nullable
as String,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,attachments: null == attachments ? _self.attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<RefundAttachment>,isUploadingMedia: null == isUploadingMedia ? _self.isUploadingMedia : isUploadingMedia // ignore: cast_nullable_to_non_nullable
as bool,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SellerDisputeFormState].
extension SellerDisputeFormStatePatterns on SellerDisputeFormState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SellerDisputeFormState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SellerDisputeFormState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SellerDisputeFormState value)  $default,){
final _that = this;
switch (_that) {
case _SellerDisputeFormState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SellerDisputeFormState value)?  $default,){
final _that = this;
switch (_that) {
case _SellerDisputeFormState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String refundId,  String reason,  List<RefundAttachment> attachments,  bool isUploadingMedia,  bool isSubmitting,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SellerDisputeFormState() when $default != null:
return $default(_that.refundId,_that.reason,_that.attachments,_that.isUploadingMedia,_that.isSubmitting,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String refundId,  String reason,  List<RefundAttachment> attachments,  bool isUploadingMedia,  bool isSubmitting,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _SellerDisputeFormState():
return $default(_that.refundId,_that.reason,_that.attachments,_that.isUploadingMedia,_that.isSubmitting,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String refundId,  String reason,  List<RefundAttachment> attachments,  bool isUploadingMedia,  bool isSubmitting,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _SellerDisputeFormState() when $default != null:
return $default(_that.refundId,_that.reason,_that.attachments,_that.isUploadingMedia,_that.isSubmitting,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _SellerDisputeFormState extends SellerDisputeFormState {
  const _SellerDisputeFormState({this.refundId = '', this.reason = '', final  List<RefundAttachment> attachments = const [], this.isUploadingMedia = false, this.isSubmitting = false, this.errorMessage}): _attachments = attachments,super._();
  

@override@JsonKey() final  String refundId;
@override@JsonKey() final  String reason;
 final  List<RefundAttachment> _attachments;
@override@JsonKey() List<RefundAttachment> get attachments {
  if (_attachments is EqualUnmodifiableListView) return _attachments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_attachments);
}

@override@JsonKey() final  bool isUploadingMedia;
@override@JsonKey() final  bool isSubmitting;
@override final  String? errorMessage;

/// Create a copy of SellerDisputeFormState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SellerDisputeFormStateCopyWith<_SellerDisputeFormState> get copyWith => __$SellerDisputeFormStateCopyWithImpl<_SellerDisputeFormState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SellerDisputeFormState&&(identical(other.refundId, refundId) || other.refundId == refundId)&&(identical(other.reason, reason) || other.reason == reason)&&const DeepCollectionEquality().equals(other._attachments, _attachments)&&(identical(other.isUploadingMedia, isUploadingMedia) || other.isUploadingMedia == isUploadingMedia)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,refundId,reason,const DeepCollectionEquality().hash(_attachments),isUploadingMedia,isSubmitting,errorMessage);

@override
String toString() {
  return 'SellerDisputeFormState(refundId: $refundId, reason: $reason, attachments: $attachments, isUploadingMedia: $isUploadingMedia, isSubmitting: $isSubmitting, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$SellerDisputeFormStateCopyWith<$Res> implements $SellerDisputeFormStateCopyWith<$Res> {
  factory _$SellerDisputeFormStateCopyWith(_SellerDisputeFormState value, $Res Function(_SellerDisputeFormState) _then) = __$SellerDisputeFormStateCopyWithImpl;
@override @useResult
$Res call({
 String refundId, String reason, List<RefundAttachment> attachments, bool isUploadingMedia, bool isSubmitting, String? errorMessage
});




}
/// @nodoc
class __$SellerDisputeFormStateCopyWithImpl<$Res>
    implements _$SellerDisputeFormStateCopyWith<$Res> {
  __$SellerDisputeFormStateCopyWithImpl(this._self, this._then);

  final _SellerDisputeFormState _self;
  final $Res Function(_SellerDisputeFormState) _then;

/// Create a copy of SellerDisputeFormState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? refundId = null,Object? reason = null,Object? attachments = null,Object? isUploadingMedia = null,Object? isSubmitting = null,Object? errorMessage = freezed,}) {
  return _then(_SellerDisputeFormState(
refundId: null == refundId ? _self.refundId : refundId // ignore: cast_nullable_to_non_nullable
as String,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,attachments: null == attachments ? _self._attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<RefundAttachment>,isUploadingMedia: null == isUploadingMedia ? _self.isUploadingMedia : isUploadingMedia // ignore: cast_nullable_to_non_nullable
as bool,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$DisputeState {

 List<RefundModel> get refunds; RefundModel? get selectedRefund; List<RefundDisputeModel> get disputes; String? get filterStatus; bool get isLoading; String? get errorMessage;
/// Create a copy of DisputeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DisputeStateCopyWith<DisputeState> get copyWith => _$DisputeStateCopyWithImpl<DisputeState>(this as DisputeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DisputeState&&const DeepCollectionEquality().equals(other.refunds, refunds)&&(identical(other.selectedRefund, selectedRefund) || other.selectedRefund == selectedRefund)&&const DeepCollectionEquality().equals(other.disputes, disputes)&&(identical(other.filterStatus, filterStatus) || other.filterStatus == filterStatus)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(refunds),selectedRefund,const DeepCollectionEquality().hash(disputes),filterStatus,isLoading,errorMessage);

@override
String toString() {
  return 'DisputeState(refunds: $refunds, selectedRefund: $selectedRefund, disputes: $disputes, filterStatus: $filterStatus, isLoading: $isLoading, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $DisputeStateCopyWith<$Res>  {
  factory $DisputeStateCopyWith(DisputeState value, $Res Function(DisputeState) _then) = _$DisputeStateCopyWithImpl;
@useResult
$Res call({
 List<RefundModel> refunds, RefundModel? selectedRefund, List<RefundDisputeModel> disputes, String? filterStatus, bool isLoading, String? errorMessage
});


$RefundModelCopyWith<$Res>? get selectedRefund;

}
/// @nodoc
class _$DisputeStateCopyWithImpl<$Res>
    implements $DisputeStateCopyWith<$Res> {
  _$DisputeStateCopyWithImpl(this._self, this._then);

  final DisputeState _self;
  final $Res Function(DisputeState) _then;

/// Create a copy of DisputeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? refunds = null,Object? selectedRefund = freezed,Object? disputes = null,Object? filterStatus = freezed,Object? isLoading = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
refunds: null == refunds ? _self.refunds : refunds // ignore: cast_nullable_to_non_nullable
as List<RefundModel>,selectedRefund: freezed == selectedRefund ? _self.selectedRefund : selectedRefund // ignore: cast_nullable_to_non_nullable
as RefundModel?,disputes: null == disputes ? _self.disputes : disputes // ignore: cast_nullable_to_non_nullable
as List<RefundDisputeModel>,filterStatus: freezed == filterStatus ? _self.filterStatus : filterStatus // ignore: cast_nullable_to_non_nullable
as String?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of DisputeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RefundModelCopyWith<$Res>? get selectedRefund {
    if (_self.selectedRefund == null) {
    return null;
  }

  return $RefundModelCopyWith<$Res>(_self.selectedRefund!, (value) {
    return _then(_self.copyWith(selectedRefund: value));
  });
}
}


/// Adds pattern-matching-related methods to [DisputeState].
extension DisputeStatePatterns on DisputeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DisputeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DisputeState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DisputeState value)  $default,){
final _that = this;
switch (_that) {
case _DisputeState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DisputeState value)?  $default,){
final _that = this;
switch (_that) {
case _DisputeState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<RefundModel> refunds,  RefundModel? selectedRefund,  List<RefundDisputeModel> disputes,  String? filterStatus,  bool isLoading,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DisputeState() when $default != null:
return $default(_that.refunds,_that.selectedRefund,_that.disputes,_that.filterStatus,_that.isLoading,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<RefundModel> refunds,  RefundModel? selectedRefund,  List<RefundDisputeModel> disputes,  String? filterStatus,  bool isLoading,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _DisputeState():
return $default(_that.refunds,_that.selectedRefund,_that.disputes,_that.filterStatus,_that.isLoading,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<RefundModel> refunds,  RefundModel? selectedRefund,  List<RefundDisputeModel> disputes,  String? filterStatus,  bool isLoading,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _DisputeState() when $default != null:
return $default(_that.refunds,_that.selectedRefund,_that.disputes,_that.filterStatus,_that.isLoading,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _DisputeState extends DisputeState {
  const _DisputeState({final  List<RefundModel> refunds = const [], this.selectedRefund, final  List<RefundDisputeModel> disputes = const [], this.filterStatus, this.isLoading = false, this.errorMessage}): _refunds = refunds,_disputes = disputes,super._();
  

 final  List<RefundModel> _refunds;
@override@JsonKey() List<RefundModel> get refunds {
  if (_refunds is EqualUnmodifiableListView) return _refunds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_refunds);
}

@override final  RefundModel? selectedRefund;
 final  List<RefundDisputeModel> _disputes;
@override@JsonKey() List<RefundDisputeModel> get disputes {
  if (_disputes is EqualUnmodifiableListView) return _disputes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_disputes);
}

@override final  String? filterStatus;
@override@JsonKey() final  bool isLoading;
@override final  String? errorMessage;

/// Create a copy of DisputeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DisputeStateCopyWith<_DisputeState> get copyWith => __$DisputeStateCopyWithImpl<_DisputeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DisputeState&&const DeepCollectionEquality().equals(other._refunds, _refunds)&&(identical(other.selectedRefund, selectedRefund) || other.selectedRefund == selectedRefund)&&const DeepCollectionEquality().equals(other._disputes, _disputes)&&(identical(other.filterStatus, filterStatus) || other.filterStatus == filterStatus)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_refunds),selectedRefund,const DeepCollectionEquality().hash(_disputes),filterStatus,isLoading,errorMessage);

@override
String toString() {
  return 'DisputeState(refunds: $refunds, selectedRefund: $selectedRefund, disputes: $disputes, filterStatus: $filterStatus, isLoading: $isLoading, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$DisputeStateCopyWith<$Res> implements $DisputeStateCopyWith<$Res> {
  factory _$DisputeStateCopyWith(_DisputeState value, $Res Function(_DisputeState) _then) = __$DisputeStateCopyWithImpl;
@override @useResult
$Res call({
 List<RefundModel> refunds, RefundModel? selectedRefund, List<RefundDisputeModel> disputes, String? filterStatus, bool isLoading, String? errorMessage
});


@override $RefundModelCopyWith<$Res>? get selectedRefund;

}
/// @nodoc
class __$DisputeStateCopyWithImpl<$Res>
    implements _$DisputeStateCopyWith<$Res> {
  __$DisputeStateCopyWithImpl(this._self, this._then);

  final _DisputeState _self;
  final $Res Function(_DisputeState) _then;

/// Create a copy of DisputeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? refunds = null,Object? selectedRefund = freezed,Object? disputes = null,Object? filterStatus = freezed,Object? isLoading = null,Object? errorMessage = freezed,}) {
  return _then(_DisputeState(
refunds: null == refunds ? _self._refunds : refunds // ignore: cast_nullable_to_non_nullable
as List<RefundModel>,selectedRefund: freezed == selectedRefund ? _self.selectedRefund : selectedRefund // ignore: cast_nullable_to_non_nullable
as RefundModel?,disputes: null == disputes ? _self._disputes : disputes // ignore: cast_nullable_to_non_nullable
as List<RefundDisputeModel>,filterStatus: freezed == filterStatus ? _self.filterStatus : filterStatus // ignore: cast_nullable_to_non_nullable
as String?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of DisputeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RefundModelCopyWith<$Res>? get selectedRefund {
    if (_self.selectedRefund == null) {
    return null;
  }

  return $RefundModelCopyWith<$Res>(_self.selectedRefund!, (value) {
    return _then(_self.copyWith(selectedRefund: value));
  });
}
}

// dart format on
