import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shopnexus_flutter_app/features/account/data/repositories/account_repository.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/providers/action_inbox_provider.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/widgets/orders_list.dart';

/// Đơn hàng: một segment cho vai, hai nhóm cho trạng thái.
///
/// Thay cho chín vị trí tab (năm bên mua, bốn bên bán) trên hai màn hình. Segment
/// ở lại thay vì trộn một danh sách: `/orders` bắt buộc có `role`, nên gộp hai
/// vai lại là hai lượt gọi và hai nguồn cursor phải trộn tay — không đáng để bớt
/// một lần chạm.
class OrdersScreen extends ConsumerStatefulWidget {
  const OrdersScreen({super.key, this.initialRole});

  /// Vai mở sẵn. `null` nghĩa là không ai chỉ định — lúc đó màn tự chọn theo việc
  /// đang chờ chính người này.
  final OrderRole? initialRole;

  @override
  ConsumerState<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends ConsumerState<OrdersScreen> {
  late OrderRole _role;

  @override
  void initState() {
    super.initState();
    // `read`, một lần, và không chờ: nếu khối việc-cần-làm chưa trả lời thì mặc
    // định là "Tôi mua". Watch ở đây sẽ làm segment tự nhảy sang "Tôi bán" sau
    // frame đầu, ngay dưới tay người đang đọc danh sách đơn mua của họ.
    _role =
        widget.initialRole ??
        (((ref.read(actionInboxProvider).value?.ordersToConfirm) ?? 0) > 0
            ? OrderRole.seller
            : OrderRole.buyer);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.surface,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: theme.colorScheme.onSurface),
          onPressed: () => context.pop(),
        ),
        title: Text(
          'Đơn hàng',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.primary,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: SegmentedButton<OrderRole>(
              segments: const [
                ButtonSegment(value: OrderRole.buyer, label: Text('Tôi mua')),
                ButtonSegment(value: OrderRole.seller, label: Text('Tôi bán')),
              ],
              selected: {_role},
              showSelectedIcon: false,
              onSelectionChanged: (selection) =>
                  setState(() => _role = selection.first),
            ),
          ),
          Expanded(child: OrdersList(role: _role)),
        ],
      ),
    );
  }
}
