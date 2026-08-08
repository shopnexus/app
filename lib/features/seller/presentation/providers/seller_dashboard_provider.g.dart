// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seller_dashboard_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DashboardWindowDays)
const dashboardWindowDaysProvider = DashboardWindowDaysProvider._();

final class DashboardWindowDaysProvider
    extends $NotifierProvider<DashboardWindowDays, int> {
  const DashboardWindowDaysProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dashboardWindowDaysProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dashboardWindowDaysHash();

  @$internal
  @override
  DashboardWindowDays create() => DashboardWindowDays();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$dashboardWindowDaysHash() =>
    r'18ff6d20df4f47339fd15b48318452be9fb6c5d0';

abstract class _$DashboardWindowDays extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(SellerDashboardNotifier)
const sellerDashboardProvider = SellerDashboardNotifierProvider._();

final class SellerDashboardNotifierProvider
    extends $AsyncNotifierProvider<SellerDashboardNotifier, SellerDashboard> {
  const SellerDashboardNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sellerDashboardProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sellerDashboardNotifierHash();

  @$internal
  @override
  SellerDashboardNotifier create() => SellerDashboardNotifier();
}

String _$sellerDashboardNotifierHash() =>
    r'f0172195e9291a4b4a5879487998fbbc0332a8b1';

abstract class _$SellerDashboardNotifier
    extends $AsyncNotifier<SellerDashboard> {
  FutureOr<SellerDashboard> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<SellerDashboard>, SellerDashboard>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<SellerDashboard>, SellerDashboard>,
              AsyncValue<SellerDashboard>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
