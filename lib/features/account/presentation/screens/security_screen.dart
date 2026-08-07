import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:shopnexus_flutter_app/api/generated/model/device.dart';
import 'package:shopnexus_flutter_app/api/generated/model/device_platform.dart';
import 'package:shopnexus_flutter_app/core/utils/error_handler.dart';
import 'package:shopnexus_flutter_app/features/account/data/models/account_model.dart';
import 'package:shopnexus_flutter_app/features/account/data/repositories/account_repository.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/providers/account_provider.dart';
import 'package:shopnexus_flutter_app/features/auth/data/models/auth_model.dart';
import 'package:shopnexus_flutter_app/features/auth/data/repositories/auth_repository.dart';

/// Cách vào tài khoản này: mật khẩu, email đã xác minh chưa, các nhà cung cấp đã
/// liên kết, và những máy đang nhận thông báo.
///
/// Bốn thứ đó nằm chung một màn vì chúng trả lời cùng một câu hỏi — "ai vào được
/// tài khoản của tôi" — và ba trong bốn cái trước đây không có đường nào để tới:
/// đổi mật khẩu, gửi lại thư xác minh và gỡ một thiết bị đều đã có sẵn ở server
/// và chưa từng được gọi từ app.
class SecurityScreen extends ConsumerStatefulWidget {
  const SecurityScreen({super.key});

  @override
  ConsumerState<SecurityScreen> createState() => _SecurityScreenState();
}

class _SecurityScreenState extends ConsumerState<SecurityScreen> {
  late Future<List<Device>> _devices;
  bool _sendingVerification = false;
  String? _revoking;

  @override
  void initState() {
    super.initState();
    _devices = ref.read(accountRepositoryProvider).devices();
  }

