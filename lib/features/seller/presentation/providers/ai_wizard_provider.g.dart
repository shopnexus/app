// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_wizard_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AiWizardNotifier)
const aiWizardProvider = AiWizardNotifierProvider._();

final class AiWizardNotifierProvider
    extends $NotifierProvider<AiWizardNotifier, AiWizardState> {
  const AiWizardNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'aiWizardProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$aiWizardNotifierHash();

  @$internal
  @override
  AiWizardNotifier create() => AiWizardNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AiWizardState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AiWizardState>(value),
    );
  }
}

String _$aiWizardNotifierHash() => r'ab9d3c691da40092c9474b36235a6d0c75290e33';

abstract class _$AiWizardNotifier extends $Notifier<AiWizardState> {
  AiWizardState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AiWizardState, AiWizardState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AiWizardState, AiWizardState>,
              AiWizardState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
