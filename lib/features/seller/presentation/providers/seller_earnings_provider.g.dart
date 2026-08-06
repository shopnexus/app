// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seller_earnings_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Chỉ cái ví, một lượt đọc.
///
/// Dòng "Số dư" ở trang Tài khoản cần đúng hai con số, và [SellerEarningsNotifier]
/// đọc bốn thứ để dựng cả màn Thu nhập — mở trang Tài khoản không nên trả giá đó.
/// `null` khi sàn chưa ghi khoản nào cho tài khoản này: một dòng ví được tạo bởi
/// lần chuyển tiền đầu tiên, không bởi việc đăng ký.

@ProviderFor(sellerWallet)
const sellerWalletProvider = SellerWalletProvider._();

/// Chỉ cái ví, một lượt đọc.
///
/// Dòng "Số dư" ở trang Tài khoản cần đúng hai con số, và [SellerEarningsNotifier]
/// đọc bốn thứ để dựng cả màn Thu nhập — mở trang Tài khoản không nên trả giá đó.
/// `null` khi sàn chưa ghi khoản nào cho tài khoản này: một dòng ví được tạo bởi
/// lần chuyển tiền đầu tiên, không bởi việc đăng ký.

final class SellerWalletProvider
    extends $FunctionalProvider<AsyncValue<Wallet?>, Wallet?, FutureOr<Wallet?>>
    with $FutureModifier<Wallet?>, $FutureProvider<Wallet?> {
  /// Chỉ cái ví, một lượt đọc.
  ///
  /// Dòng "Số dư" ở trang Tài khoản cần đúng hai con số, và [SellerEarningsNotifier]
  /// đọc bốn thứ để dựng cả màn Thu nhập — mở trang Tài khoản không nên trả giá đó.
  /// `null` khi sàn chưa ghi khoản nào cho tài khoản này: một dòng ví được tạo bởi
  /// lần chuyển tiền đầu tiên, không bởi việc đăng ký.
  const SellerWalletProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sellerWalletProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sellerWalletHash();

  @$internal
  @override
  $FutureProviderElement<Wallet?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Wallet?> create(Ref ref) {
    return sellerWallet(ref);
  }
}

String _$sellerWalletHash() => r'c4747f966dc59b9c2e1f81df42302bdc19a1336e';

@ProviderFor(SellerEarningsNotifier)
const sellerEarningsProvider = SellerEarningsNotifierProvider._();

final class SellerEarningsNotifierProvider
    extends
        $AsyncNotifierProvider<SellerEarningsNotifier, SellerEarningsState> {
  const SellerEarningsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sellerEarningsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sellerEarningsNotifierHash();

  @$internal
  @override
  SellerEarningsNotifier create() => SellerEarningsNotifier();
}

String _$sellerEarningsNotifierHash() =>
    r'f12d6ffbf3d07761a0c00d5d1de40963dff38fc1';

abstract class _$SellerEarningsNotifier
    extends $AsyncNotifier<SellerEarningsState> {
  FutureOr<SellerEarningsState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<SellerEarningsState>, SellerEarningsState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<SellerEarningsState>, SellerEarningsState>,
              AsyncValue<SellerEarningsState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
