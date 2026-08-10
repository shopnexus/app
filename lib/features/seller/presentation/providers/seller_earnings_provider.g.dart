// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seller_earnings_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sellerWalletHash() => r'c4747f966dc59b9c2e1f81df42302bdc19a1336e';

/// Chỉ cái ví, một lượt đọc.
///
/// Dòng "Số dư" ở trang Tài khoản cần đúng hai con số, và [SellerEarningsNotifier]
/// đọc bốn thứ để dựng cả màn Thu nhập — mở trang Tài khoản không nên trả giá đó.
/// `null` khi sàn chưa ghi khoản nào cho tài khoản này: một dòng ví được tạo bởi
/// lần chuyển tiền đầu tiên, không bởi việc đăng ký.
///
/// Copied from [sellerWallet].
@ProviderFor(sellerWallet)
final sellerWalletProvider = AutoDisposeFutureProvider<Wallet?>.internal(
  sellerWallet,
  name: r'sellerWalletProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sellerWalletHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SellerWalletRef = AutoDisposeFutureProviderRef<Wallet?>;
String _$sellerEarningsNotifierHash() =>
    r'f3e4561392a8758a1e72c04afb7971fd099506f0';

/// See also [SellerEarningsNotifier].
@ProviderFor(SellerEarningsNotifier)
final sellerEarningsNotifierProvider =
    AutoDisposeAsyncNotifierProvider<
      SellerEarningsNotifier,
      SellerEarningsState
    >.internal(
      SellerEarningsNotifier.new,
      name: r'sellerEarningsNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$sellerEarningsNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$SellerEarningsNotifier =
    AutoDisposeAsyncNotifier<SellerEarningsState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