  void _reloadDevices() {
    setState(() {
      _devices = ref.read(accountRepositoryProvider).devices();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final profileAsync = ref.watch(profileProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Đăng nhập & bảo mật')),
      body: profileAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  ErrorHandler.getErrorMessage(error),
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium,
                ),
                const SizedBox(height: 12),
                TextButton(
                  onPressed: () => ref.invalidate(profileProvider),
                  child: const Text('Thử lại'),
                ),
              ],
            ),
          ),
        ),
        data: (profile) => ListView(
          padding: const EdgeInsets.symmetric(vertical: 8),
          children: [
            _sectionTitle('Email'),
            _emailTile(profile),
            const Divider(height: 24),
            _sectionTitle('Mật khẩu'),
            _passwordTile(profile),
            const Divider(height: 24),
            _sectionTitle('Tài khoản liên kết'),
            ListTile(
              leading: const Icon(Icons.link_rounded),
              title: const Text('Google, Apple đã liên kết'),
              subtitle: const Text('Xem và bỏ liên kết'),
              trailing: const Icon(Icons.chevron_right_rounded),
              onTap: () => context.push('/account/linked-accounts'),
            ),
            const Divider(height: 24),
            _sectionTitle('Thiết bị nhận thông báo'),
            _devicesSection(),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) => Padding(
    padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
    child: Text(
      title,
      style: Theme.of(
        context,
      ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
    ),
  );

  // --- Email ---

  Widget _emailTile(Me profile) {
    final theme = Theme.of(context);
    final email = profile.email;

    if (email == null || email.isEmpty) {
      return const ListTile(
        leading: Icon(Icons.email_outlined),
        title: Text('Chưa có email'),
        subtitle: Text(
          'Thêm email ở Cài đặt để nhận thư khôi phục mật khẩu.',
        ),
      );
    }

    if (profile.emailVerified) {
      return ListTile(
        leading: const Icon(Icons.mark_email_read_outlined),
        title: Text(email),
        subtitle: Text(
          'Đã xác minh',
          style: TextStyle(color: theme.colorScheme.primary),
        ),
      );
    }

    return ListTile(
      leading: const Icon(Icons.mark_email_unread_outlined),
      title: Text(email),
      subtitle: const Text(
        // Không có ô nhập mã ở đây: liên kết trong thư mang một token 43 ký tự
        // và mở bằng trình duyệt, không phải thứ gõ tay lại được.
        'Chưa xác minh. Nhấn để nhận lại liên kết xác minh qua email.',
      ),
      trailing: _sendingVerification
          ? const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          : TextButton(
              onPressed: _sendVerificationEmail,
              child: const Text('Gửi lại'),
            ),
    );
  }

  Future<void> _sendVerificationEmail() async {
    setState(() => _sendingVerification = true);
    try {
      await ref.read(authRepositoryProvider).requestEmailVerification();
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Đã gửi thư xác minh, hãy kiểm tra hộp thư của bạn'),
        ),
      );
    } catch (error) {
      if (!mounted) return;
      // 409 "đã xác minh rồi" và 429 "vừa gửi xong" đều là câu server viết, và
      // đoán lại ở đây sẽ nói sai một trong hai.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(ErrorHandler.getErrorMessage(error))),
      );
      // Trạng thái đã đổi khi lỗi là "đã xác minh rồi" — đọc lại thay vì để màn
      // hình khăng khăng cái nó vẽ lúc mở.
      ref.invalidate(profileProvider);
    } finally {
      if (mounted) setState(() => _sendingVerification = false);
    }
  }

  // --- Password ---

  Widget _passwordTile(Me profile) {
    if (!profile.hasPassword) {
      return const ListTile(
        leading: Icon(Icons.password_outlined),
        title: Text('Tài khoản này chưa có mật khẩu'),
        // Server từ chối đổi mật khẩu (422) cho một tài khoản chỉ đăng nhập bằng
        // nhà cung cấp, nên ở đây không có nút — đường đặt mật khẩu là "Quên mật
        // khẩu" ở màn đăng nhập.
        subtitle: Text(
          'Bạn đang đăng nhập bằng Google hoặc Apple. Dùng "Quên mật khẩu" ở '
          'màn đăng nhập nếu muốn đặt một mật khẩu.',
        ),
      );
    }

    return ListTile(
      leading: const Icon(Icons.lock_outline_rounded),
      title: const Text('Đổi mật khẩu'),
      subtitle: const Text(
        'Cần mật khẩu hiện tại. Mọi phiên đăng nhập khác sẽ bị đăng xuất.',
      ),
      trailing: const Icon(Icons.chevron_right_rounded),
      onTap: _showChangePasswordSheet,
    );
  }

  Future<void> _showChangePasswordSheet() async {
    final changed = await showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Theme.of(context).colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => const _ChangePasswordSheet(),
    );
    if (changed != true || !mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Đã đổi mật khẩu. Các thiết bị khác cần đăng nhập lại.'),
      ),
    );
  }

  // --- Devices ---

  static const _platformLabels = {
    DevicePlatform.ios: 'iPhone / iPad',
    DevicePlatform.android: 'Android',
    DevicePlatform.web: 'Trình duyệt web',
  };

  Widget _devicesSection() {
    final theme = Theme.of(context);

    return FutureBuilder<List<Device>>(
      future: _devices,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Padding(
            padding: EdgeInsets.all(24),
            child: Center(child: CircularProgressIndicator()),
          );
        }
        if (snapshot.hasError) {
          return ListTile(
            title: Text(ErrorHandler.getErrorMessage(snapshot.error)),
            trailing: TextButton(
              onPressed: _reloadDevices,
              child: const Text('Thử lại'),
            ),
          );
        }

        final devices = snapshot.data ?? const <Device>[];
        if (devices.isEmpty) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 16),
            child: Text(
              'Không có thiết bị nào đang nhận thông báo đẩy của tài khoản này.',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          );
        }

        return Column(
          children: [
            for (final device in devices)
              ListTile(
                leading: Icon(switch (device.platform) {
                  DevicePlatform.ios => Icons.phone_iphone_rounded,
                  DevicePlatform.android => Icons.phone_android_rounded,
                  DevicePlatform.web => Icons.language_rounded,
                }),
                title: Text(
                  _platformLabels[device.platform] ?? device.platform.value,
                ),
                subtitle: Text(
                  // Đuôi token là thứ duy nhất phân biệt được hai máy cùng hệ
                  // điều hành — server không trả cả token, vì đó là khoá gửi tin.
                  '···${device.pushTokenSuffix} · '
                  'hoạt động ${_dateTime(device.lastSeenAt)}',
                  style: TextStyle(
                    fontSize: 12,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                trailing: _revoking == device.id
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : TextButton(
                        onPressed: _revoking != null
                            ? null
                            : () => _revokeDevice(device),
                        child: const Text('Gỡ'),
                      ),
              ),
          ],
        );
      },
    );
  }

  Future<void> _revokeDevice(Device device) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Gỡ thiết bị này?'),
        content: const Text(
          'Thiết bị đó sẽ ngừng nhận thông báo. Phiên đăng nhập trên đó không '
          'thay đổi.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: const Text('Giữ lại'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, true),
            child: const Text('Gỡ'),
          ),
        ],
      ),
    );
    if (confirmed != true) return;

    setState(() => _revoking = device.id);
    try {
      await ref.read(accountRepositoryProvider).unregisterDevice(device.id);
      if (!mounted) return;
      _reloadDevices();
    } catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(ErrorHandler.getErrorMessage(error))),
      );
    } finally {
      if (mounted) setState(() => _revoking = null);
    }
  }

  static String _dateTime(DateTime value) {
    final local = value.toLocal();
    String two(int n) => n.toString().padLeft(2, '0');
    return '${two(local.day)}/${two(local.month)}/${local.year} '
        '${two(local.hour)}:${two(local.minute)}';
  }
}

