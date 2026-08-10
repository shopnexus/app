// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ChatListState {
  List<Conversation> get conversations => throw _privateConstructorUsedError;
  String get searchQuery => throw _privateConstructorUsedError;
  String? get nextCursor => throw _privateConstructorUsedError;

  /// Create a copy of ChatListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatListStateCopyWith<ChatListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatListStateCopyWith<$Res> {
  factory $ChatListStateCopyWith(
    ChatListState value,
    $Res Function(ChatListState) then,
  ) = _$ChatListStateCopyWithImpl<$Res, ChatListState>;
  @useResult
  $Res call({
    List<Conversation> conversations,
    String searchQuery,
    String? nextCursor,
  });
}

/// @nodoc
class _$ChatListStateCopyWithImpl<$Res, $Val extends ChatListState>
    implements $ChatListStateCopyWith<$Res> {
  _$ChatListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conversations = null,
    Object? searchQuery = null,
    Object? nextCursor = freezed,
  }) {
    return _then(
      _value.copyWith(
            conversations: null == conversations
                ? _value.conversations
                : conversations // ignore: cast_nullable_to_non_nullable
                      as List<Conversation>,
            searchQuery: null == searchQuery
                ? _value.searchQuery
                : searchQuery // ignore: cast_nullable_to_non_nullable
                      as String,
            nextCursor: freezed == nextCursor
                ? _value.nextCursor
                : nextCursor // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ChatListStateImplCopyWith<$Res>
    implements $ChatListStateCopyWith<$Res> {
  factory _$$ChatListStateImplCopyWith(
    _$ChatListStateImpl value,
    $Res Function(_$ChatListStateImpl) then,
  ) = __$$ChatListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<Conversation> conversations,
    String searchQuery,
    String? nextCursor,
  });
}

/// @nodoc
class __$$ChatListStateImplCopyWithImpl<$Res>
    extends _$ChatListStateCopyWithImpl<$Res, _$ChatListStateImpl>
    implements _$$ChatListStateImplCopyWith<$Res> {
  __$$ChatListStateImplCopyWithImpl(
    _$ChatListStateImpl _value,
    $Res Function(_$ChatListStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conversations = null,
    Object? searchQuery = null,
    Object? nextCursor = freezed,
  }) {
    return _then(
      _$ChatListStateImpl(
        conversations: null == conversations
            ? _value._conversations
            : conversations // ignore: cast_nullable_to_non_nullable
                  as List<Conversation>,
        searchQuery: null == searchQuery
            ? _value.searchQuery
            : searchQuery // ignore: cast_nullable_to_non_nullable
                  as String,
        nextCursor: freezed == nextCursor
            ? _value.nextCursor
            : nextCursor // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$ChatListStateImpl extends _ChatListState {
  const _$ChatListStateImpl({
    final List<Conversation> conversations = const [],
    this.searchQuery = '',
    this.nextCursor,
  }) : _conversations = conversations,
       super._();

  final List<Conversation> _conversations;
  @override
  @JsonKey()
  List<Conversation> get conversations {
    if (_conversations is EqualUnmodifiableListView) return _conversations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_conversations);
  }

  @override
  @JsonKey()
  final String searchQuery;
  @override
  final String? nextCursor;

  @override
  String toString() {
    return 'ChatListState(conversations: $conversations, searchQuery: $searchQuery, nextCursor: $nextCursor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatListStateImpl &&
            const DeepCollectionEquality().equals(
              other._conversations,
              _conversations,
            ) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.nextCursor, nextCursor) ||
                other.nextCursor == nextCursor));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_conversations),
    searchQuery,
    nextCursor,
  );

  /// Create a copy of ChatListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatListStateImplCopyWith<_$ChatListStateImpl> get copyWith =>
      __$$ChatListStateImplCopyWithImpl<_$ChatListStateImpl>(this, _$identity);
}

abstract class _ChatListState extends ChatListState {
  const factory _ChatListState({
    final List<Conversation> conversations,
    final String searchQuery,
    final String? nextCursor,
  }) = _$ChatListStateImpl;
  const _ChatListState._() : super._();

