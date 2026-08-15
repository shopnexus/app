import 'package:flutter/material.dart';
import 'package:shopnexus_flutter_app/api/generated/model/order_state.dart';
import 'package:shopnexus_flutter_app/api/generated/model/transport_status.dart';
import 'package:shopnexus_flutter_app/features/account/data/models/order_view.dart';

/// Huy hiệu hiển thị trạng thái đơn hàng với màu sắc ngữ nghĩa chuẩn xác:
/// - Đã hủy / Giao thất bại / Vận chuyển hủy: Đỏ
/// - Đã trả về: Tím
/// - Hoàn thành / Đã giao: Xanh lá
/// - Chờ xác nhận: Xanh dương
/// - Đang xử lý / Chờ lấy hàng / Đang giao / Đã lấy hàng: Vàng cam
class OrderStatusBadge extends StatelessWidget {
  final OrderView? view;
  final OrderState? orderState;
  final TransportStatus? transportStatus;
  final String? customLabel;

  const OrderStatusBadge({
    super.key,
    this.view,
    this.orderState,
    this.transportStatus,
    this.customLabel,
  }) : assert(
         view != null || orderState != null,
         'Either view or orderState must be provided',
       );

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final state = view?.order.state ?? orderState!;
    final transport = view?.order.transport?.status ?? transportStatus;
    final label =
        customLabel ?? view?.statusLabel ?? _fallbackLabel(state, transport);

    final (Color bg, Color fg) = _resolveColors(state, transport, isDark);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.bold,
          fontFamily: 'Inter',
          color: fg,
        ),
      ),
    );
  }

  static String _fallbackLabel(OrderState state, TransportStatus? transport) {
    if (state == OrderState.cancelled) return 'Đã hủy';
    if (state == OrderState.completed) return 'Hoàn thành';
    if (state == OrderState.awaitingConfirmation) return 'Chờ xác nhận';
    return switch (transport) {
      null => 'Đang xử lý',
      TransportStatus.pending => 'Chờ lấy hàng',
      TransportStatus.pickedUp => 'Đã lấy hàng',
      TransportStatus.inTransit => 'Đang giao',
      TransportStatus.delivered => 'Đã giao',
      TransportStatus.returned => 'Đã trả về',
      TransportStatus.failed => 'Giao thất bại',
      TransportStatus.cancelled => 'Vận chuyển đã hủy',
    };
  }

  static (Color, Color) _resolveColors(
    OrderState state,
    TransportStatus? transport,
    bool isDark,
  ) {
    // 1. Cancelled / Failed / Error -> Đỏ
    if (state == OrderState.cancelled ||
        transport == TransportStatus.failed ||
        transport == TransportStatus.cancelled) {
      return (
        isDark
            ? const Color(0xFF991B1B).withValues(alpha: 0.35)
            : const Color(0xFFFEE2E2),
        isDark ? const Color(0xFFF87171) : const Color(0xFF991B1B),
      );
    }

    // 2. Returned -> Tím
    if (transport == TransportStatus.returned) {
      return (
        isDark
            ? const Color(0xFF6D28D9).withValues(alpha: 0.35)
            : const Color(0xFFEDE9FE),
        isDark ? const Color(0xFFA78BFA) : const Color(0xFF5B21B6),
      );
    }

    // 3. Completed / Delivered -> Xanh lá
    if (state == OrderState.completed ||
        transport == TransportStatus.delivered) {
      return (
        isDark
            ? const Color(0xFF059669).withValues(alpha: 0.35)
            : const Color(0xFFD1FAE5),
        isDark ? const Color(0xFF34D399) : const Color(0xFF065F46),
      );
    }

    // 4. Awaiting Confirmation -> Xanh dương
    if (state == OrderState.awaitingConfirmation) {
      return (
        isDark
            ? const Color(0xFF1D4ED8).withValues(alpha: 0.35)
            : const Color(0xFFDBEAFE),
        isDark ? const Color(0xFF60A5FA) : const Color(0xFF1E40AF),
      );
    }

    // 5. In Transit / Picked Up / Pending / Processing -> Vàng cam
    return (
      isDark
          ? const Color(0xFFD97706).withValues(alpha: 0.35)
          : const Color(0xFFFEF3C7),
      isDark ? const Color(0xFFFBBF24) : const Color(0xFF92400E),
    );
  }
}
