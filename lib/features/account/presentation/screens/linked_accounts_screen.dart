import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopnexus_flutter_app/api/generated/model/o_auth_identity.dart';
import 'package:shopnexus_flutter_app/features/account/data/repositories/account_repository.dart';

/// Google/Apple đã liên kết với tài khoản này.
///
/// Server giữ luật "luôn còn ít nhất một cách để đăng nhập" — bỏ liên kết cuối
/// cùng khi tài khoản không có mật khẩu sẽ bị **từ chối ở đó**, không ở đây. Nên
/// màn này không tự đoán xem cái nào bỏ được: nó gửi, và hiện đúng lý do server
/// trả về. Một luật viết hai lần là một luật sẽ lệch.
class LinkedAccountsScreen extends ConsumerStatefulWidget {
  const LinkedAccountsScreen({super.key});

  @override
  ConsumerState<LinkedAccountsScreen> createState() =>
      _LinkedAccountsScreenState();
}

class _LinkedAccountsScreenState extends ConsumerState<LinkedAccountsScreen> {
  late Future<List<OAuthIdentity>> _future;
  String? _unlinking;

  @override
  void initState() {
    super.initState();
    _future = ref.read(accountRepositoryProvider).oauthIdentities();
  }

  void _reload() {
    setState(() {
      _future = ref.read(accountRepositoryProvider).oauthIdentities();
    });
  }

  static const _labels = {'google': 'Google', 'apple': 'Apple'};

  Future<void> _unlink(OAuthIdentity identity) async {
    final label = _labels[identity.provider] ?? identity.provider;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Bỏ liên kết $label?'),
        content: Text(
          'Bạn sẽ không đăng nhập bằng $label được nữa. Tài khoản và đơn hàng '
          'của bạn không thay đổi.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Giữ lại'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Bỏ liên kết'),
          ),
        ],
      ),
    );
    if (confirmed != true) return;

    setState(() => _unlinking = identity.provider);
    try {
      await ref.read(accountRepositoryProvider).unlinkOauth(identity.provider);
      if (!mounted) return;
      _reload();
    } catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            // Lý do thật hay gặp nhất ở đây là "đây là cách đăng nhập duy nhất
            // của bạn", và câu đó phải tới từ server chứ không phải phỏng đoán.
            _messageOf(error) ?? 'Không bỏ liên kết được',
          ),
        ),
      );
    } finally {
      if (mounted) setState(() => _unlinking = null);
    }
  }

  static String _date(DateTime at) {
    final local = at.toLocal();
    return '${local.day}/${local.month}/${local.year}';
  }

  static String? _messageOf(Object error) {
    final text = error.toString();
    final match = RegExp(r'"message"\s*:\s*"([^"]+)"').firstMatch(text);
    return match?.group(1);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Tài khoản liên kết')),
      body: FutureBuilder<List<OAuthIdentity>>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Không tải được danh sách'),
                  const SizedBox(height: 8),
                  TextButton(onPressed: _reload, child: const Text('Thử lại')),
                ],
              ),
            );
          }

          final identities = snapshot.data ?? const <OAuthIdentity>[];
          if (identities.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.link_off_rounded,
                      size: 48,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Chưa liên kết tài khoản nào',
                      style: theme.textTheme.titleMedium,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      // Không có nút "Liên kết ngay" ở đây: liên kết xảy ra ở
                      // màn đăng nhập, và một nút dẫn tới chỗ phải đăng xuất
                      // mới dùng được là một nút gài bẫy.
                      'Bạn đăng nhập bằng Google hoặc Apple ở màn đăng nhập, '
                      'và lần đó sẽ tạo liên kết.',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          return ListView.separated(
            itemCount: identities.length,
            separatorBuilder: (_, _) => Divider(
              height: 1,
              indent: 16,
              color: theme.colorScheme.outlineVariant,
            ),
            itemBuilder: (context, index) {
              final identity = identities[index];
              final busy = _unlinking == identity.provider;

              return ListTile(
                leading: Icon(
                  identity.provider == 'apple'
                      ? Icons.apple_rounded
                      : Icons.g_mobiledata_rounded,
                  size: 28,
                ),
                title: Text(_labels[identity.provider] ?? identity.provider),
                subtitle: Text(
                  // Server không trả email của bên thứ ba, nên nói cái nó có:
                  // ngày liên kết là thứ giúp nhận ra "cái này tôi làm hồi nào".
                  'Đã liên kết ${_date(identity.createdAt)}',
                  style: TextStyle(
                    fontSize: 12,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                trailing: busy
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : TextButton(
                        onPressed: _unlinking != null
                            ? null
                            : () => _unlink(identity),
                        child: const Text('Bỏ liên kết'),
                      ),
              );
            },
          );
        },
      ),
    );
  }
}
