// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'help_center_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(HelpCenterNotifier)
const helpCenterProvider = HelpCenterNotifierProvider._();

final class HelpCenterNotifierProvider
    extends $NotifierProvider<HelpCenterNotifier, HelpCenterState> {
  const HelpCenterNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'helpCenterProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$helpCenterNotifierHash();

  @$internal
  @override
  HelpCenterNotifier create() => HelpCenterNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HelpCenterState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HelpCenterState>(value),
    );
  }
}

String _$helpCenterNotifierHash() =>
    r'ac8b312bf80c38bf9a7afcd289f27b55a69a42c1';

abstract class _$HelpCenterNotifier extends $Notifier<HelpCenterState> {
  HelpCenterState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<HelpCenterState, HelpCenterState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<HelpCenterState, HelpCenterState>,
              HelpCenterState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
