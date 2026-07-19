// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(notifications)
const notificationsProvider = NotificationsFamily._();

final class NotificationsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Notification>>,
          List<Notification>,
          FutureOr<List<Notification>>
        >
    with
        $FutureModifier<List<Notification>>,
        $FutureProvider<List<Notification>> {
  const NotificationsProvider._({
    required NotificationsFamily super.from,
    required ({int page, int limit}) super.argument,
  }) : super(
         retry: null,
         name: r'notificationsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$notificationsHash();

  @override
  String toString() {
    return r'notificationsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<List<Notification>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Notification>> create(Ref ref) {
    final argument = this.argument as ({int page, int limit});
    return notifications(ref, page: argument.page, limit: argument.limit);
  }

  @override
  bool operator ==(Object other) {
    return other is NotificationsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$notificationsHash() => r'fa5686109385cc5d1c7d3d493c3f71c77a1fb861';

final class NotificationsFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<List<Notification>>,
          ({int page, int limit})
        > {
  const NotificationsFamily._()
    : super(
        retry: null,
        name: r'notificationsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  NotificationsProvider call({int page = 1, int limit = 20}) =>
      NotificationsProvider._(argument: (page: page, limit: limit), from: this);

  @override
  String toString() => r'notificationsProvider';
}

@ProviderFor(unreadNotificationsCount)
const unreadNotificationsCountProvider = UnreadNotificationsCountProvider._();

final class UnreadNotificationsCountProvider
    extends $FunctionalProvider<AsyncValue<int>, int, FutureOr<int>>
    with $FutureModifier<int>, $FutureProvider<int> {
  const UnreadNotificationsCountProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'unreadNotificationsCountProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$unreadNotificationsCountHash();

  @$internal
  @override
  $FutureProviderElement<int> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<int> create(Ref ref) {
    return unreadNotificationsCount(ref);
  }
}

String _$unreadNotificationsCountHash() =>
    r'0f0ab453388dc371fba58a10ce387bb2a269d1b0';

@ProviderFor(NotificationsController)
const notificationsControllerProvider = NotificationsControllerProvider._();

final class NotificationsControllerProvider
    extends $AsyncNotifierProvider<NotificationsController, void> {
  const NotificationsControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'notificationsControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$notificationsControllerHash();

  @$internal
  @override
  NotificationsController create() => NotificationsController();
}

String _$notificationsControllerHash() =>
    r'2b3cad3985184f1927734155e2e6d4b4ebd02826';

abstract class _$NotificationsController extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    build();
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleValue(ref, null);
  }
}
