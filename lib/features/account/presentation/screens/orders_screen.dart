import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shopnexus_flutter_app/features/account/data/models/orders_tab.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/widgets/orders_list.dart';

/// Màn hình Đơn hàng. Tab nào và tab ấy hỏi gì: xem [OrdersTab] — chỗ này chỉ vẽ
/// chúng ra, để cái nhãn trên tab và cái điều kiện lọc phía sau không thể lệch
/// nhau.
class OrdersScreen extends ConsumerWidget {
  /// Chỉ số tab từ liên kết sâu (`/account/orders?tab=2`).
  final int initialTabIndex;

  const OrdersScreen({super.key, this.initialTabIndex = 0});

  static const _tabs = OrdersTab.buyerTabs;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return DefaultTabController(
      length: _tabs.length,
      initialIndex: _tabs.indexOf(OrdersTab.fromIndex(initialTabIndex)),
      child: Scaffold(
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
            'Đơn hàng của tôi',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.primary,
              fontFamily: 'Manrope',
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(48),
            child: Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: TabBar(
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                dividerColor: Colors.transparent,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                  color: theme.colorScheme.primary,
                  borderRadius: BorderRadius.circular(24),
                ),
                labelColor: theme.colorScheme.onPrimary,
                unselectedLabelColor: theme.colorScheme.onSurfaceVariant,
                labelPadding: const EdgeInsets.symmetric(horizontal: 14),
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Inter',
                  fontSize: 13,
                ),
                unselectedLabelStyle: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Inter',
                  fontSize: 13,
                ),
                tabs: [
                  for (final tab in _tabs)
                    Tab(height: 36, child: Text(tab.label)),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [for (final tab in _tabs) OrdersList(tab: tab)],
        ),
      ),
    );
  }
}
