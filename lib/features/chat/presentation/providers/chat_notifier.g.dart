// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$chatListNotifierHash() => r'b7533ee0aaf204f4dff929fb8b928209221ae978';

/// The inbox.
///
/// Every change to it arrives on the account's one socket; nothing is polled and
/// nothing is replayed, so a re-handshake means refetching over REST.
///
/// Copied from [ChatListNotifier].
@ProviderFor(ChatListNotifier)
final chatListNotifierProvider =
    AutoDisposeAsyncNotifierProvider<ChatListNotifier, ChatListState>.internal(
      ChatListNotifier.new,
      name: r'chatListNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$chatListNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$ChatListNotifier = AutoDisposeAsyncNotifier<ChatListState>;
String _$chatDetailNotifierHash() =>
    r'f8baf60ababce1dfbbe4e9d8349578157f86ee43';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$ChatDetailNotifier
    extends BuildlessAutoDisposeAsyncNotifier<ChatDetailState> {
  late final String conversationId;

  FutureOr<ChatDetailState> build(String conversationId);
}

/// One open thread.
///
/// Messages, read receipts and the negotiations its cards point at all arrive on
/// the same socket; what the app sends, it sends over REST.
///
/// Copied from [ChatDetailNotifier].
@ProviderFor(ChatDetailNotifier)
const chatDetailNotifierProvider = ChatDetailNotifierFamily();

/// One open thread.
///
/// Messages, read receipts and the negotiations its cards point at all arrive on
/// the same socket; what the app sends, it sends over REST.
///
/// Copied from [ChatDetailNotifier].
class ChatDetailNotifierFamily extends Family<AsyncValue<ChatDetailState>> {
  /// One open thread.
  ///
  /// Messages, read receipts and the negotiations its cards point at all arrive on
  /// the same socket; what the app sends, it sends over REST.
  ///
  /// Copied from [ChatDetailNotifier].
  const ChatDetailNotifierFamily();

  /// One open thread.
  ///
  /// Messages, read receipts and the negotiations its cards point at all arrive on
  /// the same socket; what the app sends, it sends over REST.
  ///
  /// Copied from [ChatDetailNotifier].
  ChatDetailNotifierProvider call(String conversationId) {
    return ChatDetailNotifierProvider(conversationId);
  }

  @override
  ChatDetailNotifierProvider getProviderOverride(
    covariant ChatDetailNotifierProvider provider,
  ) {
    return call(provider.conversationId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'chatDetailNotifierProvider';
}

/// One open thread.
///
/// Messages, read receipts and the negotiations its cards point at all arrive on
/// the same socket; what the app sends, it sends over REST.
///
/// Copied from [ChatDetailNotifier].
class ChatDetailNotifierProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<
          ChatDetailNotifier,
          ChatDetailState
        > {
  /// One open thread.
  ///
  /// Messages, read receipts and the negotiations its cards point at all arrive on
  /// the same socket; what the app sends, it sends over REST.
  ///
  /// Copied from [ChatDetailNotifier].
  ChatDetailNotifierProvider(String conversationId)
    : this._internal(
        () => ChatDetailNotifier()..conversationId = conversationId,
        from: chatDetailNotifierProvider,
        name: r'chatDetailNotifierProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$chatDetailNotifierHash,
        dependencies: ChatDetailNotifierFamily._dependencies,
        allTransitiveDependencies:
            ChatDetailNotifierFamily._allTransitiveDependencies,
        conversationId: conversationId,
      );

  ChatDetailNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.conversationId,
  }) : super.internal();

  final String conversationId;

  @override
  FutureOr<ChatDetailState> runNotifierBuild(
    covariant ChatDetailNotifier notifier,
  ) {
    return notifier.build(conversationId);
  }

  @override
  Override overrideWith(ChatDetailNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: ChatDetailNotifierProvider._internal(
        () => create()..conversationId = conversationId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        conversationId: conversationId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ChatDetailNotifier, ChatDetailState>
  createElement() {
    return _ChatDetailNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ChatDetailNotifierProvider &&
        other.conversationId == conversationId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, conversationId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ChatDetailNotifierRef
    on AutoDisposeAsyncNotifierProviderRef<ChatDetailState> {
  /// The parameter `conversationId` of this provider.
  String get conversationId;
}

class _ChatDetailNotifierProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<
          ChatDetailNotifier,
          ChatDetailState
        >
    with ChatDetailNotifierRef {
  _ChatDetailNotifierProviderElement(super.provider);

  @override
  String get conversationId =>
      (origin as ChatDetailNotifierProvider).conversationId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
