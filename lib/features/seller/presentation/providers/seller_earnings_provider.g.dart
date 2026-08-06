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
final sellerWalletProvider = SellerWalletProvider._();

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
  SellerWalletProvider._()
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
final sellerEarningsProvider = SellerEarningsNotifierProvider._();

final class SellerEarningsNotifierProvider
    extends
        $AsyncNotifierProvider<SellerEarningsNotifier, SellerEarningsState> {
  SellerEarningsNotifierProvider._()
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
    r'f3e4561392a8758a1e72c04afb7971fd099506f0';

abstract class _$SellerEarningsNotifier
    extends $AsyncNotifier<SellerEarningsState> {
  FutureOr<SellerEarningsState> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
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
    return element.handleCreate(ref, build);
  }
}
