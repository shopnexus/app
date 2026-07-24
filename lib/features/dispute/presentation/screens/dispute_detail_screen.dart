import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/dispute_model.dart';
import '../providers/dispute_provider.dart';
import '../widgets/dispute_status_badge.dart';
import '../widgets/dispute_timeline_widget.dart';
import '../widgets/evidence_gallery_widget.dart';
import '../widgets/seller_dispute_dialog.dart';

/// Màn hình chi tiết tiến trình tranh chấp & bằng chứng đối chất giữa 2 bên
class DisputeDetailScreen extends ConsumerStatefulWidget {
  final String refundId;

  const DisputeDetailScreen({super.key, required this.refundId});

  @override
  ConsumerState<DisputeDetailScreen> createState() =>
      _DisputeDetailScreenState();
}

class _DisputeDetailScreenState extends ConsumerState<DisputeDetailScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(disputeProvider.notifier).fetchRefundDetail(widget.refundId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final disputeAsync = ref.watch(disputeProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Text(
          'Chi tiết Tranh chấp #${widget.refundId}',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Color(0xFF0F172A),
            fontFamily: 'Inter',
          ),
        ),
        centerTitle: true,
      ),
      body: disputeAsync.when(
        data: (state) {
          final refund = state.selectedRefund;
          if (refund == null) {
            return const Center(
              child: Text('Không tìm thấy thông tin đơn hoàn tiền'),
            );
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1. Timeline & Countdown Widget
                DisputeTimelineWidget(refund: refund),
                const SizedBox(height: 16),

                // 2. Order summary card
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: const Color(0xFFE2E8F0)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Mã đơn hàng: ${refund.orderId}',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF0F172A),
                              fontFamily: 'Inter',
                            ),
                          ),
                          DisputeStatusBadge(status: refund.status),
                        ],
                      ),
                      if (refund.createdAt != null) ...[
                        const SizedBox(height: 6),
                        Text(
                          'Ngày tạo yêu cầu: ${refund.createdAt}',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF64748B),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // 3. Buyer Refund Reason & Evidence Gallery Section
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: const Color(0xFFE2E8F0)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Icon(
                            Icons.person_outline,
                            size: 18,
                            color: Color(0xFF0F172A),
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Lý do từ người mua (Buyer)',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF0F172A),
                              fontFamily: 'Inter',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF8FAFC),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          refund.reason,
                          style: const TextStyle(
                            fontSize: 13,
                            color: Color(0xFF334155),
                            height: 1.4,
                            fontFamily: 'Inter',
                          ),
                        ),
                      ),
                      if (refund.attachments.isNotEmpty) ...[
                        const SizedBox(height: 14),
                        EvidenceGalleryWidget(
                          title: 'Ảnh bằng chứng của Buyer',
                          attachments: refund.attachments,
                        ),
                      ],
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // 4. Seller Response & Counter Evidence Section (if exists)
                if (refund.sellerResponse != null ||
                    refund.dispute != null) ...[
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: const Color(0xFFE2E8F0)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Icon(
                              Icons.storefront_outlined,
                              size: 18,
                              color: Color(0xFF0F172A),
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Phản hồi từ người bán (Seller)',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF0F172A),
                                fontFamily: 'Inter',
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF8FAFC),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            refund.sellerResponse ??
                                refund.dispute?.sellerReason ??
                                'Chưa có thông tin lý do',
                            style: const TextStyle(
                              fontSize: 13,
                              color: Color(0xFF334155),
                              height: 1.4,
                              fontFamily: 'Inter',
                            ),
                          ),
                        ),
                        if (refund.dispute?.sellerAttachments != null &&
                            refund.dispute!.sellerAttachments.isNotEmpty) ...[
                          const SizedBox(height: 14),
                          EvidenceGalleryWidget(
                            title: 'Ảnh đối chất của Seller',
                            attachments: refund.dispute!.sellerAttachments,
                          ),
                        ],
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                ],

                // 5. Admin Mod Dispute Status Section (if escalated)
                if (refund.dispute != null) ...[
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFEF2F2),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: const Color(0xFFFCA5A5)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Icon(
                              Icons.shield_outlined,
                              color: Color(0xFFDC2626),
                              size: 20,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Phán quyết từ Quản trị viên (Mod)',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF991B1B),
                                fontFamily: 'Inter',
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          refund.dispute?.adminNote ??
                              'Hệ thống đang tiến hành đối chiếu video đóng gói và hình ảnh bằng chứng của cả hai bên. Kết quả phán quyết sẽ được thông báo ngay khi hoàn tất.',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF7F1D1D),
                            height: 1.4,
                            fontFamily: 'Inter',
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text('Lỗi: ${err.toString()}')),
      ),
      bottomNavigationBar: _buildBottomActionBar(
        context,
        disputeAsync.value?.selectedRefund,
      ),
    );
  }

  Widget? _buildBottomActionBar(BuildContext context, RefundModel? refund) {
    if (refund == null) return null;

    // Trong lúc chờ phán quyết từ Mod (Disputed) -> Khóa toàn bộ tương tác
    if (refund.isLockedForInteraction) {
      return Container(
        padding: const EdgeInsets.all(16),
        color: const Color(0xFFF1F5F9),
        child: const Text(
          'Tương tác bị khóa - Đang chờ Mod phán quyết',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: Color(0xFF64748B),
            fontFamily: 'Inter',
          ),
        ),
      );
    }

    // Buyer action: Rút yêu cầu (chỉ khi status == 'Shipping')
    if (refund.canBuyerWithdraw) {
      return Container(
        padding: const EdgeInsets.all(16),
        color: Colors.white,
        child: SizedBox(
          width: double.infinity,
          height: 48,
          child: OutlinedButton(
            onPressed: () async {
              final confirm = await showDialog<bool>(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: const Text('Rút yêu cầu hoàn tiền?'),
                  content: const Text(
                    'Bạn có chắc chắn muốn rút yêu cầu hoàn tiền cho đơn hàng này?',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(ctx, false),
                      child: const Text('Hủy'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(ctx, true),
                      child: const Text('Đồng ý rút'),
                    ),
                  ],
                ),
              );

              if (confirm == true) {
                await ref
                    .read(disputeProvider.notifier)
                    .withdrawBuyerRefund(refund.id);
                if (context.mounted) Navigator.pop(context);
              }
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: const Color(0xFFDC2626),
              side: const BorderSide(color: Color(0xFFFCA5A5)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'Rút yêu cầu hoàn tiền',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      );
    }

    // Seller action bar: Trong thời hạn 3 ngày (AwaitingSellerReview)
    if (refund.isAwaitingSellerReview) {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0x0A000000),
              blurRadius: 10,
              offset: Offset(0, -4),
            ),
          ],
        ),
        child: Row(
          children: [
            // Nút Từ chối & Khiếu nại lên Mod
            Expanded(
              child: SizedBox(
                height: 48,
                child: OutlinedButton(
                  onPressed: () async {
                    final success = await SellerDisputeDialog.show(
                      context,
                      refund.id,
                    );
                    if (success == true && context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Đã gửi khiếu nại lên Admin Mod thành công!',
                          ),
                        ),
                      );
                    }
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFFDC2626),
                    side: const BorderSide(color: Color(0xFFFCA5A5)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Từ chối & Khiếu nại Mod',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),

            // Nút Chấp nhận hoàn tiền
            Expanded(
              child: SizedBox(
                height: 48,
                child: ElevatedButton(
                  onPressed: () async {
                    final confirm = await showDialog<bool>(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: const Text('Chấp nhận hoàn tiền?'),
                        content: const Text(
                          'Bạn có đồng ý hoàn tiền trực tiếp cho Buyer cho đơn hàng này?',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(ctx, false),
                            child: const Text('Hủy'),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(ctx, true),
                            child: const Text('Đồng ý hoàn tiền'),
                          ),
                        ],
                      ),
                    );

                    if (confirm == true) {
                      await ref
                          .read(disputeProvider.notifier)
                          .sellerApproveRefund(refund.id);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF16A34A),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Đồng ý hoàn tiền',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return null;
  }
}
