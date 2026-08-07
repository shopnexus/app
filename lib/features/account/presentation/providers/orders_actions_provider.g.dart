// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_actions_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Những gì một người bán trả lời một đơn đã trả tiền: xác nhận, từ chối, hủy.
///
/// Tách ra khỏi provider giữ danh sách, vì hai việc đó có tuổi khác nhau: danh
/// sách bị vứt đi và nạp lại mỗi lần đổi vai hoặc kéo để refresh, còn một lời
/// xác nhận đang bay thì không. Ở chung, các hành động này chết cùng cái màn hình
/// bị xoá — và một màn mới vẫn compile mà không có nút nào là kiểu mất chức năng
/// không ai thấy.
///
/// Không tự nạp lại danh sách sau khi xong: ai đang mở danh sách nào thì người đó
/// biết, và một provider hành động đoán hộ sẽ chọn sai một trong hai.
///
/// `keepAlive` vì một lời xác nhận được gọi bằng `read`, không `watch`: autoDispose
/// sẽ vứt notifier ngay khi câu lệnh vừa được gọi, rồi lần ghi state sau `await`
/// ném lỗi — nên đơn *đã* được xác nhận trên server mà người bán thấy một thông
/// báo thất bại.

@ProviderFor(OrdersActions)
const ordersActionsProvider = OrdersActionsProvider._();

/// Những gì một người bán trả lời một đơn đã trả tiền: xác nhận, từ chối, hủy.
///
/// Tách ra khỏi provider giữ danh sách, vì hai việc đó có tuổi khác nhau: danh
/// sách bị vứt đi và nạp lại mỗi lần đổi vai hoặc kéo để refresh, còn một lời
/// xác nhận đang bay thì không. Ở chung, các hành động này chết cùng cái màn hình
/// bị xoá — và một màn mới vẫn compile mà không có nút nào là kiểu mất chức năng
/// không ai thấy.
///
/// Không tự nạp lại danh sách sau khi xong: ai đang mở danh sách nào thì người đó
/// biết, và một provider hành động đoán hộ sẽ chọn sai một trong hai.
///
/// `keepAlive` vì một lời xác nhận được gọi bằng `read`, không `watch`: autoDispose
/// sẽ vứt notifier ngay khi câu lệnh vừa được gọi, rồi lần ghi state sau `await`
/// ném lỗi — nên đơn *đã* được xác nhận trên server mà người bán thấy một thông
/// báo thất bại.
final class OrdersActionsProvider
    extends $NotifierProvider<OrdersActions, OrdersActionsState> {
  /// Những gì một người bán trả lời một đơn đã trả tiền: xác nhận, từ chối, hủy.
  ///
  /// Tách ra khỏi provider giữ danh sách, vì hai việc đó có tuổi khác nhau: danh
  /// sách bị vứt đi và nạp lại mỗi lần đổi vai hoặc kéo để refresh, còn một lời
  /// xác nhận đang bay thì không. Ở chung, các hành động này chết cùng cái màn hình
  /// bị xoá — và một màn mới vẫn compile mà không có nút nào là kiểu mất chức năng
  /// không ai thấy.
  ///
  /// Không tự nạp lại danh sách sau khi xong: ai đang mở danh sách nào thì người đó
  /// biết, và một provider hành động đoán hộ sẽ chọn sai một trong hai.
  ///
  /// `keepAlive` vì một lời xác nhận được gọi bằng `read`, không `watch`: autoDispose
  /// sẽ vứt notifier ngay khi câu lệnh vừa được gọi, rồi lần ghi state sau `await`
  /// ném lỗi — nên đơn *đã* được xác nhận trên server mà người bán thấy một thông
  /// báo thất bại.
  const OrdersActionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ordersActionsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ordersActionsHash();

  @$internal
  @override
  OrdersActions create() => OrdersActions();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(OrdersActionsState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<OrdersActionsState>(value),
    );
  }
}

String _$ordersActionsHash() => r'e263f0a7db0bc78d12c104d9922039f9662758fc';

/// Những gì một người bán trả lời một đơn đã trả tiền: xác nhận, từ chối, hủy.
///
/// Tách ra khỏi provider giữ danh sách, vì hai việc đó có tuổi khác nhau: danh
/// sách bị vứt đi và nạp lại mỗi lần đổi vai hoặc kéo để refresh, còn một lời
/// xác nhận đang bay thì không. Ở chung, các hành động này chết cùng cái màn hình
/// bị xoá — và một màn mới vẫn compile mà không có nút nào là kiểu mất chức năng
/// không ai thấy.
///
/// Không tự nạp lại danh sách sau khi xong: ai đang mở danh sách nào thì người đó
/// biết, và một provider hành động đoán hộ sẽ chọn sai một trong hai.
///
/// `keepAlive` vì một lời xác nhận được gọi bằng `read`, không `watch`: autoDispose
/// sẽ vứt notifier ngay khi câu lệnh vừa được gọi, rồi lần ghi state sau `await`
/// ném lỗi — nên đơn *đã* được xác nhận trên server mà người bán thấy một thông
/// báo thất bại.

abstract class _$OrdersActions extends $Notifier<OrdersActionsState> {
  OrdersActionsState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<OrdersActionsState, OrdersActionsState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<OrdersActionsState, OrdersActionsState>,
              OrdersActionsState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
