// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refund_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(refundList)
const refundListProvider = RefundListFamily._();

final class RefundListProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Refund>>,
          List<Refund>,
          FutureOr<List<Refund>>
        >
    with $FutureModifier<List<Refund>>, $FutureProvider<List<Refund>> {
  const RefundListProvider._({
    required RefundListFamily super.from,
    required RefundRole super.argument,
  }) : super(
         retry: null,
         name: r'refundListProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$refundListHash();

  @override
  String toString() {
    return r'refundListProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<Refund>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Refund>> create(Ref ref) {
    final argument = this.argument as RefundRole;
    return refundList(ref, role: argument);
  }

  @override
  bool operator ==(Object other) {
    return other is RefundListProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$refundListHash() => r'9942e056a8f73c3f2caf960254c0800e03e71cbc';

final class RefundListFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<Refund>>, RefundRole> {
  const RefundListFamily._()
    : super(
        retry: null,
        name: r'refundListProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  RefundListProvider call({required RefundRole role}) =>
      RefundListProvider._(argument: role, from: this);

  @override
  String toString() => r'refundListProvider';
}

@ProviderFor(refundDetail)
const refundDetailProvider = RefundDetailFamily._();

final class RefundDetailProvider
    extends $FunctionalProvider<AsyncValue<Refund>, Refund, FutureOr<Refund>>
    with $FutureModifier<Refund>, $FutureProvider<Refund> {
  const RefundDetailProvider._({
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
  const RefundDetailFamily._()
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
const refundActionsProvider = RefundActionsProvider._();

/// The moves either party can still make on a live case. Everything that decides
/// money is staff's, reached by opening a `refund-dispute` ticket.
final class RefundActionsProvider
    extends $NotifierProvider<RefundActions, void> {
  /// The moves either party can still make on a live case. Everything that decides
  /// money is staff's, reached by opening a `refund-dispute` ticket.
  const RefundActionsProvider._()
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

String _$refundActionsHash() => r'be2adb338aa4b61e2c915e1f65561c8d98aee8f6';

/// The moves either party can still make on a live case. Everything that decides
/// money is staff's, reached by opening a `refund-dispute` ticket.

abstract class _$RefundActions extends $Notifier<void> {
  void build();
  @$mustCallSuper
  @override
  void runBuild() {
    build();
    final ref = this.ref as $Ref<void, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<void, void>,
              void,
              Object?,
              Object?
            >;
    element.handleValue(ref, null);
  }
}
