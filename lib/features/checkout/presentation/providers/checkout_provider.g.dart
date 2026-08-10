// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$checkoutNotifierHash() => r'0d8135e5fa7fdbb374e0410c175df0f6d691a1ed';

/// `keepAlive` là bắt buộc, không phải tối ưu.
///
/// `initialize()` được gọi bằng `ref.read(checkoutProvider.notifier)` từ **trang
/// khác** (giỏ hàng, trang tin đăng) ngay trước khi điều hướng, nên có một khoảng
/// không widget nào watch provider này. Ở chế độ autoDispose, khoảng đó đủ để nó
/// bị bỏ đi giữa chừng: state quay về `const CheckoutState()` và `ref.mounted`
/// thành false, nên ba bước còn lại của `initialize` lặng lẽ return. Màn thanh
/// toán mở ra với danh sách sản phẩm rỗng, không phương thức thanh toán, và câu
/// "chưa có báo giá vận chuyển cho địa chỉ này" — cả ba từ một nguyên nhân.
///
/// `initialize()` đặt lại toàn bộ state, nên lần thanh toán sau không thừa hưởng
/// gì của lần trước.
///
/// Copied from [CheckoutNotifier].
@ProviderFor(CheckoutNotifier)
final checkoutNotifierProvider =
    NotifierProvider<CheckoutNotifier, CheckoutState>.internal(
      CheckoutNotifier.new,
      name: r'checkoutNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$checkoutNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$CheckoutNotifier = Notifier<CheckoutState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
