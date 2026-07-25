// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatMessageMetadata {

@JsonKey(name: 'image_url') String? get imageUrl;@JsonKey(name: 'product_id') String? get productId;@JsonKey(name: 'product_title') String? get productTitle;@JsonKey(name: 'product_image') String? get productImage;@JsonKey(name: 'product_price') double? get productPrice;@JsonKey(name: 'offer_price') double? get offerPrice;@JsonKey(name: 'offer_original_price') double? get offerOriginalPrice;@JsonKey(name: 'offer_note') String? get offerNote;@JsonKey(name: 'offer_status') OfferStatus? get offerStatus;@JsonKey(name: 'custom_data') Map<String, dynamic>? get customData;
/// Create a copy of ChatMessageMetadata
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatMessageMetadataCopyWith<ChatMessageMetadata> get copyWith => _$ChatMessageMetadataCopyWithImpl<ChatMessageMetadata>(this as ChatMessageMetadata, _$identity);

  /// Serializes this ChatMessageMetadata to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatMessageMetadata&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.productTitle, productTitle) || other.productTitle == productTitle)&&(identical(other.productImage, productImage) || other.productImage == productImage)&&(identical(other.productPrice, productPrice) || other.productPrice == productPrice)&&(identical(other.offerPrice, offerPrice) || other.offerPrice == offerPrice)&&(identical(other.offerOriginalPrice, offerOriginalPrice) || other.offerOriginalPrice == offerOriginalPrice)&&(identical(other.offerNote, offerNote) || other.offerNote == offerNote)&&(identical(other.offerStatus, offerStatus) || other.offerStatus == offerStatus)&&const DeepCollectionEquality().equals(other.customData, customData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,imageUrl,productId,productTitle,productImage,productPrice,offerPrice,offerOriginalPrice,offerNote,offerStatus,const DeepCollectionEquality().hash(customData));

@override
String toString() {
  return 'ChatMessageMetadata(imageUrl: $imageUrl, productId: $productId, productTitle: $productTitle, productImage: $productImage, productPrice: $productPrice, offerPrice: $offerPrice, offerOriginalPrice: $offerOriginalPrice, offerNote: $offerNote, offerStatus: $offerStatus, customData: $customData)';
}


}

