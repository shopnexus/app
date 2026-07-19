import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/utils/money_utils.dart';
import '../../data/models/account_model.dart';
import '../providers/buyer_orders_provider.dart';

class OrderDetailScreen extends ConsumerWidget {
  final String orderId;

  const OrderDetailScreen({super.key, required this.orderId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orderDetailAsync = ref.watch(buyerOrderDetailProvider(orderId));

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text(
          'Chi tiết đơn hàng',
          style: TextStyle(
            color: Color(0xFF0F172A),
            fontWeight: FontWeight.bold,
            fontFamily: 'Inter',
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Color(0xFF0F172A),
            size: 20,
          ),
          onPressed: () => context.pop(),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () => ref.refresh(buyerOrderDetailProvider(orderId).future),
        child: orderDetailAsync.when(
          data: (order) => SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1. Status & ID Card
                _buildStatusCard(order),
                const SizedBox(height: 16),

                // 2. Shipping Address Card
                _buildAddressCard(order),
                const SizedBox(height: 16),

                // 3. Items Card
                _buildItemsCard(order),
                const SizedBox(height: 16),

                // 4. Payment Breakdowns Card
                _buildPaymentCard(order),
                const SizedBox(height: 16),

                // 5. Shipping info details
                _buildShippingDetailsCard(order),
                const SizedBox(height: 32),
              ],
            ),
          ),
          loading: () => _buildShimmerDetail(),
          error: (err, stack) => Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.error_outline_rounded,
                    size: 48,
                    color: Color(0xFFBA1A1A),
                  ),
                  // Màu Error Stitch
                  const SizedBox(height: 16),
                  const Text(
                    'Không thể tải chi tiết đơn hàng',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Inter',
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    err.toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFF64748B),
                      fontSize: 13,
                      fontFamily: 'Inter',
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Nút bấm cao tối thiểu 48px và bo góc 12px theo chuẩn Stitch
                  SizedBox(
                    height: 48,
                    width: 140,
                    child: ElevatedButton(
                      onPressed: () =>
                          ref.refresh(buyerOrderDetailProvider(orderId)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0F172A),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Thử lại',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Inter',
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatusCard(BuyerOrder order) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        // Đổi sang 24px theo chuẩn Stitch Card
        border: Border.all(color: const Color(0xFFF1F5F9)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Trạng thái đơn hàng',
                style: TextStyle(
                  fontSize: 13,
                  color: Color(0xFF64748B),
                  fontFamily: 'Inter',
                ),
              ),
              Text(
                order.transport?.status ?? 'Chuẩn bị hàng',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0F172A),
                  fontFamily: 'Inter',
                ),
              ),
            ],
          ),
          const Divider(height: 24, color: Color(0xFFF1F5F9)),
          Text(
            'Mã đơn: ${order.id}',
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Color(0xFF0F172A),
              fontFamily: 'Inter',
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Ngày đặt hàng: ${_formatDate(order.dateCreated)}',
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF64748B),
              fontFamily: 'Inter',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddressCard(BuyerOrder order) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        // Đổi sang 24px theo chuẩn Stitch Card
        border: Border.all(color: const Color(0xFFF1F5F9)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(
                Icons.location_on_rounded,
                color: Color(0xFF64748B),
                size: 20,
              ),
              SizedBox(width: 8),
              Text(
                'Địa chỉ giao hàng',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0F172A),
                  fontFamily: 'Inter',
                ),
              ),
            ],
          ),
          const Divider(height: 24, color: Color(0xFFF1F5F9)),
          Text(
            order.address,
            style: const TextStyle(
              fontSize: 13,
              height: 1.5,
              color: Color(0xFF0F172A),
              fontFamily: 'Inter',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItemsCard(BuyerOrder order) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        // Đổi sang 24px theo chuẩn Stitch Card
        border: Border.all(color: const Color(0xFFF1F5F9)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Sản phẩm đã mua',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0F172A),
              fontFamily: 'Inter',
            ),
          ),
          const Divider(height: 24, color: Color(0xFFF1F5F9)),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: order.items.length,
            separatorBuilder: (context, index) =>
                const Divider(height: 24, color: Color(0xFFF1F5F9)),
            itemBuilder: (context, index) {
              final item = order.items[index];
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      width: 64,
                      height: 64,
                      color: const Color(0xFFF1F5F9),
                      child: item.imageUrl != null && item.imageUrl!.isNotEmpty
                          ? Image.network(item.imageUrl!, fit: BoxFit.cover)
                          : const Icon(
                              Icons.image_rounded,
                              color: Color(0xFF94A3B8),
                            ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.skuName,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF0F172A),
                            fontFamily: 'Inter',
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Đơn giá: ${MoneyUtils.format(item.subtotalAmount)}  x${item.quantity}',
                              style: const TextStyle(
                                fontSize: 12,
                                color: Color(0xFF64748B),
                                fontFamily: 'Inter',
                              ),
                            ),
                            Text(
                              MoneyUtils.format(item.totalAmount),
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF0F172A),
                                fontFamily: 'Inter',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentCard(BuyerOrder order) {
    final subtotal = order.items.fold<int>(
      0,
      (sum, item) => sum + item.totalAmount,
    );
    final shippingCost = order.totalAmount - subtotal;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        // Đổi sang 24px theo chuẩn Stitch Card
        border: Border.all(color: const Color(0xFFF1F5F9)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Thông tin thanh toán',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0F172A),
              fontFamily: 'Inter',
            ),
          ),
          const Divider(height: 24, color: Color(0xFFF1F5F9)),
          _buildPaymentRow('Tiền hàng', MoneyUtils.format(subtotal)),
          const SizedBox(height: 12),
          _buildPaymentRow(
            'Phí vận chuyển',
            MoneyUtils.format(shippingCost > 0 ? shippingCost : 0),
          ),
          const Divider(height: 24, color: Color(0xFFF1F5F9)),
          _buildPaymentRow(
            'Tổng thanh toán',
            MoneyUtils.format(order.totalAmount),
            isBold: true,
            fontSize: 16,
            valueColor: const Color(0xFF0F172A),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentRow(
    String label,
    String value, {
    bool isBold = false,
    double fontSize = 13,
    Color valueColor = const Color(0xFF0F172A),
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: fontSize,
            color: isBold ? const Color(0xFF0F172A) : const Color(0xFF64748B),
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            fontFamily: 'Inter',
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: fontSize,
            color: valueColor,
            fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
            fontFamily: 'Inter',
          ),
        ),
      ],
    );
  }

  Widget _buildShippingDetailsCard(BuyerOrder order) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        // Đổi sang 24px theo chuẩn Stitch Card
        border: Border.all(color: const Color(0xFFF1F5F9)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Thông tin vận chuyển',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0F172A),
              fontFamily: 'Inter',
            ),
          ),
          const Divider(height: 24, color: Color(0xFFF1F5F9)),
          _buildPaymentRow(
            'Phương thức',
            order.transport?.option ?? 'Giao hàng tiêu chuẩn (Standard)',
          ),
          const SizedBox(height: 12),
          _buildPaymentRow(
            'Trạng thái vận chuyển',
            order.transport?.status ?? 'Chuẩn bị hàng',
          ),
        ],
      ),
    );
  }

  String _formatDate(String isoString) {
    try {
      final date = DateTime.parse(isoString);
      return '${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}  ${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
    } catch (_) {
      return isoString;
    }
  }

  Widget _buildShimmerDetail() {
    return Shimmer.fromColors(
      baseColor: const Color(0xFFF1F5F9),
      highlightColor: const Color(0xFFF8FAFC),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: List.generate(
            4,
            (index) => Container(
              margin: const EdgeInsets.only(bottom: 16),
              height: 140,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  24,
                ), // Đổi sang 24px theo chuẩn Stitch Card
              ),
            ),
          ),
        ),
      ),
    );
  }
}
