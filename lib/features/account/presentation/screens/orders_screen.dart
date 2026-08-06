import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/widgets/orders_list.dart';

/// Đơn hàng: một danh sách, ba nhóm theo lượt.
///
/// Segment "Tôi mua | Tôi bán" đã bỏ. Nó tồn tại vì `/orders` từng **bắt buộc**
/// có `role`, nên UI phải hỏi trước khi hỏi được server — chứ không vì ai cần
/// chọn vai. Route giờ nhận cả hai chiều trong một lượt đọc, và cái quyết định
/// thứ tự là ai đang giữ lượt: xem [OrdersList].
class OrdersScreen extends ConsumerWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
      body: const OrdersList(),
    );
  }
}
