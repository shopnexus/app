import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../kyc/data/models/kyc_model.dart';
import '../../../kyc/presentation/providers/kyc_provider.dart';
import '../../data/models/account_model.dart';
import '../providers/account_provider.dart';

class AccountCenterScreen extends ConsumerStatefulWidget {
  const AccountCenterScreen({super.key});

  @override
  ConsumerState<AccountCenterScreen> createState() =>
      _AccountCenterScreenState();
}

class _AccountCenterScreenState extends ConsumerState<AccountCenterScreen> {
  void _showEditProfileBottomSheet(AccountProfile profile) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: isDarkMode ? AppColors.darkSurface : Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) => _EditAccountCenterFormSheet(profile: profile),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final profileAsync = ref.watch(profileProvider);
    final kycState = ref.watch(kycProvider);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.surface,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: theme.colorScheme.onSurface,
            size: 20,
          ),
          onPressed: () => context.pop(),
        ),
        title: Text(
          'Account Center',
          style: TextStyle(
            color: theme.colorScheme.onSurface,
            fontWeight: FontWeight.bold,
            fontFamily: 'Manrope',
            fontSize: 20,
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(profileProvider);
          await ref.read(profileProvider.future);
        },
        child: profileAsync.when(
          data: (profile) => SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1. KYC Verification Banner & Entry Point
                _buildKycCenterCard(kycState.kycModel),

                const SizedBox(height: 24),

                // 2. Detailed Account Information List
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Thông tin tài khoản chi tiết',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Manrope',
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () => _showEditProfileBottomSheet(profile),
                      icon: const Icon(Icons.edit_outlined, size: 16),
                      label: const Text(
                        'Chỉnh sửa',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Inter',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                Container(
                  decoration: BoxDecoration(
                    color: isDarkMode ? AppColors.darkSurface : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: isDarkMode
                          ? AppColors.darkPrimary.withValues(alpha: 0.2)
                          : const Color(0xFFE2E8F0),
                    ),
                  ),
                  child: Column(
                    children: [
                      _buildInfoTile(
                        icon: Icons.person_outline_rounded,
                        label: 'Họ và tên',
                        value: profile.name ?? 'Chưa cập nhật',
                      ),
                      _buildDivider(),
                      _buildInfoTile(
                        icon: Icons.alternate_email_rounded,
                        label: 'Tên người dùng (Username)',
                        value: profile.username ?? 'Chưa thiết lập',
                      ),
                      _buildDivider(),
                      _buildInfoTile(
                        icon: Icons.email_outlined,
                        label: 'Email liên hệ',
                        value: profile.email ?? 'Chưa liên kết Email',
                        badgeText: profile.emailVerified ? 'Đã xác minh' : 'Chưa xác minh',
                        badgeColor: profile.emailVerified
                            ? const Color(0xFF10B981)
                            : const Color(0xFFF59E0B),
                      ),
                      _buildDivider(),
                      _buildInfoTile(
                        icon: Icons.phone_outlined,
                        label: 'Số điện thoại',
                        value: profile.phone ?? 'Chưa cập nhật SĐT',
                        badgeText: profile.phoneVerified ? 'Đã xác minh' : 'Chưa xác minh',
                        badgeColor: profile.phoneVerified
                            ? const Color(0xFF10B981)
                            : const Color(0xFFF59E0B),
                      ),
                      _buildDivider(),
                      _buildInfoTile(
                        icon: Icons.wc_rounded,
                        label: 'Giới tính',
                        value: _formatGender(profile.gender),
                      ),
                      _buildDivider(),
                      _buildInfoTile(
                        icon: Icons.cake_outlined,
                        label: 'Ngày sinh',
                        value: profile.dateOfBirth ?? 'Chưa cập nhật',
                      ),
                      _buildDivider(),
                      _buildInfoTile(
                        icon: Icons.calendar_today_rounded,
                        label: 'Ngày tham gia',
                        value: _formatDate(profile.dateCreated),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, _) => Center(
            child: Text('Không thể tải dữ liệu: $err'),
          ),
        ),
      ),
    );
  }

  Widget _buildKycCenterCard(KycModel? kyc) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final status = kyc?.status ?? KycStatus.unverified;

    String statusText;
    Color statusColor;
    IconData statusIcon;

    switch (status) {
      case KycStatus.verified:
        statusText = 'Đã xác minh KYC';
        statusColor = const Color(0xFF10B981);
        statusIcon = Icons.verified_rounded;
        break;
      case KycStatus.pending:
        statusText = 'Đang chờ xét duyệt';
        statusColor = const Color(0xFFF59E0B);
        statusIcon = Icons.pending_actions_rounded;
        break;
      case KycStatus.rejected:
        statusText = 'Bị từ chối - Cần nộp lại';
        statusColor = const Color(0xFFEF4444);
        statusIcon = Icons.error_rounded;
        break;
      case KycStatus.unverified:
        statusText = 'Chưa xác minh danh tính';
        statusColor = const Color(0xFF64748B);
        statusIcon = Icons.shield_outlined;
        break;
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDarkMode ? AppColors.darkSurface : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: statusColor.withValues(alpha: 0.3),
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: statusColor.withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                ),
                child: Icon(statusIcon, color: statusColor, size: 24),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Định danh tài khoản (KYC)',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Manrope',
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      statusText,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Inter',
                        color: statusColor,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right_rounded,
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'Chụp ảnh CCCD mặt trước, mặt sau và chân dung để mở khóa toàn bộ quyền lợi giao dịch trên hệ thống.',
            style: TextStyle(
              fontSize: 12.5,
              color: theme.colorScheme.onSurfaceVariant,
              fontFamily: 'Inter',
              height: 1.35,
            ),
          ),
          const SizedBox(height: 14),
          SizedBox(
            width: double.infinity,
            height: 44,
            child: OutlinedButton.icon(
              onPressed: () => context.push('/account/kyc'),
              icon: Icon(
                status == KycStatus.verified
                    ? Icons.remove_red_eye_outlined
                    : Icons.badge_outlined,
                size: 18,
              ),
              label: Text(
                status == KycStatus.verified
                    ? 'Xem thông tin KYC đã nộp'
                    : 'Thực hiện xác minh KYC ngay',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Inter',
                ),
              ),
              style: OutlinedButton.styleFrom(
                foregroundColor: theme.colorScheme.primary,
                side: BorderSide(color: theme.colorScheme.primary),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoTile({
    required IconData icon,
    required String label,
    required String value,
    String? badgeText,
    Color? badgeColor,
    Color? valueColor,
    Widget? trailing,
  }) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          Icon(icon, size: 20, color: theme.colorScheme.primary),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 12,
                    color: theme.colorScheme.onSurfaceVariant,
                    fontFamily: 'Inter',
                  ),
                ),
                const SizedBox(height: 3),
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        value,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Inter',
                          color: valueColor ?? theme.colorScheme.onSurface,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (badgeText != null) ...[
                      const SizedBox(width: 8),
                      _buildMiniBadge(
                        label: badgeText,
                        color: badgeColor?.withValues(alpha: 0.15) ??
                            Colors.grey.shade200,
                        textColor: badgeColor ?? Colors.black87,
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
          ?trailing,
        ],
      ),
    );
  }

  Widget _buildDivider() {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    return Divider(
      height: 1,
      color: isDarkMode
          ? AppColors.darkPrimary.withValues(alpha: 0.15)
          : const Color(0xFFF1F5F9),
      indent: 50,
    );
  }

  Widget _buildMiniBadge({
    required String label,
    required Color color,
    required Color textColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.bold,
          color: textColor,
          fontFamily: 'Inter',
        ),
      ),
    );
  }

  String _formatGender(String? g) {
    if (g == null || g.isEmpty) return 'Chưa cập nhật';
    if (g.toLowerCase() == 'male') return 'Nam';
    if (g.toLowerCase() == 'female') return 'Nữ';
    return 'Khác';
  }

  String _formatDate(String isoStr) {
    try {
      final dt = DateTime.parse(isoStr);
      return "${dt.day.toString().padLeft(2, '0')}/${dt.month.toString().padLeft(2, '0')}/${dt.year}";
    } catch (_) {
      return isoStr;
    }
  }
}