class _ChangePasswordSheet extends ConsumerStatefulWidget {
  const _ChangePasswordSheet();

  @override
  ConsumerState<_ChangePasswordSheet> createState() =>
      _ChangePasswordSheetState();
}

class _ChangePasswordSheetState extends ConsumerState<_ChangePasswordSheet> {
  final _formKey = GlobalKey<FormState>();
  final _current = TextEditingController();
  final _next = TextEditingController();
  final _confirm = TextEditingController();
  bool _saving = false;
  String? _error;

  @override
  void dispose() {
    _current.dispose();
    _next.dispose();
    _confirm.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    setState(() {
      _saving = true;
      _error = null;
    });
    try {
      await ref
          .read(authRepositoryProvider)
          .changePassword(
            ChangePasswordRequest(
              currentPassword: _current.text,
              newPassword: _next.text,
            ),
          );
      if (!mounted) return;
      Navigator.pop(context, true);
    } catch (error) {
      if (!mounted) return;
      // 401 ở route này nghĩa là "mật khẩu hiện tại sai", không phải "hết phiên".
      setState(() => _error = ErrorHandler.getErrorMessage(error));
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 24,
        bottom: MediaQuery.of(context).viewInsets.bottom + 24,
      ),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Đổi mật khẩu',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _current,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Mật khẩu hiện tại',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => (value == null || value.isEmpty)
                    ? 'Nhập mật khẩu hiện tại'
                    : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _next,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Mật khẩu mới',
                  border: OutlineInputBorder(),
                ),
                // 8..72 là ràng buộc của server; kiểm ở đây để một mật khẩu quá
                // ngắn không phải đi một vòng mạng mới biết.
                validator: (value) {
                  final password = value ?? '';
                  if (password.length < 8) return 'Ít nhất 8 ký tự';
                  if (password.length > 72) return 'Tối đa 72 ký tự';
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _confirm,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Nhập lại mật khẩu mới',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value == _next.text ? null : 'Hai mật khẩu không khớp',
              ),
              if (_error != null) ...[
                const SizedBox(height: 12),
                Text(
                  _error!,
                  style: TextStyle(
                    fontSize: 13,
                    color: theme.colorScheme.error,
                  ),
                ),
              ],
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: _saving ? null : _submit,
                  child: _saving
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text('Đổi mật khẩu'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
