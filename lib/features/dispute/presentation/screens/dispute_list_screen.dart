import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import '../../data/models/dispute_model.dart';
import '../providers/dispute_provider.dart';
import '../widgets/buyer_refund_dialog.dart';
import '../widgets/dispute_status_badge.dart';

/// Màn hình danh sách các yêu cầu hoàn tiền & tranh chấp
class DisputeListScreen extends ConsumerStatefulWidget {
  const DisputeListScreen({super.key});

  @override
  ConsumerState<DisputeListScreen> createState() => _DisputeListScreenState();
}

class _DisputeListScreenState extends ConsumerState<DisputeListScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> _tabs = [
    'Tất cả',
    'Chờ duyệt',
    'Khiếu nại Mod',
    'Đã xong',
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
    _tabController.addListener(_onTabChanged);
  }

  void _onTabChanged() {
    if (_tabController.indexIsChanging) return;
    String? filter;
    switch (_tabController.index) {
      case 1:
        filter = 'AwaitingSellerReview';
        break;
      case 2:
        filter = 'Disputed';
        break;
      case 3:
        filter = 'Accepted';
        break;
      default:
        filter = null;
        break;
    }
    ref.read(disputeProvider.notifier).fetchRefunds(status: filter);
  }

  @override
  void dispose() {
    _tabController.removeListener(_onTabChanged);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final disputeAsync = ref.watch(disputeProvider);

    return PopScope(
      canPop: true,
      child: Scaffold(
        backgroundColor: const Color(0xFFF8FAFC),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.5,
          title: const Text(
            'Quản lý Tranh chấp & Hoàn tiền',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Color(0xFF0F172A),
              fontFamily: 'Inter',
            ),
          ),
          centerTitle: true,
          bottom: TabBar(
            controller: _tabController,
            isScrollable: true,
            labelColor: const Color(0xFF0F172A),
            unselectedLabelColor: const Color(0xFF64748B),
            indicatorColor: const Color(0xFF0F172A),
            indicatorWeight: 2.5,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 13,
              fontFamily: 'Inter',
            ),
            tabs: _tabs.map((tab) => Tab(text: tab)).toList(),
          ),
        ),
        body: disputeAsync.when(
          data: (state) {
            final refunds = state.refunds;
            if (refunds.isEmpty) {
              return _buildEmptyState();
            }

            return RefreshIndicator(
              onRefresh: () async {
                await ref.read(disputeProvider.notifier).fetchRefunds();
              },
              color: const Color(0xFF0F172A),
              child: ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: refunds.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  return _buildRefundCard(context, refunds[index]);
                },
              ),
            );
          },
          loading: () => _buildShimmerLoadingList(),
          error: (error, _) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.error_outline,
                  size: 48,
                  color: Color(0xFFDC2626),
                ),
                const SizedBox(height: 12),
                Text(
                  'Lỗi tải dữ liệu: ${error.toString()}',
                  style: const TextStyle(color: Color(0xFF64748B)),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () =>
                      ref.read(disputeProvider.notifier).fetchRefunds(),
                  child: const Text('Thử lại'),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            // Mở dialog tạo yêu cầu hoàn tiền mẫu (Demo đơn DH8472)
            final success = await BuyerRefundDialog.show(context, 'DH8472');
            if (success == true) {
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Đã gửi yêu cầu hoàn tiền thành công!'),
                  ),
                );
              }
            }
          },
          backgroundColor: const Color(0xFF0F172A),
          icon: const Icon(Icons.add, color: Colors.white),
          label: const Text(
            'Tạo yêu cầu hoàn tiền',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontFamily: 'Inter',
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRefundCard(BuildContext context, RefundModel refund) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x05000000),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Order ID & Status Badge Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.receipt_long_outlined,
                    size: 18,
                    color: Color(0xFF64748B),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'Mã đơn: ${refund.orderId}',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF0F172A),
                      fontFamily: 'Inter',
                    ),
                  ),
                ],
              ),
              DisputeStatusBadge(status: refund.status),
            ],
          ),
          const Divider(height: 20, color: Color(0xFFF1F5F9)),

          // Refund Reason Preview
          Text(
            refund.reason,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 13,
              color: Color(0xFF334155),
              fontFamily: 'Inter',
              height: 1.4,
            ),
          ),
          const SizedBox(height: 12),

          // Attachments count indicator
          if (refund.attachments.isNotEmpty) ...[
            Row(
              children: [
                const Icon(
                  Icons.image_outlined,
                  size: 14,
                  color: Color(0xFF64748B),
                ),
                const SizedBox(width: 4),
                Text(
                  '${refund.attachments.length} bằng chứng đính kèm',
                  style: const TextStyle(
                    fontSize: 11,
                    color: Color(0xFF64748B),
                    fontFamily: 'Inter',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
          ],

          // Card Action Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Nút Rút yêu cầu: CHỈ HIỂN THỊ khi status là Shipping
              if (refund.canBuyerWithdraw) ...[
                OutlinedButton(
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
                    }
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFFDC2626),
                    side: const BorderSide(color: Color(0xFFFCA5A5)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: const Size(0, 36),
                  ),
                  child: const Text(
                    'Rút yêu cầu',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(width: 8),
              ],

              // Nút Xem chi tiết
              ElevatedButton(
                onPressed: () {
                  context.push('/dispute/${refund.id}');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0F172A),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: const Size(0, 36),
                ),
                child: const Text(
                  'Xem chi tiết',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontFamily: 'Inter',
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: const BoxDecoration(
              color: Color(0xFFF1F5F9),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.gavel_outlined,
              size: 40,
              color: Color(0xFF94A3B8),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Chưa có khiếu nại hoặc yêu cầu hoàn tiền nào',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Color(0xFF475569),
              fontFamily: 'Inter',
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Danh sách các đơn trả hàng và đối chất sẽ hiển thị tại đây.',
            style: TextStyle(
              fontSize: 12,
              color: Color(0xFF94A3B8),
              fontFamily: 'Inter',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShimmerLoadingList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 4,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Shimmer.fromColors(
          baseColor: const Color(0xFFE2E8F0),
          highlightColor: const Color(0xFFF1F5F9),
          child: Container(
            height: 140,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
      ),
    );
  }
}
