import 'package:flutter/material.dart';

class SellerPlaceholderScreen extends StatelessWidget {
  const SellerPlaceholderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F7),
      appBar: AppBar(
        title: const Text('Đăng bán', style: TextStyle(fontFamily: 'Manrope', fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.storefront_rounded, size: 64, color: Color(0xFF6E7977)),
            const SizedBox(height: 16.0),
            Text(
              'Kênh người bán (Seller Center)',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontFamily: 'Manrope',
                    color: const Color(0xFF1A1C1B),
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Tính năng đang được phát triển...',
              style: TextStyle(fontFamily: 'Inter', color: Color(0xFF6E7977)),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatPlaceholderScreen extends StatelessWidget {
  const ChatPlaceholderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F7),
      appBar: AppBar(
        title: const Text('Tin nhắn', style: TextStyle(fontFamily: 'Manrope', fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.forum_rounded, size: 64, color: Color(0xFF6E7977)),
            const SizedBox(height: 16.0),
            Text(
              'Hộp thư tin nhắn (Inbox)',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontFamily: 'Manrope',
                    color: const Color(0xFF1A1C1B),
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Tính năng đang được phát triển...',
              style: TextStyle(fontFamily: 'Inter', color: Color(0xFF6E7977)),
            ),
          ],
        ),
      ),
    );
  }
}

class AccountPlaceholderScreen extends StatelessWidget {
  const AccountPlaceholderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F7),
      appBar: AppBar(
        title: const Text('Cá nhân', style: TextStyle(fontFamily: 'Manrope', fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.person_rounded, size: 64, color: Color(0xFF6E7977)),
            const SizedBox(height: 16.0),
            Text(
              'Trang cá nhân (Profile)',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontFamily: 'Manrope',
                    color: const Color(0xFF1A1C1B),
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Tính năng đang được phát triển...',
              style: TextStyle(fontFamily: 'Inter', color: Color(0xFF6E7977)),
            ),
          ],
        ),
      ),
    );
  }
}
