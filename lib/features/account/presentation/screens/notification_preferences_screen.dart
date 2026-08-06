import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopnexus_flutter_app/api/generated/model/notification_category.dart';
import 'package:shopnexus_flutter_app/api/generated/model/notification_channel.dart';
import 'package:shopnexus_flutter_app/api/generated/model/notification_preference.dart';
import 'package:shopnexus_flutter_app/features/account/data/repositories/account_repository.dart';

/// Loại thông báo nào được vào Hộp thư.
///
/// Server trả cả ma trận 5 loại × 4 kênh, nhưng **chỉ `in-app` quyết định điều
/// gì** — không chỗ nào trong backend đọc `push`/`email`/`sms` khi gửi, nên bày
/// chúng ra là bày 15 cái công tắc không nối với gì. Đúng cái lỗi mà công tắc
/// "Thông báo đẩy" cũ ở màn Cài đặt đã mắc: bật rồi thoát là mất, vì nó chưa bao
/// giờ đi tới đâu.
///
/// Nên: một công tắc mỗi loại, và nói ra nó tắt cái gì.
class NotificationPreferencesScreen extends ConsumerStatefulWidget {
  const NotificationPreferencesScreen({super.key});

  @override
  ConsumerState<NotificationPreferencesScreen> createState() =>
      _NotificationPreferencesScreenState();
}

class _NotificationPreferencesScreenState
    extends ConsumerState<NotificationPreferencesScreen> {
  /// Thứ tự cố định, không theo thứ tự server trả: người đọc quét từ thứ ảnh
  /// hưởng tiền xuống thứ chỉ để biết.
  static const _order = [
    NotificationCategory.order,
    NotificationCategory.chat,
    NotificationCategory.social,
    NotificationCategory.system,
    NotificationCategory.promotion,
  ];

  static const _titles = {
    NotificationCategory.order: 'Đơn hàng',
    NotificationCategory.chat: 'Tin nhắn',
    NotificationCategory.social: 'Người bạn theo dõi',
    NotificationCategory.system: 'Hệ thống',
    NotificationCategory.promotion: 'Ưu đãi',
  };

  static const _notes = {
    NotificationCategory.order:
        'Người bán xác nhận, hàng đang đi, yêu cầu hoàn tiền được xử lý.',
    NotificationCategory.chat: 'Có người nhắn tin hoặc trả giá cho bạn.',
    NotificationCategory.social: 'Người bạn theo dõi đăng tin mới.',
    NotificationCategory.system:
        'Bảo mật, xác minh danh tính, thông báo chung.',
    NotificationCategory.promotion: 'Khuyến mãi và gợi ý từ ShopNexus.',
  };

  late Future<Map<NotificationCategory, bool>> _future;
  Map<NotificationCategory, bool>? _enabled;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    _future = _load();
  }

  Future<Map<NotificationCategory, bool>> _load() async {
    final preferences = await ref
        .read(accountRepositoryProvider)
        .notificationPreferences();
    final map = {
      for (final preference in preferences)
        if (preference.channel == NotificationChannel.inApp)
          preference.category: preference.isEnabled,
    };
    _enabled = map;
    return map;
  }

  Future<void> _toggle(NotificationCategory category, bool value) async {
    final previous = _enabled![category] ?? true;
    setState(() {
      _enabled![category] = value;
      _saving = true;
    });

    try {
      await ref.read(accountRepositoryProvider).saveNotificationPreferences([
        for (final entry in _enabled!.entries)
          NotificationPreference(
            category: entry.key,
            channel: NotificationChannel.inApp,
            isEnabled: entry.value,
            // Server tự tính lại: nó lưu thưa, chỉ ghi cái lệch mặc định.
            isDefault: false,
          ),
      ]);
    } catch (_) {
      if (!mounted) return;
      // Trả công tắc về chỗ cũ: một công tắc đứng ở vị trí mới trong khi server
      // vẫn giữ giá trị cũ là đúng cái dối mà màn này ra đời để bỏ.
      setState(() => _enabled![category] = previous);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Không lưu được, thử lại sau')),
      );
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Thông báo')),
      body: FutureBuilder<Map<NotificationCategory, bool>>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Không tải được tuỳ chọn'),
                    const SizedBox(height: 8),
                    TextButton(
                      onPressed: () => setState(() => _future = _load()),
                      child: const Text('Thử lại'),
                    ),
                  ],
                ),
              ),
            );
          }

          return ListView(
            padding: const EdgeInsets.only(bottom: 32),
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Text(
                  'Những gì hiện trong Hộp thư của bạn.',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
              for (final category in _order)
                SwitchListTile(
                  title: Text(_titles[category]!),
                  subtitle: Text(
                    _notes[category]!,
                    style: TextStyle(
                      fontSize: 12,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  value: _enabled?[category] ?? true,
                  // Không chặn loại nào ở đây: server cho tắt cả `system`, và một
                  // luật do client tự nghĩ ra là một luật server không giữ.
                  onChanged: _saving
                      ? null
                      : (value) => _toggle(category, value),
                ),
            ],
          );
        },
      ),
    );
  }
}
