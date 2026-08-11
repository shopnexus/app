// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rate_order_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Gửi cả hai nửa của một lần chấm điểm, theo thứ tự **kín trước, công khai sau**.
///
/// Thứ tự đó là cố ý. Đánh giá giao dịch là thứ cộng vào uy tín và là thứ mù — nếu
/// nửa công khai đi trước rồi nửa kín hỏng, người dùng đã công bố một điểm cho tin
/// mà bên kia không nhận được gì, và họ sẽ không mở lại biểu mẫu đã "gửi xong".
///
/// Nửa công khai là **tuỳ chọn**: một tin hàng cũ độc bản bán một lần, nên đánh giá
/// sản phẩm ở đó gần như không có ai đọc — còn uy tín người bán thì luôn được đọc.
/// Bắt buộc cả hai là bắt người ta viết một thứ vô ích để làm xong một thứ hữu ích.

@ProviderFor(RateOrder)
const rateOrderProvider = RateOrderProvider._();

/// Gửi cả hai nửa của một lần chấm điểm, theo thứ tự **kín trước, công khai sau**.
///
/// Thứ tự đó là cố ý. Đánh giá giao dịch là thứ cộng vào uy tín và là thứ mù — nếu
/// nửa công khai đi trước rồi nửa kín hỏng, người dùng đã công bố một điểm cho tin
/// mà bên kia không nhận được gì, và họ sẽ không mở lại biểu mẫu đã "gửi xong".
///
/// Nửa công khai là **tuỳ chọn**: một tin hàng cũ độc bản bán một lần, nên đánh giá
/// sản phẩm ở đó gần như không có ai đọc — còn uy tín người bán thì luôn được đọc.
/// Bắt buộc cả hai là bắt người ta viết một thứ vô ích để làm xong một thứ hữu ích.
final class RateOrderProvider
    extends $NotifierProvider<RateOrder, RateOrderState> {
  /// Gửi cả hai nửa của một lần chấm điểm, theo thứ tự **kín trước, công khai sau**.
  ///
  /// Thứ tự đó là cố ý. Đánh giá giao dịch là thứ cộng vào uy tín và là thứ mù — nếu
  /// nửa công khai đi trước rồi nửa kín hỏng, người dùng đã công bố một điểm cho tin
  /// mà bên kia không nhận được gì, và họ sẽ không mở lại biểu mẫu đã "gửi xong".
  ///
  /// Nửa công khai là **tuỳ chọn**: một tin hàng cũ độc bản bán một lần, nên đánh giá
  /// sản phẩm ở đó gần như không có ai đọc — còn uy tín người bán thì luôn được đọc.
  /// Bắt buộc cả hai là bắt người ta viết một thứ vô ích để làm xong một thứ hữu ích.
  const RateOrderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'rateOrderProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$rateOrderHash();

  @$internal
  @override
  RateOrder create() => RateOrder();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RateOrderState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RateOrderState>(value),
    );
  }
}

String _$rateOrderHash() => r'a1074b83f7d63862bc900334e959139672edef51';

/// Gửi cả hai nửa của một lần chấm điểm, theo thứ tự **kín trước, công khai sau**.
///
/// Thứ tự đó là cố ý. Đánh giá giao dịch là thứ cộng vào uy tín và là thứ mù — nếu
/// nửa công khai đi trước rồi nửa kín hỏng, người dùng đã công bố một điểm cho tin
/// mà bên kia không nhận được gì, và họ sẽ không mở lại biểu mẫu đã "gửi xong".
///
/// Nửa công khai là **tuỳ chọn**: một tin hàng cũ độc bản bán một lần, nên đánh giá
/// sản phẩm ở đó gần như không có ai đọc — còn uy tín người bán thì luôn được đọc.
/// Bắt buộc cả hai là bắt người ta viết một thứ vô ích để làm xong một thứ hữu ích.

abstract class _$RateOrder extends $Notifier<RateOrderState> {
  RateOrderState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<RateOrderState, RateOrderState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<RateOrderState, RateOrderState>,
              RateOrderState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
