// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refund_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Cả hai chiều trong một danh sách — không tham số vai. Xem [RefundListScreen].

@ProviderFor(refundList)
final refundListProvider = RefundListProvider._();

/// Cả hai chiều trong một danh sách — không tham số vai. Xem [RefundListScreen].

final class RefundListProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Refund>>,
          List<Refund>,
          FutureOr<List<Refund>>
        >
    with $FutureModifier<List<Refund>>, $FutureProvider<List<Refund>> {
  /// Cả hai chiều trong một danh sách — không tham số vai. Xem [RefundListScreen].
  RefundListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'refundListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$refundListHash();

  @$internal
  @override
  $FutureProviderElement<List<Refund>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Refund>> create(Ref ref) {
    return refundList(ref);
  }
}

String _$refundListHash() => r'31f634536a5f103d39a28dadb9af30f49b399ecd';

@ProviderFor(refundDetail)
final refundDetailProvider = RefundDetailFamily._();

final class RefundDetailProvider
    extends $FunctionalProvider<AsyncValue<Refund>, Refund, FutureOr<Refund>>
    with $FutureModifier<Refund>, $FutureProvider<Refund> {
  RefundDetailProvider._({
    required RefundDetailFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'refundDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$refundDetailHash();

  @override
  String toString() {
    return r'refundDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Refund> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Refund> create(Ref ref) {
    final argument = this.argument as String;
    return refundDetail(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is RefundDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$refundDetailHash() => r'd9dcb750000a2fadecf349d53b556c09891d6d3a';

final class RefundDetailFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Refund>, String> {
  RefundDetailFamily._()
    : super(
        retry: null,
        name: r'refundDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  RefundDetailProvider call(String id) =>
      RefundDetailProvider._(argument: id, from: this);

  @override
  String toString() => r'refundDetailProvider';
}

/// The moves either party can still make on a live case. Everything that decides
/// money is staff's, reached by opening a `refund-dispute` ticket.

@ProviderFor(RefundActions)
final refundActionsProvider = RefundActionsProvider._();

/// The moves either party can still make on a live case. Everything that decides
/// money is staff's, reached by opening a `refund-dispute` ticket.
final class RefundActionsProvider
    extends $NotifierProvider<RefundActions, void> {
  /// The moves either party can still make on a live case. Everything that decides
  /// money is staff's, reached by opening a `refund-dispute` ticket.
  RefundActionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'refundActionsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$refundActionsHash();

  @$internal
  @override
  RefundActions create() => RefundActions();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$refundActionsHash() => r'e52e69604ed2898b183baca58dfcaa524e38c509';

/// The moves either party can still make on a live case. Everything that decides
/// money is staff's, reached by opening a `refund-dispute` ticket.

abstract class _$RefundActions extends $Notifier<void> {
  void build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<void, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<void, void>,
              void,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
