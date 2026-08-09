import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shopnexus_flutter_app/features/auth/presentation/providers/auth_provider.dart';
import 'package:shopnexus_flutter_app/features/chat/presentation/providers/inbox_unread_provider.dart';

/// Số trên badge. Trên 99 thì rút gọn: bốn chữ số không vừa một hình tròn 16px,
/// và "có rất nhiều" là toàn bộ thông tin mà một con số lớn mang lại.
String badgeLabel(int count) => count > 99 ? '99+' : '$count';

class MainLayout extends ConsumerWidget {
  final Widget child;

  const MainLayout({super.key, required this.child});

  int _getCurrentIndex(BuildContext context) {
    final String location = GoRouterState.of(context).matchedLocation;
    if (location.startsWith('/home')) return 0;
    if (location.startsWith('/search') || location.startsWith('/categories')) {
      return 1;
    }
    if (location.startsWith('/seller')) return 2;
    if (location.startsWith('/chat')) return 3;
    if (location.startsWith('/account')) return 4;
    return 0;
  }

  void _onTabTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/home');
        break;
      case 1:
        context.go('/search');
        break;
      case 2:
        // Nút "+" ở giữa điều hướng tới màn hình tạo sản phẩm (/seller/new-listing)
        context.push('/seller/new-listing');
        break;
      case 3:
        context.go('/chat');
        break;
      case 4:
        context.go('/account');
        break;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final currentIndex = _getCurrentIndex(context);

    // Thanh nav sống trên cả những trang công khai, nên khách chưa đăng nhập
    // cũng dựng nó. Cả hai nguồn dưới đây đều là route cần token: hỏi khi chưa
    // đăng nhập chỉ đổi được một loạt 401 lấy hai số 0 đã biết trước.
    // `maybeWhen` chứ không `is`: các nhánh của `AuthState` là class private của
    // file freezed, nên tên chúng không gọi được từ đây. `orElse` là false, nên
    // `initial`/`loading`/`error` cũng không hỏi — chưa biết là chưa đăng nhập.
    final signedIn = ref
        .watch(authProvider)
        .maybeWhen(
          authenticated: (accessToken, refreshToken) => true,
          orElse: () => false,
        );

