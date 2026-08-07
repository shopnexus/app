// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'help_center_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(helpCenterRepository)
const helpCenterRepositoryProvider = HelpCenterRepositoryProvider._();

final class HelpCenterRepositoryProvider
    extends
        $FunctionalProvider<
          HelpCenterRepository,
          HelpCenterRepository,
          HelpCenterRepository
        >
    with $Provider<HelpCenterRepository> {
  const HelpCenterRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'helpCenterRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$helpCenterRepositoryHash();

  @$internal
  @override
  $ProviderElement<HelpCenterRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  HelpCenterRepository create(Ref ref) {
    return helpCenterRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HelpCenterRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HelpCenterRepository>(value),
    );
  }
}

String _$helpCenterRepositoryHash() =>
    r'77bb6c357bb60907efeb8aa3caf0e8825b32dffb';
