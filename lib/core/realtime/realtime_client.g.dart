// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'realtime_client.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$realtimeClientHash() => r'925d7ef196e3a00f47651a1d509ee4a603ae7c51';

/// Kept alive for the whole session and connected only while signed in — the
/// handshake needs a token, and a revoked session's socket is closed by the
/// backend anyway.
///
/// Copied from [realtimeClient].
@ProviderFor(realtimeClient)
final realtimeClientProvider = Provider<RealtimeClient>.internal(
  realtimeClient,
  name: r'realtimeClientProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$realtimeClientHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef RealtimeClientRef = ProviderRef<RealtimeClient>;
String _$realtimeEventsHash() => r'3c93518cd4e7be9c99aa039f66afe022788de8e4';

/// What a screen watches: the raw event feed, filtered by whatever it cares
/// about. Watching this is also what makes the socket connect.
///
/// Copied from [realtimeEvents].
@ProviderFor(realtimeEvents)
final realtimeEventsProvider = StreamProvider<RealtimeEvent>.internal(
  realtimeEvents,
  name: r'realtimeEventsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$realtimeEventsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef RealtimeEventsRef = StreamProviderRef<RealtimeEvent>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