    // `.value` với null-fallback, không `.when()`: cả hai nguồn đọc qua mạng khi
    // mở app, và một `loading` hay `error` được phép làm thanh nav không vẽ thì
    // toàn bộ điều hướng của app biến mất. Badge vắng thì chấp nhận được.
    final unread = signedIn ? (ref.watch(inboxUnreadProvider).value ?? 0) : 0;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      // Nền động theo Theme
      body: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: child,
        ),
      ),
      bottomNavigationBar: Container(
        height: 64.0 + MediaQuery.of(context).padding.bottom,
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16.0)),
          border: isDarkMode
              ? Border(
                  top: BorderSide(
                    color: theme.colorScheme.outlineVariant.withAlpha(40),
                    width: 1.0,
                  ),
                )
              : null,
          boxShadow: [
            BoxShadow(
              color: isDarkMode
                  ? Colors.black.withAlpha(80)
                  : Colors.black.withAlpha(12),
              offset: const Offset(0, -4),
              blurRadius: 20.0,
            ),
          ],
        ),
        child: SafeArea(
          top: false,
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: SizedBox(
                height: 64.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildTabItem(
                      context,
                      index: 0,
                      currentIndex: currentIndex,
                      icon: Icons.home_outlined,
                      activeIcon: Icons.home_rounded,
                      label: 'Trang chủ',
                    ),
                    _buildTabItem(
                      context,
                      index: 1,
                      currentIndex: currentIndex,
                      icon: Icons.search_rounded,
                      activeIcon: Icons.search_rounded,
                      label: 'Tìm kiếm',
                    ),
                    // Nút Đăng bán (Sell) ở giữa nổi bật
                    _buildSellButton(context, currentIndex: currentIndex),
                    _buildTabItem(
                      context,
                      index: 3,
                      currentIndex: currentIndex,
                      icon: Icons.chat_bubble_outline_rounded,
                      activeIcon: Icons.chat_bubble_rounded,
                      label: 'Tin nhắn',
                      badgeCount: unread,
                    ),
                    _buildTabItem(
                      context,
                      index: 4,
                      currentIndex: currentIndex,
                      icon: Icons.person_outline_rounded,
                      activeIcon: Icons.person_rounded,
                      label: 'Tài khoản',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTabItem(
    BuildContext context, {
    required int index,
    required int currentIndex,
    required IconData icon,
    required IconData activeIcon,
    required String label,

    /// Số chưa đọc. 0 nghĩa là không vẽ gì — một badge "0" là một badge nói rằng
    /// có gì đó phải xem.
    int badgeCount = 0,

    /// Chấm không số, cho chỗ có việc nhưng không có một con số nào mà tab này
    /// hứa được là đúng.
    bool showDot = false,
  }) {
    final theme = Theme.of(context);
    final isActive = index == currentIndex;
    final activeColor =
        theme.colorScheme.primary; // Primary từ Theme (Soft Teal ở Dark)
    final inactiveColor =
        theme.colorScheme.onSurfaceVariant; // outline từ Theme

    return GestureDetector(
      onTap: () => _onTabTapped(context, index),
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 64,
        height: 52,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _withOverlay(
              context,
              badgeCount: badgeCount,
              showDot: showDot,
              child: Icon(
                isActive ? activeIcon : icon,
                color: isActive ? activeColor : inactiveColor,
                size: 24,
              ),
            ),
            const SizedBox(height: 2.0),
            Text(
              label,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 10,
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                color: isActive ? activeColor : inactiveColor,
              ),
            ),
            if (isActive) ...[
              const SizedBox(height: 2.0),
              Container(
                width: 4.0,
                height: 4.0,
                decoration: BoxDecoration(
                  color: activeColor,
                  shape: BoxShape.circle,
                ),
              ),
            ] else
              const SizedBox(height: 6.0),
          ],
        ),
      ),
    );
  }

  /// Badge có số thắng chấm khi cả hai cùng có: một con số nói được nhiều hơn.
  /// Cả hai đều `IgnorePointer` và nằm ngoài luồng layout, nên chúng không hề
  /// dịch icon hay nhãn — thanh nav phải trông y như trước khi không có gì để báo.
  Widget _withOverlay(
    BuildContext context, {
    required Widget child,
    required int badgeCount,
    required bool showDot,
  }) {
    if (badgeCount <= 0 && !showDot) return child;

    final theme = Theme.of(context);
    final badgeColor = theme.colorScheme.error;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        child,
        Positioned(
          top: -4,
          right: -8,
          child: IgnorePointer(
            child: badgeCount > 0
                ? Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 4,
                      vertical: 1,
                    ),
                    constraints: const BoxConstraints(minWidth: 16),
                    decoration: BoxDecoration(
                      color: badgeColor,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: theme.colorScheme.surface,
                        width: 1.5,
                      ),
                    ),
                    child: Text(
                      badgeLabel(badgeCount),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 9,
                        height: 1.2,
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.onError,
                      ),
                    ),
                  )
                : Container(
                    width: 9,
                    height: 9,
                    decoration: BoxDecoration(
                      color: badgeColor,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: theme.colorScheme.surface,
                        width: 1.5,
                      ),
                    ),
                  ),
          ),
        ),
      ],
    );
  }

  Widget _buildSellButton(BuildContext context, {required int currentIndex}) {
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;

    return GestureDetector(
      onTap: () => _onTabTapped(context, 2),
      child: Container(
        width: 44,
        height: 44,
        margin: const EdgeInsets.only(bottom: 4),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(12.0),
          // Bo góc 12px theo chuẩn Stitch
          boxShadow: [
            BoxShadow(
              color: primaryColor.withAlpha(60),
              offset: const Offset(0, 4),
              blurRadius: 10.0,
            ),
          ],
        ),
        child: Icon(
          Icons.add_circle_outline_rounded,
          color: theme.colorScheme.onPrimary,
          size: 24,
        ),
      ),
    );
  }
}
