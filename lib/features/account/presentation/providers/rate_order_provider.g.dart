// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rate_order_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

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
///
/// Copied from [RateOrder].
@ProviderFor(RateOrder)
final rateOrderProvider = NotifierProvider<RateOrder, RateOrderState>.internal(
  RateOrder.new,
  name: r'rateOrderProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$rateOrderHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$RateOrder = Notifier<RateOrderState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
