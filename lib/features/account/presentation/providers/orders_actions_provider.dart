import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopnexus_flutter_app/features/account/data/repositories/account_repository.dart';
import 'package:shopnexus_flutter_app/features/seller/data/repositories/seller_repository.dart';

part 'orders_actions_provider.g.dart';

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
@Riverpod(keepAlive: true)
class OrdersActions extends _$OrdersActions {
  @override
  OrdersActionsState build() => const OrdersActionsState();

  /// Cái hạn 48 giờ có đúng hai câu trả lời. Im lặng không phải câu thứ ba tự
  /// giải quyết được: hết hạn thì ShopNexus mở ticket cho mod, chứ sàn không huỷ
  /// đơn và cũng không gửi hàng thay người bán.
  Future<bool> confirmOrder(String orderId) =>
      _act((repository) => repository.confirmOrder(orderId));

  Future<bool> declineOrder(String orderId, String reason) =>
      _act((repository) => repository.declineOrder(orderId, reason));

  /// Chỉ khi kiện hàng chưa rời `pending`; sau đó route trả 409 và đường về là
  /// một yêu cầu hoàn tiền.
  Future<bool> cancelOrder(String orderId) =>
      _act((repository) => repository.cancelOrder(orderId));

  /// Bỏ một dòng đã đặt mà tiền chưa gom thành đơn. Một dòng đã thanh toán bị
  /// từ chối 409 — đường undo của một vụ đã trả tiền là yêu cầu hoàn tiền.
  Future<bool> cancelItem(String itemId) =>
      _run(() => ref.read(accountRepositoryProvider).cancelItem(itemId));

  Future<bool> _act(Future<void> Function(SellerRepository) action) =>
      _run(() => action(ref.read(sellerRepositoryProvider)));

  Future<bool> _run(Future<void> Function() action) async {
    state = const OrdersActionsState(isLoading: true);
    try {
      await action();
      state = const OrdersActionsState();
      return true;
    } catch (error) {
      // Hỏng thì nói ra. Bộ nút cũ báo thành công bất kể server trả gì, vì route
      // chúng gọi không tồn tại và lỗi bị `catch (_)` ăn mất.
      state = OrdersActionsState(errorMessage: error.toString());
      return false;
    }
  }
}

class OrdersActionsState {
  const OrdersActionsState({this.isLoading = false, this.errorMessage});

  final bool isLoading;
  final String? errorMessage;
}
