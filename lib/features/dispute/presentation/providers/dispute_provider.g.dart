// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dispute_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider quản lý danh sách & trạng thái chuyển đổi của Đơn Hoàn tiền / Tranh chấp

@ProviderFor(DisputeNotifier)
const disputeProvider = DisputeNotifierProvider._();

/// Provider quản lý danh sách & trạng thái chuyển đổi của Đơn Hoàn tiền / Tranh chấp
final class DisputeNotifierProvider
    extends $AsyncNotifierProvider<DisputeNotifier, DisputeState> {
  /// Provider quản lý danh sách & trạng thái chuyển đổi của Đơn Hoàn tiền / Tranh chấp
  const DisputeNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'disputeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$disputeNotifierHash();

  @$internal
  @override
  DisputeNotifier create() => DisputeNotifier();
}

String _$disputeNotifierHash() => r'ab82e83e56aa1838e6d78642f076dd9c1c9c71a4';

/// Provider quản lý danh sách & trạng thái chuyển đổi của Đơn Hoàn tiền / Tranh chấp

abstract class _$DisputeNotifier extends $AsyncNotifier<DisputeState> {
  FutureOr<DisputeState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<DisputeState>, DisputeState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<DisputeState>, DisputeState>,
              AsyncValue<DisputeState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// Provider quản lý Form tạo yêu cầu hoàn tiền của Buyer

@ProviderFor(BuyerRefundFormNotifier)
const buyerRefundFormProvider = BuyerRefundFormNotifierProvider._();

/// Provider quản lý Form tạo yêu cầu hoàn tiền của Buyer
final class BuyerRefundFormNotifierProvider
    extends $NotifierProvider<BuyerRefundFormNotifier, BuyerRefundFormState> {
  /// Provider quản lý Form tạo yêu cầu hoàn tiền của Buyer
  const BuyerRefundFormNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'buyerRefundFormProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$buyerRefundFormNotifierHash();

  @$internal
  @override
  BuyerRefundFormNotifier create() => BuyerRefundFormNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BuyerRefundFormState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BuyerRefundFormState>(value),
    );
  }
}

String _$buyerRefundFormNotifierHash() =>
    r'329f7f65629c3aa246866b6479fb9219928329ae';

/// Provider quản lý Form tạo yêu cầu hoàn tiền của Buyer

abstract class _$BuyerRefundFormNotifier
    extends $Notifier<BuyerRefundFormState> {
  BuyerRefundFormState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<BuyerRefundFormState, BuyerRefundFormState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<BuyerRefundFormState, BuyerRefundFormState>,
              BuyerRefundFormState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// Provider quản lý Form Seller từ chối & khiếu nại lên Admin Mod

@ProviderFor(SellerDisputeFormNotifier)
const sellerDisputeFormProvider = SellerDisputeFormNotifierProvider._();

/// Provider quản lý Form Seller từ chối & khiếu nại lên Admin Mod
final class SellerDisputeFormNotifierProvider
    extends
        $NotifierProvider<SellerDisputeFormNotifier, SellerDisputeFormState> {
  /// Provider quản lý Form Seller từ chối & khiếu nại lên Admin Mod
  const SellerDisputeFormNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sellerDisputeFormProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sellerDisputeFormNotifierHash();

  @$internal
  @override
  SellerDisputeFormNotifier create() => SellerDisputeFormNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SellerDisputeFormState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SellerDisputeFormState>(value),
    );
  }
}

String _$sellerDisputeFormNotifierHash() =>
    r'1f762165d1bf349a39fd45f9a651e41bdd98ded7';

/// Provider quản lý Form Seller từ chối & khiếu nại lên Admin Mod

abstract class _$SellerDisputeFormNotifier
    extends $Notifier<SellerDisputeFormState> {
  SellerDisputeFormState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<SellerDisputeFormState, SellerDisputeFormState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SellerDisputeFormState, SellerDisputeFormState>,
              SellerDisputeFormState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