class _EditAccountCenterFormSheet extends ConsumerStatefulWidget {
  final AccountProfile profile;

  const _EditAccountCenterFormSheet({required this.profile});

  @override
  ConsumerState<_EditAccountCenterFormSheet> createState() =>
      __EditAccountCenterFormSheetState();
}

class __EditAccountCenterFormSheetState
    extends ConsumerState<_EditAccountCenterFormSheet> {
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _usernameController;
  String? _selectedGender;
  String? _dateOfBirth;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.profile.name);
    _phoneController = TextEditingController(text: widget.profile.phone);
    _usernameController = TextEditingController(text: widget.profile.username);
    _selectedGender = widget.profile.gender ?? 'Male';
    _dateOfBirth = widget.profile.dateOfBirth;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  Future<void> _saveProfile() async {
    setState(() {
      _isSaving = true;
    });

    try {
      final req = UpdateProfileRequest(
        name: _nameController.text.trim(),
        username: _usernameController.text.trim(),
        phone: _phoneController.text.trim(),
        gender: _selectedGender,
        dateOfBirth: _dateOfBirth,
      );

      await ref
          .read(accountControllerProvider.notifier)
          .updateProfile(req);

      if (mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Cập nhật thông tin tài khoản thành công!'),
            backgroundColor: Color(0xFF10B981),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Lỗi cập nhật: $e'),
            backgroundColor: const Color(0xFFBA1A1A),
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isSaving = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom + 24,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Chỉnh sửa thông tin tài khoản',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Manrope',
                color: theme.colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Họ và tên',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Tên người dùng (Username)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'Số điện thoại',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              initialValue: _selectedGender,
              decoration: const InputDecoration(
                labelText: 'Giới tính',
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(value: 'Male', child: Text('Nam')),
                DropdownMenuItem(value: 'Female', child: Text('Nữ')),
                DropdownMenuItem(value: 'Other', child: Text('Khác')),
              ],
              onChanged: (val) {
                if (val != null) {
                  setState(() {
                    _selectedGender = val;
                  });
                }
              },
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: _isSaving ? null : _saveProfile,
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.primary,
                  foregroundColor: theme.colorScheme.onPrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: _isSaving
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text(
                        'Lưu thay đổi',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Inter',
                          fontSize: 15,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
