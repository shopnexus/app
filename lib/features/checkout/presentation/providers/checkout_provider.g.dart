// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
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

@ProviderFor(CheckoutNotifier)
final checkoutProvider = CheckoutNotifierProvider._();

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
final class CheckoutNotifierProvider
    extends $NotifierProvider<CheckoutNotifier, CheckoutState> {
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
  CheckoutNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'checkoutProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$checkoutNotifierHash();

  @$internal
  @override
  CheckoutNotifier create() => CheckoutNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CheckoutState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CheckoutState>(value),
    );
  }
}

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

abstract class _$CheckoutNotifier extends $Notifier<CheckoutState> {
  CheckoutState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<CheckoutState, CheckoutState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CheckoutState, CheckoutState>,
              CheckoutState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