/// @nodoc
abstract mixin class $ChatMessageMetadataCopyWith<$Res>  {
  factory $ChatMessageMetadataCopyWith(ChatMessageMetadata value, $Res Function(ChatMessageMetadata) _then) = _$ChatMessageMetadataCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'image_url') String? imageUrl,@JsonKey(name: 'product_id') String? productId,@JsonKey(name: 'product_title') String? productTitle,@JsonKey(name: 'product_image') String? productImage,@JsonKey(name: 'product_price') double? productPrice,@JsonKey(name: 'offer_price') double? offerPrice,@JsonKey(name: 'offer_original_price') double? offerOriginalPrice,@JsonKey(name: 'offer_note') String? offerNote,@JsonKey(name: 'offer_status') OfferStatus? offerStatus,@JsonKey(name: 'custom_data') Map<String, dynamic>? customData
});




}
/// @nodoc
class _$ChatMessageMetadataCopyWithImpl<$Res>
    implements $ChatMessageMetadataCopyWith<$Res> {
  _$ChatMessageMetadataCopyWithImpl(this._self, this._then);

  final ChatMessageMetadata _self;
  final $Res Function(ChatMessageMetadata) _then;

/// Create a copy of ChatMessageMetadata
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? imageUrl = freezed,Object? productId = freezed,Object? productTitle = freezed,Object? productImage = freezed,Object? productPrice = freezed,Object? offerPrice = freezed,Object? offerOriginalPrice = freezed,Object? offerNote = freezed,Object? offerStatus = freezed,Object? customData = freezed,}) {
  return _then(_self.copyWith(
imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,productId: freezed == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String?,productTitle: freezed == productTitle ? _self.productTitle : productTitle // ignore: cast_nullable_to_non_nullable
as String?,productImage: freezed == productImage ? _self.productImage : productImage // ignore: cast_nullable_to_non_nullable
as String?,productPrice: freezed == productPrice ? _self.productPrice : productPrice // ignore: cast_nullable_to_non_nullable
as double?,offerPrice: freezed == offerPrice ? _self.offerPrice : offerPrice // ignore: cast_nullable_to_non_nullable
as double?,offerOriginalPrice: freezed == offerOriginalPrice ? _self.offerOriginalPrice : offerOriginalPrice // ignore: cast_nullable_to_non_nullable
as double?,offerNote: freezed == offerNote ? _self.offerNote : offerNote // ignore: cast_nullable_to_non_nullable
as String?,offerStatus: freezed == offerStatus ? _self.offerStatus : offerStatus // ignore: cast_nullable_to_non_nullable
as OfferStatus?,customData: freezed == customData ? _self.customData : customData // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatMessageMetadata].
extension ChatMessageMetadataPatterns on ChatMessageMetadata {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatMessageMetadata value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatMessageMetadata() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatMessageMetadata value)  $default,){
final _that = this;
switch (_that) {
case _ChatMessageMetadata():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatMessageMetadata value)?  $default,){
final _that = this;
switch (_that) {
case _ChatMessageMetadata() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'image_url')  String? imageUrl, @JsonKey(name: 'product_id')  String? productId, @JsonKey(name: 'product_title')  String? productTitle, @JsonKey(name: 'product_image')  String? productImage, @JsonKey(name: 'product_price')  double? productPrice, @JsonKey(name: 'offer_price')  double? offerPrice, @JsonKey(name: 'offer_original_price')  double? offerOriginalPrice, @JsonKey(name: 'offer_note')  String? offerNote, @JsonKey(name: 'offer_status')  OfferStatus? offerStatus, @JsonKey(name: 'custom_data')  Map<String, dynamic>? customData)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatMessageMetadata() when $default != null:
return $default(_that.imageUrl,_that.productId,_that.productTitle,_that.productImage,_that.productPrice,_that.offerPrice,_that.offerOriginalPrice,_that.offerNote,_that.offerStatus,_that.customData);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'image_url')  String? imageUrl, @JsonKey(name: 'product_id')  String? productId, @JsonKey(name: 'product_title')  String? productTitle, @JsonKey(name: 'product_image')  String? productImage, @JsonKey(name: 'product_price')  double? productPrice, @JsonKey(name: 'offer_price')  double? offerPrice, @JsonKey(name: 'offer_original_price')  double? offerOriginalPrice, @JsonKey(name: 'offer_note')  String? offerNote, @JsonKey(name: 'offer_status')  OfferStatus? offerStatus, @JsonKey(name: 'custom_data')  Map<String, dynamic>? customData)  $default,) {final _that = this;
switch (_that) {
case _ChatMessageMetadata():
return $default(_that.imageUrl,_that.productId,_that.productTitle,_that.productImage,_that.productPrice,_that.offerPrice,_that.offerOriginalPrice,_that.offerNote,_that.offerStatus,_that.customData);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'image_url')  String? imageUrl, @JsonKey(name: 'product_id')  String? productId, @JsonKey(name: 'product_title')  String? productTitle, @JsonKey(name: 'product_image')  String? productImage, @JsonKey(name: 'product_price')  double? productPrice, @JsonKey(name: 'offer_price')  double? offerPrice, @JsonKey(name: 'offer_original_price')  double? offerOriginalPrice, @JsonKey(name: 'offer_note')  String? offerNote, @JsonKey(name: 'offer_status')  OfferStatus? offerStatus, @JsonKey(name: 'custom_data')  Map<String, dynamic>? customData)?  $default,) {final _that = this;
switch (_that) {
case _ChatMessageMetadata() when $default != null:
return $default(_that.imageUrl,_that.productId,_that.productTitle,_that.productImage,_that.productPrice,_that.offerPrice,_that.offerOriginalPrice,_that.offerNote,_that.offerStatus,_that.customData);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatMessageMetadata implements ChatMessageMetadata {
  const _ChatMessageMetadata({@JsonKey(name: 'image_url') this.imageUrl, @JsonKey(name: 'product_id') this.productId, @JsonKey(name: 'product_title') this.productTitle, @JsonKey(name: 'product_image') this.productImage, @JsonKey(name: 'product_price') this.productPrice, @JsonKey(name: 'offer_price') this.offerPrice, @JsonKey(name: 'offer_original_price') this.offerOriginalPrice, @JsonKey(name: 'offer_note') this.offerNote, @JsonKey(name: 'offer_status') this.offerStatus, @JsonKey(name: 'custom_data') final  Map<String, dynamic>? customData}): _customData = customData;
  factory _ChatMessageMetadata.fromJson(Map<String, dynamic> json) => _$ChatMessageMetadataFromJson(json);

@override@JsonKey(name: 'image_url') final  String? imageUrl;
@override@JsonKey(name: 'product_id') final  String? productId;
@override@JsonKey(name: 'product_title') final  String? productTitle;
@override@JsonKey(name: 'product_image') final  String? productImage;
@override@JsonKey(name: 'product_price') final  double? productPrice;
@override@JsonKey(name: 'offer_price') final  double? offerPrice;
@override@JsonKey(name: 'offer_original_price') final  double? offerOriginalPrice;
@override@JsonKey(name: 'offer_note') final  String? offerNote;
@override@JsonKey(name: 'offer_status') final  OfferStatus? offerStatus;
 final  Map<String, dynamic>? _customData;
@override@JsonKey(name: 'custom_data') Map<String, dynamic>? get customData {
  final value = _customData;
  if (value == null) return null;
  if (_customData is EqualUnmodifiableMapView) return _customData;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of ChatMessageMetadata
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatMessageMetadataCopyWith<_ChatMessageMetadata> get copyWith => __$ChatMessageMetadataCopyWithImpl<_ChatMessageMetadata>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatMessageMetadataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatMessageMetadata&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.productTitle, productTitle) || other.productTitle == productTitle)&&(identical(other.productImage, productImage) || other.productImage == productImage)&&(identical(other.productPrice, productPrice) || other.productPrice == productPrice)&&(identical(other.offerPrice, offerPrice) || other.offerPrice == offerPrice)&&(identical(other.offerOriginalPrice, offerOriginalPrice) || other.offerOriginalPrice == offerOriginalPrice)&&(identical(other.offerNote, offerNote) || other.offerNote == offerNote)&&(identical(other.offerStatus, offerStatus) || other.offerStatus == offerStatus)&&const DeepCollectionEquality().equals(other._customData, _customData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,imageUrl,productId,productTitle,productImage,productPrice,offerPrice,offerOriginalPrice,offerNote,offerStatus,const DeepCollectionEquality().hash(_customData));

@override
String toString() {
  return 'ChatMessageMetadata(imageUrl: $imageUrl, productId: $productId, productTitle: $productTitle, productImage: $productImage, productPrice: $productPrice, offerPrice: $offerPrice, offerOriginalPrice: $offerOriginalPrice, offerNote: $offerNote, offerStatus: $offerStatus, customData: $customData)';
}


}

/// @nodoc
abstract mixin class _$ChatMessageMetadataCopyWith<$Res> implements $ChatMessageMetadataCopyWith<$Res> {
  factory _$ChatMessageMetadataCopyWith(_ChatMessageMetadata value, $Res Function(_ChatMessageMetadata) _then) = __$ChatMessageMetadataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'image_url') String? imageUrl,@JsonKey(name: 'product_id') String? productId,@JsonKey(name: 'product_title') String? productTitle,@JsonKey(name: 'product_image') String? productImage,@JsonKey(name: 'product_price') double? productPrice,@JsonKey(name: 'offer_price') double? offerPrice,@JsonKey(name: 'offer_original_price') double? offerOriginalPrice,@JsonKey(name: 'offer_note') String? offerNote,@JsonKey(name: 'offer_status') OfferStatus? offerStatus,@JsonKey(name: 'custom_data') Map<String, dynamic>? customData
});




}
/// @nodoc
class __$ChatMessageMetadataCopyWithImpl<$Res>
    implements _$ChatMessageMetadataCopyWith<$Res> {
  __$ChatMessageMetadataCopyWithImpl(this._self, this._then);

  final _ChatMessageMetadata _self;
  final $Res Function(_ChatMessageMetadata) _then;

/// Create a copy of ChatMessageMetadata
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? imageUrl = freezed,Object? productId = freezed,Object? productTitle = freezed,Object? productImage = freezed,Object? productPrice = freezed,Object? offerPrice = freezed,Object? offerOriginalPrice = freezed,Object? offerNote = freezed,Object? offerStatus = freezed,Object? customData = freezed,}) {
  return _then(_ChatMessageMetadata(
imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,productId: freezed == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String?,productTitle: freezed == productTitle ? _self.productTitle : productTitle // ignore: cast_nullable_to_non_nullable
as String?,productImage: freezed == productImage ? _self.productImage : productImage // ignore: cast_nullable_to_non_nullable
as String?,productPrice: freezed == productPrice ? _self.productPrice : productPrice // ignore: cast_nullable_to_non_nullable
as double?,offerPrice: freezed == offerPrice ? _self.offerPrice : offerPrice // ignore: cast_nullable_to_non_nullable
as double?,offerOriginalPrice: freezed == offerOriginalPrice ? _self.offerOriginalPrice : offerOriginalPrice // ignore: cast_nullable_to_non_nullable
as double?,offerNote: freezed == offerNote ? _self.offerNote : offerNote // ignore: cast_nullable_to_non_nullable
as String?,offerStatus: freezed == offerStatus ? _self.offerStatus : offerStatus // ignore: cast_nullable_to_non_nullable
as OfferStatus?,customData: freezed == customData ? _self._customData : customData // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}


/// @nodoc
mixin _$ChatMessage {

 String get id;@JsonKey(name: 'conversation_id') String get conversationId;@JsonKey(name: 'sender_id') String get senderId;@JsonKey(name: 'sender_name') String? get senderName;@JsonKey(name: 'sender_avatar') String? get senderAvatar;@JsonKey(name: 'recipient_id') String? get recipientId; MessageType get type; String get content;@JsonKey(name: 'metadata') ChatMessageMetadata? get metadata;@JsonKey(name: 'is_me') bool get isMe; MessageStatus get status;@JsonKey(name: 'created_at') DateTime get createdAt;
/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatMessageCopyWith<ChatMessage> get copyWith => _$ChatMessageCopyWithImpl<ChatMessage>(this as ChatMessage, _$identity);

  /// Serializes this ChatMessage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatMessage&&(identical(other.id, id) || other.id == id)&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId)&&(identical(other.senderId, senderId) || other.senderId == senderId)&&(identical(other.senderName, senderName) || other.senderName == senderName)&&(identical(other.senderAvatar, senderAvatar) || other.senderAvatar == senderAvatar)&&(identical(other.recipientId, recipientId) || other.recipientId == recipientId)&&(identical(other.type, type) || other.type == type)&&(identical(other.content, content) || other.content == content)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&(identical(other.isMe, isMe) || other.isMe == isMe)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,conversationId,senderId,senderName,senderAvatar,recipientId,type,content,metadata,isMe,status,createdAt);

@override
String toString() {
  return 'ChatMessage(id: $id, conversationId: $conversationId, senderId: $senderId, senderName: $senderName, senderAvatar: $senderAvatar, recipientId: $recipientId, type: $type, content: $content, metadata: $metadata, isMe: $isMe, status: $status, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $ChatMessageCopyWith<$Res>  {
  factory $ChatMessageCopyWith(ChatMessage value, $Res Function(ChatMessage) _then) = _$ChatMessageCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'conversation_id') String conversationId,@JsonKey(name: 'sender_id') String senderId,@JsonKey(name: 'sender_name') String? senderName,@JsonKey(name: 'sender_avatar') String? senderAvatar,@JsonKey(name: 'recipient_id') String? recipientId, MessageType type, String content,@JsonKey(name: 'metadata') ChatMessageMetadata? metadata,@JsonKey(name: 'is_me') bool isMe, MessageStatus status,@JsonKey(name: 'created_at') DateTime createdAt
});


$ChatMessageMetadataCopyWith<$Res>? get metadata;

}
/// @nodoc
class _$ChatMessageCopyWithImpl<$Res>
    implements $ChatMessageCopyWith<$Res> {
  _$ChatMessageCopyWithImpl(this._self, this._then);

  final ChatMessage _self;
  final $Res Function(ChatMessage) _then;

/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? conversationId = null,Object? senderId = null,Object? senderName = freezed,Object? senderAvatar = freezed,Object? recipientId = freezed,Object? type = null,Object? content = null,Object? metadata = freezed,Object? isMe = null,Object? status = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,conversationId: null == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String,senderId: null == senderId ? _self.senderId : senderId // ignore: cast_nullable_to_non_nullable
as String,senderName: freezed == senderName ? _self.senderName : senderName // ignore: cast_nullable_to_non_nullable
as String?,senderAvatar: freezed == senderAvatar ? _self.senderAvatar : senderAvatar // ignore: cast_nullable_to_non_nullable
as String?,recipientId: freezed == recipientId ? _self.recipientId : recipientId // ignore: cast_nullable_to_non_nullable
as String?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MessageType,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as ChatMessageMetadata?,isMe: null == isMe ? _self.isMe : isMe // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MessageStatus,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChatMessageMetadataCopyWith<$Res>? get metadata {
    if (_self.metadata == null) {
    return null;
  }

  return $ChatMessageMetadataCopyWith<$Res>(_self.metadata!, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}
}


/// Adds pattern-matching-related methods to [ChatMessage].
extension ChatMessagePatterns on ChatMessage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatMessage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatMessage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatMessage value)  $default,){
final _that = this;
switch (_that) {
case _ChatMessage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatMessage value)?  $default,){
final _that = this;
switch (_that) {
case _ChatMessage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'conversation_id')  String conversationId, @JsonKey(name: 'sender_id')  String senderId, @JsonKey(name: 'sender_name')  String? senderName, @JsonKey(name: 'sender_avatar')  String? senderAvatar, @JsonKey(name: 'recipient_id')  String? recipientId,  MessageType type,  String content, @JsonKey(name: 'metadata')  ChatMessageMetadata? metadata, @JsonKey(name: 'is_me')  bool isMe,  MessageStatus status, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatMessage() when $default != null:
return $default(_that.id,_that.conversationId,_that.senderId,_that.senderName,_that.senderAvatar,_that.recipientId,_that.type,_that.content,_that.metadata,_that.isMe,_that.status,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'conversation_id')  String conversationId, @JsonKey(name: 'sender_id')  String senderId, @JsonKey(name: 'sender_name')  String? senderName, @JsonKey(name: 'sender_avatar')  String? senderAvatar, @JsonKey(name: 'recipient_id')  String? recipientId,  MessageType type,  String content, @JsonKey(name: 'metadata')  ChatMessageMetadata? metadata, @JsonKey(name: 'is_me')  bool isMe,  MessageStatus status, @JsonKey(name: 'created_at')  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _ChatMessage():
return $default(_that.id,_that.conversationId,_that.senderId,_that.senderName,_that.senderAvatar,_that.recipientId,_that.type,_that.content,_that.metadata,_that.isMe,_that.status,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'conversation_id')  String conversationId, @JsonKey(name: 'sender_id')  String senderId, @JsonKey(name: 'sender_name')  String? senderName, @JsonKey(name: 'sender_avatar')  String? senderAvatar, @JsonKey(name: 'recipient_id')  String? recipientId,  MessageType type,  String content, @JsonKey(name: 'metadata')  ChatMessageMetadata? metadata, @JsonKey(name: 'is_me')  bool isMe,  MessageStatus status, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _ChatMessage() when $default != null:
return $default(_that.id,_that.conversationId,_that.senderId,_that.senderName,_that.senderAvatar,_that.recipientId,_that.type,_that.content,_that.metadata,_that.isMe,_that.status,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatMessage implements ChatMessage {
  const _ChatMessage({required this.id, @JsonKey(name: 'conversation_id') required this.conversationId, @JsonKey(name: 'sender_id') required this.senderId, @JsonKey(name: 'sender_name') this.senderName, @JsonKey(name: 'sender_avatar') this.senderAvatar, @JsonKey(name: 'recipient_id') this.recipientId, this.type = MessageType.text, required this.content, @JsonKey(name: 'metadata') this.metadata, @JsonKey(name: 'is_me') this.isMe = false, this.status = MessageStatus.sent, @JsonKey(name: 'created_at') required this.createdAt});
  factory _ChatMessage.fromJson(Map<String, dynamic> json) => _$ChatMessageFromJson(json);

@override final  String id;
@override@JsonKey(name: 'conversation_id') final  String conversationId;
@override@JsonKey(name: 'sender_id') final  String senderId;
@override@JsonKey(name: 'sender_name') final  String? senderName;
@override@JsonKey(name: 'sender_avatar') final  String? senderAvatar;
@override@JsonKey(name: 'recipient_id') final  String? recipientId;
@override@JsonKey() final  MessageType type;
@override final  String content;
@override@JsonKey(name: 'metadata') final  ChatMessageMetadata? metadata;
@override@JsonKey(name: 'is_me') final  bool isMe;
@override@JsonKey() final  MessageStatus status;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;

/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatMessageCopyWith<_ChatMessage> get copyWith => __$ChatMessageCopyWithImpl<_ChatMessage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatMessageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatMessage&&(identical(other.id, id) || other.id == id)&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId)&&(identical(other.senderId, senderId) || other.senderId == senderId)&&(identical(other.senderName, senderName) || other.senderName == senderName)&&(identical(other.senderAvatar, senderAvatar) || other.senderAvatar == senderAvatar)&&(identical(other.recipientId, recipientId) || other.recipientId == recipientId)&&(identical(other.type, type) || other.type == type)&&(identical(other.content, content) || other.content == content)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&(identical(other.isMe, isMe) || other.isMe == isMe)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,conversationId,senderId,senderName,senderAvatar,recipientId,type,content,metadata,isMe,status,createdAt);

@override
String toString() {
  return 'ChatMessage(id: $id, conversationId: $conversationId, senderId: $senderId, senderName: $senderName, senderAvatar: $senderAvatar, recipientId: $recipientId, type: $type, content: $content, metadata: $metadata, isMe: $isMe, status: $status, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ChatMessageCopyWith<$Res> implements $ChatMessageCopyWith<$Res> {
  factory _$ChatMessageCopyWith(_ChatMessage value, $Res Function(_ChatMessage) _then) = __$ChatMessageCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'conversation_id') String conversationId,@JsonKey(name: 'sender_id') String senderId,@JsonKey(name: 'sender_name') String? senderName,@JsonKey(name: 'sender_avatar') String? senderAvatar,@JsonKey(name: 'recipient_id') String? recipientId, MessageType type, String content,@JsonKey(name: 'metadata') ChatMessageMetadata? metadata,@JsonKey(name: 'is_me') bool isMe, MessageStatus status,@JsonKey(name: 'created_at') DateTime createdAt
});


