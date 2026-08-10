// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders_actions_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

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
///
/// Copied from [OrdersActions].
@ProviderFor(OrdersActions)
final ordersActionsProvider =
    NotifierProvider<OrdersActions, OrdersActionsState>.internal(
      OrdersActions.new,
      name: r'ordersActionsProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$ordersActionsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$OrdersActions = Notifier<OrdersActionsState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
