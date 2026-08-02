// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kyc_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(KycNotifier)
const kycProvider = KycNotifierProvider._();

final class KycNotifierProvider
    extends $NotifierProvider<KycNotifier, KycFormState> {
  const KycNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'kycProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$kycNotifierHash();

  @$internal
  @override
  KycNotifier create() => KycNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(KycFormState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<KycFormState>(value),
    );
  }
}

String _$kycNotifierHash() => r'65908f6d29355640b5db995714ea703369c9491d';

abstract class _$KycNotifier extends $Notifier<KycFormState> {
  KycFormState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<KycFormState, KycFormState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<KycFormState, KycFormState>,
              KycFormState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