@override $ChatMessageMetadataCopyWith<$Res>? get metadata;

}
/// @nodoc
class __$ChatMessageCopyWithImpl<$Res>
    implements _$ChatMessageCopyWith<$Res> {
  __$ChatMessageCopyWithImpl(this._self, this._then);

  final _ChatMessage _self;
  final $Res Function(_ChatMessage) _then;

/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? conversationId = null,Object? senderId = null,Object? senderName = freezed,Object? senderAvatar = freezed,Object? recipientId = freezed,Object? type = null,Object? content = null,Object? metadata = freezed,Object? isMe = null,Object? status = null,Object? createdAt = null,}) {
  return _then(_ChatMessage(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,conversationId: null == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String,senderId: null == senderId ? _self.senderId : senderId // ignore: cast_nullable_to_non_nullable
as String,senderName: freezed == senderName ? _self.senderName : senderName // ignore: cast_nullable_to_non_nullable
as String?,senderAvatar: freezed == senderAvatar ? _self.senderAvatar : senderAvatar // ignore: cast_nullable_to_non_nullable
as String?,recipientId: freezed == recipientId ? _self.recipientId : recipientId // ignore: cast_nullable_to_non_nullable
as String?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MessageType,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as ChatMessageMetadata?,isMe: null == isMe ? _self.isMe : isMe // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MessageStatus,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChatMessageMetadataCopyWith<$Res>? get metadata {
    if (_self.metadata == null) {
    return null;
  }

  return $ChatMessageMetadataCopyWith<$Res>(_self.metadata!, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}
}


/// @nodoc
mixin _$ChatConversation {

 String get id;@JsonKey(name: 'participant_id') String get participantId;@JsonKey(name: 'participant_name') String get participantName;@JsonKey(name: 'participant_avatar') String? get participantAvatar;@JsonKey(name: 'participant_role') String? get participantRole;@JsonKey(name: 'is_online') bool get isOnline;@JsonKey(name: 'last_message') String? get lastMessage;@JsonKey(name: 'last_message_time') DateTime? get lastMessageTime;@JsonKey(name: 'unread_count') int get unreadCount;@JsonKey(name: 'product_id') String? get productId;@JsonKey(name: 'product_title') String? get productTitle;@JsonKey(name: 'product_image') String? get productImage;@JsonKey(name: 'updated_at') DateTime? get updatedAt;
/// Create a copy of ChatConversation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatConversationCopyWith<ChatConversation> get copyWith => _$ChatConversationCopyWithImpl<ChatConversation>(this as ChatConversation, _$identity);

  /// Serializes this ChatConversation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatConversation&&(identical(other.id, id) || other.id == id)&&(identical(other.participantId, participantId) || other.participantId == participantId)&&(identical(other.participantName, participantName) || other.participantName == participantName)&&(identical(other.participantAvatar, participantAvatar) || other.participantAvatar == participantAvatar)&&(identical(other.participantRole, participantRole) || other.participantRole == participantRole)&&(identical(other.isOnline, isOnline) || other.isOnline == isOnline)&&(identical(other.lastMessage, lastMessage) || other.lastMessage == lastMessage)&&(identical(other.lastMessageTime, lastMessageTime) || other.lastMessageTime == lastMessageTime)&&(identical(other.unreadCount, unreadCount) || other.unreadCount == unreadCount)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.productTitle, productTitle) || other.productTitle == productTitle)&&(identical(other.productImage, productImage) || other.productImage == productImage)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,participantId,participantName,participantAvatar,participantRole,isOnline,lastMessage,lastMessageTime,unreadCount,productId,productTitle,productImage,updatedAt);

@override
String toString() {
  return 'ChatConversation(id: $id, participantId: $participantId, participantName: $participantName, participantAvatar: $participantAvatar, participantRole: $participantRole, isOnline: $isOnline, lastMessage: $lastMessage, lastMessageTime: $lastMessageTime, unreadCount: $unreadCount, productId: $productId, productTitle: $productTitle, productImage: $productImage, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ChatConversationCopyWith<$Res>  {
  factory $ChatConversationCopyWith(ChatConversation value, $Res Function(ChatConversation) _then) = _$ChatConversationCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'participant_id') String participantId,@JsonKey(name: 'participant_name') String participantName,@JsonKey(name: 'participant_avatar') String? participantAvatar,@JsonKey(name: 'participant_role') String? participantRole,@JsonKey(name: 'is_online') bool isOnline,@JsonKey(name: 'last_message') String? lastMessage,@JsonKey(name: 'last_message_time') DateTime? lastMessageTime,@JsonKey(name: 'unread_count') int unreadCount,@JsonKey(name: 'product_id') String? productId,@JsonKey(name: 'product_title') String? productTitle,@JsonKey(name: 'product_image') String? productImage,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class _$ChatConversationCopyWithImpl<$Res>
    implements $ChatConversationCopyWith<$Res> {
  _$ChatConversationCopyWithImpl(this._self, this._then);

  final ChatConversation _self;
  final $Res Function(ChatConversation) _then;

/// Create a copy of ChatConversation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? participantId = null,Object? participantName = null,Object? participantAvatar = freezed,Object? participantRole = freezed,Object? isOnline = null,Object? lastMessage = freezed,Object? lastMessageTime = freezed,Object? unreadCount = null,Object? productId = freezed,Object? productTitle = freezed,Object? productImage = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,participantId: null == participantId ? _self.participantId : participantId // ignore: cast_nullable_to_non_nullable
as String,participantName: null == participantName ? _self.participantName : participantName // ignore: cast_nullable_to_non_nullable
as String,participantAvatar: freezed == participantAvatar ? _self.participantAvatar : participantAvatar // ignore: cast_nullable_to_non_nullable
as String?,participantRole: freezed == participantRole ? _self.participantRole : participantRole // ignore: cast_nullable_to_non_nullable
as String?,isOnline: null == isOnline ? _self.isOnline : isOnline // ignore: cast_nullable_to_non_nullable
as bool,lastMessage: freezed == lastMessage ? _self.lastMessage : lastMessage // ignore: cast_nullable_to_non_nullable
as String?,lastMessageTime: freezed == lastMessageTime ? _self.lastMessageTime : lastMessageTime // ignore: cast_nullable_to_non_nullable
as DateTime?,unreadCount: null == unreadCount ? _self.unreadCount : unreadCount // ignore: cast_nullable_to_non_nullable
as int,productId: freezed == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String?,productTitle: freezed == productTitle ? _self.productTitle : productTitle // ignore: cast_nullable_to_non_nullable
as String?,productImage: freezed == productImage ? _self.productImage : productImage // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatConversation].
extension ChatConversationPatterns on ChatConversation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatConversation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatConversation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatConversation value)  $default,){
final _that = this;
switch (_that) {
case _ChatConversation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatConversation value)?  $default,){
final _that = this;
switch (_that) {
case _ChatConversation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'participant_id')  String participantId, @JsonKey(name: 'participant_name')  String participantName, @JsonKey(name: 'participant_avatar')  String? participantAvatar, @JsonKey(name: 'participant_role')  String? participantRole, @JsonKey(name: 'is_online')  bool isOnline, @JsonKey(name: 'last_message')  String? lastMessage, @JsonKey(name: 'last_message_time')  DateTime? lastMessageTime, @JsonKey(name: 'unread_count')  int unreadCount, @JsonKey(name: 'product_id')  String? productId, @JsonKey(name: 'product_title')  String? productTitle, @JsonKey(name: 'product_image')  String? productImage, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatConversation() when $default != null:
return $default(_that.id,_that.participantId,_that.participantName,_that.participantAvatar,_that.participantRole,_that.isOnline,_that.lastMessage,_that.lastMessageTime,_that.unreadCount,_that.productId,_that.productTitle,_that.productImage,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'participant_id')  String participantId, @JsonKey(name: 'participant_name')  String participantName, @JsonKey(name: 'participant_avatar')  String? participantAvatar, @JsonKey(name: 'participant_role')  String? participantRole, @JsonKey(name: 'is_online')  bool isOnline, @JsonKey(name: 'last_message')  String? lastMessage, @JsonKey(name: 'last_message_time')  DateTime? lastMessageTime, @JsonKey(name: 'unread_count')  int unreadCount, @JsonKey(name: 'product_id')  String? productId, @JsonKey(name: 'product_title')  String? productTitle, @JsonKey(name: 'product_image')  String? productImage, @JsonKey(name: 'updated_at')  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _ChatConversation():
return $default(_that.id,_that.participantId,_that.participantName,_that.participantAvatar,_that.participantRole,_that.isOnline,_that.lastMessage,_that.lastMessageTime,_that.unreadCount,_that.productId,_that.productTitle,_that.productImage,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'participant_id')  String participantId, @JsonKey(name: 'participant_name')  String participantName, @JsonKey(name: 'participant_avatar')  String? participantAvatar, @JsonKey(name: 'participant_role')  String? participantRole, @JsonKey(name: 'is_online')  bool isOnline, @JsonKey(name: 'last_message')  String? lastMessage, @JsonKey(name: 'last_message_time')  DateTime? lastMessageTime, @JsonKey(name: 'unread_count')  int unreadCount, @JsonKey(name: 'product_id')  String? productId, @JsonKey(name: 'product_title')  String? productTitle, @JsonKey(name: 'product_image')  String? productImage, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ChatConversation() when $default != null:
return $default(_that.id,_that.participantId,_that.participantName,_that.participantAvatar,_that.participantRole,_that.isOnline,_that.lastMessage,_that.lastMessageTime,_that.unreadCount,_that.productId,_that.productTitle,_that.productImage,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatConversation implements ChatConversation {
  const _ChatConversation({required this.id, @JsonKey(name: 'participant_id') required this.participantId, @JsonKey(name: 'participant_name') required this.participantName, @JsonKey(name: 'participant_avatar') this.participantAvatar, @JsonKey(name: 'participant_role') this.participantRole, @JsonKey(name: 'is_online') this.isOnline = false, @JsonKey(name: 'last_message') this.lastMessage, @JsonKey(name: 'last_message_time') this.lastMessageTime, @JsonKey(name: 'unread_count') this.unreadCount = 0, @JsonKey(name: 'product_id') this.productId, @JsonKey(name: 'product_title') this.productTitle, @JsonKey(name: 'product_image') this.productImage, @JsonKey(name: 'updated_at') this.updatedAt});
  factory _ChatConversation.fromJson(Map<String, dynamic> json) => _$ChatConversationFromJson(json);

@override final  String id;
@override@JsonKey(name: 'participant_id') final  String participantId;
@override@JsonKey(name: 'participant_name') final  String participantName;
@override@JsonKey(name: 'participant_avatar') final  String? participantAvatar;
@override@JsonKey(name: 'participant_role') final  String? participantRole;
@override@JsonKey(name: 'is_online') final  bool isOnline;
@override@JsonKey(name: 'last_message') final  String? lastMessage;
@override@JsonKey(name: 'last_message_time') final  DateTime? lastMessageTime;
@override@JsonKey(name: 'unread_count') final  int unreadCount;
@override@JsonKey(name: 'product_id') final  String? productId;
@override@JsonKey(name: 'product_title') final  String? productTitle;
@override@JsonKey(name: 'product_image') final  String? productImage;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;

/// Create a copy of ChatConversation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatConversationCopyWith<_ChatConversation> get copyWith => __$ChatConversationCopyWithImpl<_ChatConversation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatConversationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatConversation&&(identical(other.id, id) || other.id == id)&&(identical(other.participantId, participantId) || other.participantId == participantId)&&(identical(other.participantName, participantName) || other.participantName == participantName)&&(identical(other.participantAvatar, participantAvatar) || other.participantAvatar == participantAvatar)&&(identical(other.participantRole, participantRole) || other.participantRole == participantRole)&&(identical(other.isOnline, isOnline) || other.isOnline == isOnline)&&(identical(other.lastMessage, lastMessage) || other.lastMessage == lastMessage)&&(identical(other.lastMessageTime, lastMessageTime) || other.lastMessageTime == lastMessageTime)&&(identical(other.unreadCount, unreadCount) || other.unreadCount == unreadCount)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.productTitle, productTitle) || other.productTitle == productTitle)&&(identical(other.productImage, productImage) || other.productImage == productImage)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,participantId,participantName,participantAvatar,participantRole,isOnline,lastMessage,lastMessageTime,unreadCount,productId,productTitle,productImage,updatedAt);

@override
String toString() {
  return 'ChatConversation(id: $id, participantId: $participantId, participantName: $participantName, participantAvatar: $participantAvatar, participantRole: $participantRole, isOnline: $isOnline, lastMessage: $lastMessage, lastMessageTime: $lastMessageTime, unreadCount: $unreadCount, productId: $productId, productTitle: $productTitle, productImage: $productImage, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ChatConversationCopyWith<$Res> implements $ChatConversationCopyWith<$Res> {
  factory _$ChatConversationCopyWith(_ChatConversation value, $Res Function(_ChatConversation) _then) = __$ChatConversationCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'participant_id') String participantId,@JsonKey(name: 'participant_name') String participantName,@JsonKey(name: 'participant_avatar') String? participantAvatar,@JsonKey(name: 'participant_role') String? participantRole,@JsonKey(name: 'is_online') bool isOnline,@JsonKey(name: 'last_message') String? lastMessage,@JsonKey(name: 'last_message_time') DateTime? lastMessageTime,@JsonKey(name: 'unread_count') int unreadCount,@JsonKey(name: 'product_id') String? productId,@JsonKey(name: 'product_title') String? productTitle,@JsonKey(name: 'product_image') String? productImage,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class __$ChatConversationCopyWithImpl<$Res>
    implements _$ChatConversationCopyWith<$Res> {
  __$ChatConversationCopyWithImpl(this._self, this._then);

  final _ChatConversation _self;
  final $Res Function(_ChatConversation) _then;

/// Create a copy of ChatConversation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? participantId = null,Object? participantName = null,Object? participantAvatar = freezed,Object? participantRole = freezed,Object? isOnline = null,Object? lastMessage = freezed,Object? lastMessageTime = freezed,Object? unreadCount = null,Object? productId = freezed,Object? productTitle = freezed,Object? productImage = freezed,Object? updatedAt = freezed,}) {
  return _then(_ChatConversation(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,participantId: null == participantId ? _self.participantId : participantId // ignore: cast_nullable_to_non_nullable
as String,participantName: null == participantName ? _self.participantName : participantName // ignore: cast_nullable_to_non_nullable
as String,participantAvatar: freezed == participantAvatar ? _self.participantAvatar : participantAvatar // ignore: cast_nullable_to_non_nullable
as String?,participantRole: freezed == participantRole ? _self.participantRole : participantRole // ignore: cast_nullable_to_non_nullable
as String?,isOnline: null == isOnline ? _self.isOnline : isOnline // ignore: cast_nullable_to_non_nullable
as bool,lastMessage: freezed == lastMessage ? _self.lastMessage : lastMessage // ignore: cast_nullable_to_non_nullable
as String?,lastMessageTime: freezed == lastMessageTime ? _self.lastMessageTime : lastMessageTime // ignore: cast_nullable_to_non_nullable
as DateTime?,unreadCount: null == unreadCount ? _self.unreadCount : unreadCount // ignore: cast_nullable_to_non_nullable
as int,productId: freezed == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String?,productTitle: freezed == productTitle ? _self.productTitle : productTitle // ignore: cast_nullable_to_non_nullable
as String?,productImage: freezed == productImage ? _self.productImage : productImage // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
