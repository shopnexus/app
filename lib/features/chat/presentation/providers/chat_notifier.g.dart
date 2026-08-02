// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider quản lý danh sách cuộc hội thoại chat

@ProviderFor(ChatListNotifier)
const chatListProvider = ChatListNotifierProvider._();

/// Provider quản lý danh sách cuộc hội thoại chat
final class ChatListNotifierProvider
    extends $AsyncNotifierProvider<ChatListNotifier, ChatListState> {
  /// Provider quản lý danh sách cuộc hội thoại chat
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

String _$chatListNotifierHash() => r'629bc264e69a816df5578af28c8970a8caa8928f';

/// Provider quản lý danh sách cuộc hội thoại chat

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

/// Provider quản lý cửa sổ chi tiết chat và luồng tin nhắn real-time

@ProviderFor(ChatDetailNotifier)
const chatDetailProvider = ChatDetailNotifierFamily._();

/// Provider quản lý cửa sổ chi tiết chat và luồng tin nhắn real-time
final class ChatDetailNotifierProvider
    extends $AsyncNotifierProvider<ChatDetailNotifier, ChatDetailState> {
  /// Provider quản lý cửa sổ chi tiết chat và luồng tin nhắn real-time
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
    r'16fda2d1e29413d6edf4b460b781489a03f50d09';

/// Provider quản lý cửa sổ chi tiết chat và luồng tin nhắn real-time

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

  /// Provider quản lý cửa sổ chi tiết chat và luồng tin nhắn real-time

  ChatDetailNotifierProvider call(String conversationId) =>
      ChatDetailNotifierProvider._(argument: conversationId, from: this);

  @override
  String toString() => r'chatDetailProvider';
}

/// Provider quản lý cửa sổ chi tiết chat và luồng tin nhắn real-time

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
