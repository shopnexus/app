import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainLayout extends StatelessWidget {
  final Widget child;

  const MainLayout({super.key, required this.child});

  int _getCurrentIndex(BuildContext context) {
    final String location = GoRouterState.of(context).matchedLocation;
    if (location.startsWith('/home')) return 0;
    if (location.startsWith('/search') || location.startsWith('/categories')) return 1;
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
        context.go('/seller');
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
  Widget build(BuildContext context) {
    final currentIndex = _getCurrentIndex(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F6), // Đồng bộ nền sáng sữa Nexus toàn màn hình
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
          color: Colors.white,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(12),
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
                      label: 'Home',
                    ),
                    _buildTabItem(
                      context,
                      index: 1,
                      currentIndex: currentIndex,
                      icon: Icons.search_rounded,
                      activeIcon: Icons.search_rounded,
                      label: 'Search',
                    ),
                    // Nút Đăng bán (Sell) ở giữa nổi bật
                    _buildSellButton(context, currentIndex: currentIndex),
                    _buildTabItem(
                      context,
                      index: 3,
                      currentIndex: currentIndex,
                      icon: Icons.chat_bubble_outline_rounded,
                      activeIcon: Icons.chat_bubble_rounded,
                      label: 'Inbox',
                    ),
                    _buildTabItem(
                      context,
                      index: 4,
                      currentIndex: currentIndex,
                      icon: Icons.person_outline_rounded,
                      activeIcon: Icons.person_rounded,
                      label: 'You',
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
  }) {
    final isActive = index == currentIndex;
    final activeColor = const Color(0xFF005049); // Primary Teal từ Nexus
    final inactiveColor = const Color(0xFF6E7977); // outline từ Nexus

    return GestureDetector(
      onTap: () => _onTabTapped(context, index),
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 64,
        height: 52,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isActive ? activeIcon : icon,
              color: isActive ? activeColor : inactiveColor,
              size: 24,
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

  Widget _buildSellButton(BuildContext context, {required int currentIndex}) {
    final primaryColor = const Color(0xFF005049);

    return GestureDetector(
      onTap: () => _onTabTapped(context, 2),
      child: Container(
        width: 44,
        height: 44,
        margin: const EdgeInsets.only(bottom: 4),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(12.0), // Bo góc 12px theo chuẩn Stitch
          boxShadow: [
            BoxShadow(
              color: primaryColor.withAlpha(60),
              offset: const Offset(0, 4),
              blurRadius: 10.0,
            ),
          ],
        ),
        child: const Icon(
          Icons.add_circle_outline_rounded,
          color: Colors.white,
          size: 24,
        ),
      ),
    );
  }
}
