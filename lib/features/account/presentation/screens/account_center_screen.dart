import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shopnexus_flutter_app/api/generated/model/profile_gender.dart';
import 'package:shopnexus_flutter_app/api/generated/model/update_account_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/update_profile_request.dart';
import 'package:shopnexus_flutter_app/core/theme/app_colors.dart';
import 'package:shopnexus_flutter_app/features/kyc/data/models/kyc_model.dart';
import 'package:shopnexus_flutter_app/features/kyc/presentation/providers/kyc_provider.dart';
import 'package:shopnexus_flutter_app/features/account/data/models/account_model.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/providers/account_provider.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/widgets/profile_fields.dart';

/// Màn hình Trung tâm tài khoản: bao gồm thông tin xác minh KYC và chi tiết tài khoản cá nhân.
class AccountCenterScreen extends ConsumerStatefulWidget {
  const AccountCenterScreen({super.key});

  @override
  ConsumerState<AccountCenterScreen> createState() =>
      _AccountCenterScreenState();
}

class _AccountCenterScreenState extends ConsumerState<AccountCenterScreen> {
  void _showEditProfileBottomSheet(Me profile) {
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
          'Trung tâm tài khoản',
          style: TextStyle(
            color: theme.colorScheme.onSurface,
            fontWeight: FontWeight.bold,
            fontFamily: 'Manrope',
            fontSize: 20,
          ),
        ),
      ),
      body: profileAsync.when(
        data: (profile) => SingleChildScrollView(
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
                      value: profile.name.isNotEmpty
                          ? profile.name
                          : 'Chưa cập nhật',
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
                      badgeText: profile.emailVerified
                          ? 'Đã xác minh'
                          : 'Chưa xác minh',
                      badgeColor: profile.emailVerified
                          ? const Color(0xFF10B981)
                          : const Color(0xFFF59E0B),
                    ),
                    _buildDivider(),
                    _buildInfoTile(
                      icon: Icons.phone_outlined,
                      label: 'Số điện thoại',
                      value: profile.phone ?? 'Chưa cập nhật SĐT',
                    ),
                    _buildDivider(),
                    _buildInfoTile(
                      icon: Icons.wc_rounded,
                      label: 'Giới tính',
                      value: switch (genderOf(profile.gender)) {
                        null => 'Chưa cập nhật',
                        final gender => genderLabel(gender),
                      },
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
                      value: _formatDate(profile.createdAt),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: Text(
            'Không thể tải thông tin tài khoản: $err',
            style: TextStyle(
              fontSize: 13,
              fontFamily: 'Inter',
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildKycCenterCard(IdentityDocument? kyc) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final status = kyc?.status;

    final String statusText;
    final Color statusColor;
    final IconData statusIcon;

    switch (status) {
      case IdentityStatus.verified:
        statusText = 'Đã xác minh KYC';
        statusColor = const Color(0xFF10B981);
        statusIcon = Icons.verified_rounded;
      case IdentityStatus.pending:
        statusText = 'Đang chờ xét duyệt';
        statusColor = const Color(0xFFF59E0B);
        statusIcon = Icons.pending_actions_rounded;
      case IdentityStatus.rejected:
        statusText = 'Bị từ chối - Cần nộp lại';
        statusColor = const Color(0xFFEF4444);
        statusIcon = Icons.error_rounded;
      case null:
        statusText = 'Chưa xác minh danh tính';
        statusColor = const Color(0xFF64748B);
        statusIcon = Icons.shield_outlined;
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
                status == IdentityStatus.verified
                    ? Icons.remove_red_eye_outlined
                    : Icons.badge_outlined,
                size: 18,
              ),
              label: Text(
                status == IdentityStatus.verified
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
                        color:
                            badgeColor?.withValues(alpha: 0.15) ??
                            Colors.grey.shade200,
                        textColor: badgeColor ?? Colors.black87,
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
          if (trailing != null) trailing,
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
  final Me profile;

  const _EditAccountCenterFormSheet({required this.profile});

  @override
  ConsumerState<_EditAccountCenterFormSheet> createState() =>
      __EditAccountCenterFormSheetState();
}

class __EditAccountCenterFormSheetState
    extends ConsumerState<_EditAccountCenterFormSheet> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _usernameController;
  late TextEditingController _emailController;
  ProfileGender? _selectedGender;
  DateTime? _dob;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.profile.name);
    _phoneController = TextEditingController(text: widget.profile.phone);
    _usernameController = TextEditingController(text: widget.profile.username);
    _emailController = TextEditingController(text: widget.profile.email);
    _selectedGender = genderOf(widget.profile.gender);
    if (widget.profile.dateOfBirth != null) {
      _dob = DateTime.tryParse(widget.profile.dateOfBirth!);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _saveProfile() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    setState(() {
      _isSaving = true;
    });

    try {
      final controller = ref.read(accountControllerProvider.notifier);
      await controller.updateProfile(
        UpdateProfileRequest(
          name: _nameController.text.trim(),
          gender: _selectedGender,
          dateOfBirth: _dob?.toIso8601String().split('T').first,
        ),
      );

      final profileFailure = ref.read(accountControllerProvider).error;
      if (profileFailure != null) throw profileFailure;

      final identifiers = _identifierChanges();
      if (identifiers != null) {
        await controller.updateAccount(identifiers);
        if (!mounted) return;
        final identifierFailure = ref.read(accountControllerProvider).error;
        if (identifierFailure != null) throw identifierFailure;
      }

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

  UpdateAccountRequest? _identifierChanges() {
    final username = _usernameController.text.trim();
    final phone = _phoneController.text.trim();
    final email = _emailController.text.trim();
    final usernameChanged = username != (widget.profile.username ?? '');
    final phoneChanged = phone != (widget.profile.phone ?? '');
    final emailChanged = email != (widget.profile.email ?? '');
    if (!usernameChanged && !phoneChanged && !emailChanged) return null;

    return UpdateAccountRequest(
      username: usernameChanged && username.isNotEmpty ? username : null,
      clearUsername: usernameChanged && username.isEmpty ? true : null,
      phone: phoneChanged && phone.isNotEmpty ? phone : null,
      clearPhone: phoneChanged && phone.isEmpty ? true : null,
      email: emailChanged && email.isNotEmpty ? email : null,
      clearEmail: emailChanged && email.isEmpty ? true : null,
    );
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
      child: Form(
        key: _formKey,
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
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Họ và tên',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => (value == null || value.trim().isEmpty)
                    ? 'Vui lòng nhập họ tên'
                    : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'Tên người dùng (Username)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: 'Số điện thoại',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  final email = value?.trim() ?? '';
                  if (email.isEmpty) return null;
                  final looksLikeEmail = RegExp(
                    r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
                  ).hasMatch(email);
                  return looksLikeEmail ? null : 'Email không hợp lệ';
                },
              ),
              const SizedBox(height: 12),
              InkWell(
                onTap: () async {
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: _dob ?? DateTime(2000),
                    firstDate: DateTime(1930),
                    lastDate: DateTime.now(),
                  );
                  if (picked != null) setState(() => _dob = picked);
                },
                child: InputDecorator(
                  decoration: const InputDecoration(
                    labelText: 'Ngày sinh',
                    border: OutlineInputBorder(),
                  ),
                  child: Text(
                    _dob == null
                        ? 'Chưa chọn'
                        : '${_dob!.day.toString().padLeft(2, '0')}/${_dob!.month.toString().padLeft(2, '0')}/${_dob!.year}',
                  ),
                ),
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<ProfileGender>(
                initialValue: _selectedGender,
                decoration: const InputDecoration(
                  labelText: 'Giới tính',
                  border: OutlineInputBorder(),
                ),
                items: [
                  for (final gender in ProfileGender.values)
                    DropdownMenuItem(
                      value: gender,
                      child: Text(genderLabel(gender)),
                    ),
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
      ),
    );
  }
}
