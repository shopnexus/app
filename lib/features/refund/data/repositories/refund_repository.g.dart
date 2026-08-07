// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refund_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(refundRepository)
const refundRepositoryProvider = RefundRepositoryProvider._();

final class RefundRepositoryProvider
    extends
        $FunctionalProvider<
          RefundRepository,
          RefundRepository,
          RefundRepository
        >
    with $Provider<RefundRepository> {
  const RefundRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'refundRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$refundRepositoryHash();

  @$internal
  @override
  $ProviderElement<RefundRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  RefundRepository create(Ref ref) {
    return refundRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RefundRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RefundRepository>(value),
    );
  }
}

String _$refundRepositoryHash() => r'ea1294fda5a8c46c05be27b17bc13bcdb51e5fd4';
