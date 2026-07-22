// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seller_dashboard_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SelectedDashboardPeriod)
const selectedDashboardPeriodProvider = SelectedDashboardPeriodProvider._();

final class SelectedDashboardPeriodProvider
    extends $NotifierProvider<SelectedDashboardPeriod, String> {
  const SelectedDashboardPeriodProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedDashboardPeriodProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedDashboardPeriodHash();

  @$internal
  @override
  SelectedDashboardPeriod create() => SelectedDashboardPeriod();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$selectedDashboardPeriodHash() =>
    r'e41e7374a861f571387f57ad0747c09610af92a6';

abstract class _$SelectedDashboardPeriod extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(SellerDashboardNotifier)
const sellerDashboardProvider = SellerDashboardNotifierProvider._();

final class SellerDashboardNotifierProvider
    extends $AsyncNotifierProvider<SellerDashboardNotifier, SellerStats> {
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
    r'cb84f511ca740601f44752b00635eb5b773a2c9d';

abstract class _$SellerDashboardNotifier extends $AsyncNotifier<SellerStats> {
  FutureOr<SellerStats> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<SellerStats>, SellerStats>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<SellerStats>, SellerStats>,
              AsyncValue<SellerStats>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
