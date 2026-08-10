// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$unreadNotificationsCountHash() =>
    r'8acc408c967694430e248ed34c6647eb897e4d20';

/// See also [unreadNotificationsCount].
@ProviderFor(unreadNotificationsCount)
final unreadNotificationsCountProvider =
    AutoDisposeFutureProvider<int>.internal(
      unreadNotificationsCount,
      name: r'unreadNotificationsCountProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$unreadNotificationsCountHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UnreadNotificationsCountRef = AutoDisposeFutureProviderRef<int>;
String _$notificationsControllerHash() =>
    r'78d71a54bc05cd0a305dc7575034fc97eea1d7a3';

/// See also [NotificationsController].
@ProviderFor(NotificationsController)
final notificationsControllerProvider =
    AutoDisposeAsyncNotifierProvider<
      NotificationsController,
      NotificationFeed
    >.internal(
      NotificationsController.new,
      name: r'notificationsControllerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$notificationsControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$NotificationsController = AutoDisposeAsyncNotifier<NotificationFeed>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