  @override
  List<Conversation> get conversations;
  @override
  String get searchQuery;
  @override
  String? get nextCursor;

  /// Create a copy of ChatListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatListStateImplCopyWith<_$ChatListStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ChatDetailState {
  String get conversationId => throw _privateConstructorUsedError;
  Conversation? get conversation => throw _privateConstructorUsedError;

  /// Oldest first, which is the reading order; the route answers newest first.
  List<ChatMessage> get messages => throw _privateConstructorUsedError;

  /// The negotiations the thread's cards point at, by offer id. A card carries
  /// only the id, so the terms are read from here and a counter-offer can never
  /// leave an old price on screen.
  Map<String, Offer> get offers => throw _privateConstructorUsedError;
  String? get nextCursor => throw _privateConstructorUsedError;
  bool get isSending => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of ChatDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatDetailStateCopyWith<ChatDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatDetailStateCopyWith<$Res> {
  factory $ChatDetailStateCopyWith(
    ChatDetailState value,
    $Res Function(ChatDetailState) then,
  ) = _$ChatDetailStateCopyWithImpl<$Res, ChatDetailState>;
  @useResult
  $Res call({
    String conversationId,
    Conversation? conversation,
    List<ChatMessage> messages,
    Map<String, Offer> offers,
    String? nextCursor,
    bool isSending,
    String? errorMessage,
  });
}

/// @nodoc
class _$ChatDetailStateCopyWithImpl<$Res, $Val extends ChatDetailState>
    implements $ChatDetailStateCopyWith<$Res> {
  _$ChatDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conversationId = null,
    Object? conversation = freezed,
    Object? messages = null,
    Object? offers = null,
    Object? nextCursor = freezed,
    Object? isSending = null,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _value.copyWith(
            conversationId: null == conversationId
                ? _value.conversationId
                : conversationId // ignore: cast_nullable_to_non_nullable
                      as String,
            conversation: freezed == conversation
                ? _value.conversation
                : conversation // ignore: cast_nullable_to_non_nullable
                      as Conversation?,
            messages: null == messages
                ? _value.messages
                : messages // ignore: cast_nullable_to_non_nullable
                      as List<ChatMessage>,
            offers: null == offers
                ? _value.offers
                : offers // ignore: cast_nullable_to_non_nullable
                      as Map<String, Offer>,
            nextCursor: freezed == nextCursor
                ? _value.nextCursor
                : nextCursor // ignore: cast_nullable_to_non_nullable
                      as String?,
            isSending: null == isSending
                ? _value.isSending
                : isSending // ignore: cast_nullable_to_non_nullable
                      as bool,
            errorMessage: freezed == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ChatDetailStateImplCopyWith<$Res>
    implements $ChatDetailStateCopyWith<$Res> {
  factory _$$ChatDetailStateImplCopyWith(
    _$ChatDetailStateImpl value,
    $Res Function(_$ChatDetailStateImpl) then,
  ) = __$$ChatDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String conversationId,
    Conversation? conversation,
    List<ChatMessage> messages,
    Map<String, Offer> offers,
    String? nextCursor,
    bool isSending,
    String? errorMessage,
  });
}

/// @nodoc
class __$$ChatDetailStateImplCopyWithImpl<$Res>
    extends _$ChatDetailStateCopyWithImpl<$Res, _$ChatDetailStateImpl>
    implements _$$ChatDetailStateImplCopyWith<$Res> {
  __$$ChatDetailStateImplCopyWithImpl(
    _$ChatDetailStateImpl _value,
    $Res Function(_$ChatDetailStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? conversationId = null,
    Object? conversation = freezed,
    Object? messages = null,
    Object? offers = null,
    Object? nextCursor = freezed,
    Object? isSending = null,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _$ChatDetailStateImpl(
        conversationId: null == conversationId
            ? _value.conversationId
            : conversationId // ignore: cast_nullable_to_non_nullable
                  as String,
        conversation: freezed == conversation
            ? _value.conversation
            : conversation // ignore: cast_nullable_to_non_nullable
                  as Conversation?,
        messages: null == messages
            ? _value._messages
            : messages // ignore: cast_nullable_to_non_nullable
                  as List<ChatMessage>,
        offers: null == offers
            ? _value._offers
            : offers // ignore: cast_nullable_to_non_nullable
                  as Map<String, Offer>,
        nextCursor: freezed == nextCursor
            ? _value.nextCursor
            : nextCursor // ignore: cast_nullable_to_non_nullable
                  as String?,
        isSending: null == isSending
            ? _value.isSending
            : isSending // ignore: cast_nullable_to_non_nullable
                  as bool,
        errorMessage: freezed == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$ChatDetailStateImpl extends _ChatDetailState {
  const _$ChatDetailStateImpl({
    required this.conversationId,
    this.conversation,
    final List<ChatMessage> messages = const [],
    final Map<String, Offer> offers = const {},
    this.nextCursor,
    this.isSending = false,
    this.errorMessage,
  }) : _messages = messages,
       _offers = offers,
       super._();

  @override
  final String conversationId;
  @override
  final Conversation? conversation;

  /// Oldest first, which is the reading order; the route answers newest first.
  final List<ChatMessage> _messages;

  /// Oldest first, which is the reading order; the route answers newest first.
  @override
  @JsonKey()
  List<ChatMessage> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  /// The negotiations the thread's cards point at, by offer id. A card carries
  /// only the id, so the terms are read from here and a counter-offer can never
  /// leave an old price on screen.
  final Map<String, Offer> _offers;

  /// The negotiations the thread's cards point at, by offer id. A card carries
  /// only the id, so the terms are read from here and a counter-offer can never
  /// leave an old price on screen.
  @override
  @JsonKey()
  Map<String, Offer> get offers {
    if (_offers is EqualUnmodifiableMapView) return _offers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_offers);
  }

  @override
  final String? nextCursor;
  @override
  @JsonKey()
  final bool isSending;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'ChatDetailState(conversationId: $conversationId, conversation: $conversation, messages: $messages, offers: $offers, nextCursor: $nextCursor, isSending: $isSending, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatDetailStateImpl &&
            (identical(other.conversationId, conversationId) ||
                other.conversationId == conversationId) &&
            (identical(other.conversation, conversation) ||
                other.conversation == conversation) &&
            const DeepCollectionEquality().equals(other._messages, _messages) &&
            const DeepCollectionEquality().equals(other._offers, _offers) &&
            (identical(other.nextCursor, nextCursor) ||
                other.nextCursor == nextCursor) &&
            (identical(other.isSending, isSending) ||
                other.isSending == isSending) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    conversationId,
    conversation,
    const DeepCollectionEquality().hash(_messages),
    const DeepCollectionEquality().hash(_offers),
    nextCursor,
    isSending,
    errorMessage,
  );

  /// Create a copy of ChatDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatDetailStateImplCopyWith<_$ChatDetailStateImpl> get copyWith =>
      __$$ChatDetailStateImplCopyWithImpl<_$ChatDetailStateImpl>(
        this,
        _$identity,
      );
}

abstract class _ChatDetailState extends ChatDetailState {
  const factory _ChatDetailState({
    required final String conversationId,
    final Conversation? conversation,
    final List<ChatMessage> messages,
    final Map<String, Offer> offers,
    final String? nextCursor,
    final bool isSending,
    final String? errorMessage,
  }) = _$ChatDetailStateImpl;
  const _ChatDetailState._() : super._();

  @override
  String get conversationId;
  @override
  Conversation? get conversation;

  /// Oldest first, which is the reading order; the route answers newest first.
  @override
  List<ChatMessage> get messages;

  /// The negotiations the thread's cards point at, by offer id. A card carries
  /// only the id, so the terms are read from here and a counter-offer can never
  /// leave an old price on screen.
  @override
  Map<String, Offer> get offers;
  @override
  String? get nextCursor;
  @override
  bool get isSending;
  @override
  String? get errorMessage;

  /// Create a copy of ChatDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatDetailStateImplCopyWith<_$ChatDetailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
