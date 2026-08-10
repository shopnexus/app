// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'help_ticket_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

FaqItem _$FaqItemFromJson(Map<String, dynamic> json) {
  return _FaqItem.fromJson(json);
}

/// @nodoc
mixin _$FaqItem {
  String get id => throw _privateConstructorUsedError;
  String get question => throw _privateConstructorUsedError;
  String get answer => throw _privateConstructorUsedError;

  /// Serializes this FaqItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FaqItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FaqItemCopyWith<FaqItem> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FaqItemCopyWith<$Res> {
  factory $FaqItemCopyWith(FaqItem value, $Res Function(FaqItem) then) =
      _$FaqItemCopyWithImpl<$Res, FaqItem>;
  @useResult
  $Res call({String id, String question, String answer});
}

/// @nodoc
class _$FaqItemCopyWithImpl<$Res, $Val extends FaqItem>
    implements $FaqItemCopyWith<$Res> {
  _$FaqItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FaqItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? question = null,
    Object? answer = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            question: null == question
                ? _value.question
                : question // ignore: cast_nullable_to_non_nullable
                      as String,
            answer: null == answer
                ? _value.answer
                : answer // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FaqItemImplCopyWith<$Res> implements $FaqItemCopyWith<$Res> {
  factory _$$FaqItemImplCopyWith(
    _$FaqItemImpl value,
    $Res Function(_$FaqItemImpl) then,
  ) = __$$FaqItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String question, String answer});
}

/// @nodoc
class __$$FaqItemImplCopyWithImpl<$Res>
    extends _$FaqItemCopyWithImpl<$Res, _$FaqItemImpl>
    implements _$$FaqItemImplCopyWith<$Res> {
  __$$FaqItemImplCopyWithImpl(
    _$FaqItemImpl _value,
    $Res Function(_$FaqItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FaqItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? question = null,
    Object? answer = null,
  }) {
    return _then(
      _$FaqItemImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        question: null == question
            ? _value.question
            : question // ignore: cast_nullable_to_non_nullable
                  as String,
        answer: null == answer
            ? _value.answer
            : answer // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FaqItemImpl implements _FaqItem {
  const _$FaqItemImpl({
    required this.id,
    required this.question,
    required this.answer,
  });

  factory _$FaqItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$FaqItemImplFromJson(json);

  @override
  final String id;
  @override
  final String question;
  @override
  final String answer;

  @override
  String toString() {
    return 'FaqItem(id: $id, question: $question, answer: $answer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FaqItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.answer, answer) || other.answer == answer));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, question, answer);

  /// Create a copy of FaqItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FaqItemImplCopyWith<_$FaqItemImpl> get copyWith =>
      __$$FaqItemImplCopyWithImpl<_$FaqItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FaqItemImplToJson(this);
  }
}

abstract class _FaqItem implements FaqItem {
  const factory _FaqItem({
    required final String id,
    required final String question,
    required final String answer,
  }) = _$FaqItemImpl;

  factory _FaqItem.fromJson(Map<String, dynamic> json) = _$FaqItemImpl.fromJson;

  @override
  String get id;
  @override
  String get question;
  @override
  String get answer;

  /// Create a copy of FaqItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FaqItemImplCopyWith<_$FaqItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
