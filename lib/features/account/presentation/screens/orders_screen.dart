import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/widgets/orders_list.dart';

/// Màn hình Đơn hàng gồm 6 tab trạng thái:
/// 0: Tất cả
/// 1: Chờ xác nhận
/// 2: Đang xử lý
/// 3: Hoàn thành
/// 4: Hoàn tiền
/// 5: Đã hủy
class OrdersScreen extends ConsumerWidget {
  final int initialTabIndex;

  const OrdersScreen({super.key, this.initialTabIndex = 0});

  static const _tabTitles = [
    'Tất cả',
    'Chờ xác nhận',
    'Đang xử lý',
    'Hoàn thành',
    'Hoàn tiền',
    'Đã hủy',
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return DefaultTabController(
      length: _tabTitles.length,
      initialIndex: initialTabIndex.clamp(0, _tabTitles.length - 1),
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
                  for (final title in _tabTitles)
                    Tab(
                      height: 36,
                      child: Text(title),
                    ),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            for (var i = 0; i < _tabTitles.length; i++)
              OrdersList(selectedTab: i),
          ],
        ),
      ),
    );
  }
}
