import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopnexus_flutter_app/api/generated/model/order_state.dart';
import 'package:shopnexus_flutter_app/features/account/data/models/order_view.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/providers/order_feedback_provider.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/providers/orders_provider.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/widgets/rate_invite_sheet.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/widgets/rate_order_sheet.dart';

/// Mời đánh giá, đúng lúc mời được.
///
/// Không mời ngay sau khi bấm "Đã nhận hàng": xác nhận nhận hàng *không* làm đơn
/// hoàn tất — nó mở đồng hồ 72 giờ giải ngân, và `POST /orders/{id}/feedback` trả
/// 422 `order_not_finished` suốt khoảng đó. Một lời mời dẫn vào biểu mẫu bị server
/// từ chối thì tệ hơn là không mời.
///
/// Nên lời mời chờ ở đây, ngay chỗ người mua quay lại đơn sau khi nhận thông báo
/// "đơn đã hoàn tất": đơn đã `completed`, mình là bên mua, và `mine == null` nghĩa
/// là chưa đánh giá. Mỗi đơn một lần trong một phiên — xem [RateInvitesShown].
///
/// Vẽ ra một `SizedBox`: đây là một thời điểm, không phải một phần của trang.
class RateInviteGate extends ConsumerStatefulWidget {
  const RateInviteGate({super.key, required this.view, required this.me});

  final OrderView view;

  /// Id của chính mình, để không mời người bán đánh giá theo lời của người mua.
  final String? me;

  @override
  ConsumerState<RateInviteGate> createState() => _RateInviteGateState();
}

class _RateInviteGateState extends ConsumerState<RateInviteGate> {
  bool _opening = false;

  bool get _isBuyerOfCompletedOrder =>
      widget.view.order.state == OrderState.completed &&
      widget.me != null &&
      widget.view.order.buyer.id == widget.me;

  @override
  Widget build(BuildContext context) {
    if (!_isBuyerOfCompletedOrder) return const SizedBox.shrink();

    final orderId = widget.view.order.id;
    if (ref.watch(rateInvitesShownProvider).contains(orderId)) {
      return const SizedBox.shrink();
    }

    // Chờ đọc xong đã đánh giá hay chưa. Đọc hỏng thì im lặng: một lời mời là
    // thứ có thể để lần sau, còn một hộp thoại nhảy ra vì lượt đọc phụ hỏng thì
    // không.
    final feedback = ref.watch(orderFeedbackProvider(orderId)).value;
    if (feedback == null || feedback.mine != null) {
      return const SizedBox.shrink();
    }

    if (!_opening) {
      _opening = true;
      // Sau frame hiện tại: sheet không mở được từ trong lượt build đang chạy.
      WidgetsBinding.instance.addPostFrameCallback((_) => _invite(orderId));
    }
    return const SizedBox.shrink();
  }

  Future<void> _invite(String orderId) async {
    if (!mounted) return;
    ref.read(rateInvitesShownProvider.notifier).markShown(orderId);

    final stars = await RateInviteSheet.show(
      context,
      sellerName: widget.view.order.seller.name,
    );
    if (stars == null || !mounted) return;

    // Biểu mẫu mở ra với đúng số sao vừa chạm; phần sản phẩm chỉ được hỏi khi đơn
    // có đúng một tin — nó gắn với một tin đăng cụ thể.
    final single = widget.view.lines.length == 1
        ? widget.view.lines.first
        : null;
    final sent = await RateOrderSheet.show(
      context,
      orderId: orderId,
      sellerName: widget.view.order.seller.name,
      listingId: single?.listing?.id,
      listingName: single?.name,
      initialSellerRating: stars,
    );
    if (sent != true || !mounted) return;
    ref.invalidate(orderFeedbackProvider(orderId));
    ref.invalidate(ordersProvider);
  }
}
