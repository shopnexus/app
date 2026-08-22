// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// The inbox.
///
/// Every change to it arrives on the account's one socket; nothing is polled and
/// nothing is replayed, so a re-handshake means refetching over REST.

@ProviderFor(ChatListNotifier)
const chatListProvider = ChatListNotifierProvider._();

/// The inbox.
///
/// Every change to it arrives on the account's one socket; nothing is polled and
/// nothing is replayed, so a re-handshake means refetching over REST.
final class ChatListNotifierProvider
    extends $AsyncNotifierProvider<ChatListNotifier, ChatListState> {
  /// The inbox.
  ///
  /// Every change to it arrives on the account's one socket; nothing is polled and
  /// nothing is replayed, so a re-handshake means refetching over REST.
  const ChatListNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'chatListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$chatListNotifierHash();

  @$internal
  @override
  ChatListNotifier create() => ChatListNotifier();
}

String _$chatListNotifierHash() => r'551b3e5f73996000590adf0c12cbd73c72af9daa';

/// The inbox.
///
/// Every change to it arrives on the account's one socket; nothing is polled and
/// nothing is replayed, so a re-handshake means refetching over REST.

abstract class _$ChatListNotifier extends $AsyncNotifier<ChatListState> {
  FutureOr<ChatListState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<ChatListState>, ChatListState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<ChatListState>, ChatListState>,
              AsyncValue<ChatListState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// One open thread.
///
/// Messages, read receipts and the negotiations its cards point at all arrive on
/// the same socket; what the app sends, it sends over REST.

@ProviderFor(ChatDetailNotifier)
const chatDetailProvider = ChatDetailNotifierFamily._();

/// One open thread.
///
/// Messages, read receipts and the negotiations its cards point at all arrive on
/// the same socket; what the app sends, it sends over REST.
final class ChatDetailNotifierProvider
    extends $AsyncNotifierProvider<ChatDetailNotifier, ChatDetailState> {
  /// One open thread.
  ///
  /// Messages, read receipts and the negotiations its cards point at all arrive on
  /// the same socket; what the app sends, it sends over REST.
  const ChatDetailNotifierProvider._({
    required ChatDetailNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'chatDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$chatDetailNotifierHash();

  @override
  String toString() {
    return r'chatDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ChatDetailNotifier create() => ChatDetailNotifier();

  @override
  bool operator ==(Object other) {
    return other is ChatDetailNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$chatDetailNotifierHash() =>
    r'05f63eb967cc8b649ebcde23dc06bd62fb8127a2';

/// One open thread.
///
/// Messages, read receipts and the negotiations its cards point at all arrive on
/// the same socket; what the app sends, it sends over REST.

final class ChatDetailNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          ChatDetailNotifier,
          AsyncValue<ChatDetailState>,
          ChatDetailState,
          FutureOr<ChatDetailState>,
          String
        > {
  const ChatDetailNotifierFamily._()
    : super(
        retry: null,
        name: r'chatDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// One open thread.
  ///
  /// Messages, read receipts and the negotiations its cards point at all arrive on
  /// the same socket; what the app sends, it sends over REST.

  ChatDetailNotifierProvider call(String conversationId) =>
      ChatDetailNotifierProvider._(argument: conversationId, from: this);

  @override
  String toString() => r'chatDetailProvider';
}

/// One open thread.
///
/// Messages, read receipts and the negotiations its cards point at all arrive on
/// the same socket; what the app sends, it sends over REST.

abstract class _$ChatDetailNotifier extends $AsyncNotifier<ChatDetailState> {
  late final _$args = ref.$arg as String;
  String get conversationId => _$args;

  FutureOr<ChatDetailState> build(String conversationId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<AsyncValue<ChatDetailState>, ChatDetailState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<ChatDetailState>, ChatDetailState>,
              AsyncValue<ChatDetailState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
