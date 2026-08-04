// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'realtime_client.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Kept alive for the whole session and connected only while signed in — the
/// handshake needs a token, and a revoked session's socket is closed by the
/// backend anyway.

@ProviderFor(realtimeClient)
const realtimeClientProvider = RealtimeClientProvider._();

/// Kept alive for the whole session and connected only while signed in — the
/// handshake needs a token, and a revoked session's socket is closed by the
/// backend anyway.

final class RealtimeClientProvider
    extends $FunctionalProvider<RealtimeClient, RealtimeClient, RealtimeClient>
    with $Provider<RealtimeClient> {
  /// Kept alive for the whole session and connected only while signed in — the
  /// handshake needs a token, and a revoked session's socket is closed by the
  /// backend anyway.
  const RealtimeClientProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'realtimeClientProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$realtimeClientHash();

  @$internal
  @override
  $ProviderElement<RealtimeClient> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  RealtimeClient create(Ref ref) {
    return realtimeClient(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RealtimeClient value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RealtimeClient>(value),
    );
  }
}

String _$realtimeClientHash() => r'4909a98db9aa509dd53e13ffb02b295e00b60c4d';

/// What a screen watches: the raw event feed, filtered by whatever it cares
/// about. Watching this is also what makes the socket connect.

@ProviderFor(realtimeEvents)
const realtimeEventsProvider = RealtimeEventsProvider._();

/// What a screen watches: the raw event feed, filtered by whatever it cares
/// about. Watching this is also what makes the socket connect.

final class RealtimeEventsProvider
    extends
        $FunctionalProvider<
          AsyncValue<RealtimeEvent>,
          RealtimeEvent,
          Stream<RealtimeEvent>
        >
    with $FutureModifier<RealtimeEvent>, $StreamProvider<RealtimeEvent> {
  /// What a screen watches: the raw event feed, filtered by whatever it cares
  /// about. Watching this is also what makes the socket connect.
  const RealtimeEventsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'realtimeEventsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$realtimeEventsHash();

  @$internal
  @override
  $StreamProviderElement<RealtimeEvent> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<RealtimeEvent> create(Ref ref) {
    return realtimeEvents(ref);
  }
}

String _$realtimeEventsHash() => r'3c93518cd4e7be9c99aa039f66afe022788de8e4';
