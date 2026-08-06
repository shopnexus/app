// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reputation_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(reputationRepository)
final reputationRepositoryProvider = ReputationRepositoryProvider._();

final class ReputationRepositoryProvider
    extends
        $FunctionalProvider<
          ReputationRepository,
          ReputationRepository,
          ReputationRepository
        >
    with $Provider<ReputationRepository> {
  ReputationRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'reputationRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$reputationRepositoryHash();

  @$internal
  @override
  $ProviderElement<ReputationRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ReputationRepository create(Ref ref) {
    return reputationRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ReputationRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ReputationRepository>(value),
    );
  }
}

String _$reputationRepositoryHash() =>
    r'2a6cd0fed9dc15202ba300062938bc4c1a607629';
