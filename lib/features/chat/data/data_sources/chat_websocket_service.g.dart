// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_websocket_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(chatWebSocketService)
const chatWebSocketServiceProvider = ChatWebSocketServiceProvider._();

final class ChatWebSocketServiceProvider
    extends
        $FunctionalProvider<
          ChatWebSocketService,
          ChatWebSocketService,
          ChatWebSocketService
        >
    with $Provider<ChatWebSocketService> {
  const ChatWebSocketServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'chatWebSocketServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$chatWebSocketServiceHash();

  @$internal
  @override
  $ProviderElement<ChatWebSocketService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ChatWebSocketService create(Ref ref) {
    return chatWebSocketService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ChatWebSocketService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ChatWebSocketService>(value),
    );
  }
}

String _$chatWebSocketServiceHash() =>
    r'5102a9fa34d3ed2352136405801cefdc24ec75ef';
