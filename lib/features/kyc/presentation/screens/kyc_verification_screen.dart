import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../data/models/kyc_model.dart';
import '../providers/kyc_provider.dart';
import '../widgets/kyc_card_picker_widget.dart';

class KycVerificationScreen extends ConsumerStatefulWidget {
  const KycVerificationScreen({super.key});

  @override
  ConsumerState<KycVerificationScreen> createState() =>
      _KycVerificationScreenState();
}

class _KycVerificationScreenState extends ConsumerState<KycVerificationScreen> {
  late TextEditingController _idNumberController;
  late TextEditingController _fullNameController;
  late TextEditingController _issuePlaceController;

  @override
  void initState() {
    super.initState();
    _idNumberController = TextEditingController();
    _fullNameController = TextEditingController();
    _issuePlaceController = TextEditingController();
  }

  @override
  void dispose() {
    _idNumberController.dispose();
    _fullNameController.dispose();
    _issuePlaceController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(
    BuildContext context,
    String? initialDateStr,
    Function(String) onDateSelected,
  ) async {
    DateTime initialDate = DateTime.now().subtract(
      const Duration(days: 365 * 20),
    );
    if (initialDateStr != null && initialDateStr.isNotEmpty) {
      final parsed = DateTime.tryParse(initialDateStr);
      if (parsed != null) initialDate = parsed;
    }

    final picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(1940),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      final formatted =
          "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
      onDateSelected(formatted);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final state = ref.watch(kycProvider);
    final notifier = ref.read(kycProvider.notifier);

    // Synchronize controller values if state was initialized from saved KYC
    if (_idNumberController.text != state.idNumber) {
      _idNumberController.text = state.idNumber;
    }
    if (_fullNameController.text != state.fullName) {
      _fullNameController.text = state.fullName;
    }
    if (state.issuePlace != null &&
        _issuePlaceController.text != state.issuePlace) {
      _issuePlaceController.text = state.issuePlace!;
    }

    // Listen to error and success messages
    ref.listen<KycFormState>(kycProvider, (prev, next) {
      if (next.errorMessage != null &&
          next.errorMessage != prev?.errorMessage) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.errorMessage!),
            backgroundColor: const Color(0xFFBA1A1A),
          ),
        );
      }
      if (next.successMessage != null &&
          next.successMessage != prev?.successMessage) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.successMessage!),
            backgroundColor: const Color(0xFF10B981),
          ),
        );
      }
    });

    final isReadOnly =
        state.kycModel?.status == KycStatus.pending ||
        state.kycModel?.status == KycStatus.verified;

    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {},
      child: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: theme.colorScheme.surface,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: theme.colorScheme.onSurface,
              size: 20,
            ),
            onPressed: () => context.pop(),
          ),
          title: Text(
            'Xác minh danh tính (KYC)',
            style: TextStyle(
              color: theme.colorScheme.onSurface,
              fontWeight: FontWeight.bold,
              fontFamily: 'Manrope',
              fontSize: 18,
            ),
          ),
          centerTitle: true,
        ),
        body: state.isLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Status Header Banner
                    _buildKycStatusBanner(state.kycModel),

                    const SizedBox(height: 20),

                    // Section: Image Pickers
                    _buildSectionHeader('1. Ảnh chụp CCCD / CMND'),
                    const SizedBox(height: 4),
                    Text(
                      'Vui lòng tải lên ảnh chụp rõ nét, không bị lóa hoặc mất góc',
                      style: TextStyle(
                        fontSize: 13,
                        color: theme.colorScheme.onSurfaceVariant,
                        fontFamily: 'Inter',
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Front Card
                    KycCardPickerWidget(
                      title: 'Mặt trước CCCD',
                      description:
                          'Ảnh chụp mặt trước có chứa ảnh đại diện và thông tin cá nhân',
                      icon: Icons.badge_outlined,
                      localPath: state.frontCardPath,
                      networkUrl: state.frontCardUrl,
                      isUploading: state.isUploadingFront,
                      onPickImage: (source) {
                        if (!isReadOnly) {
                          notifier.pickAndUploadImage(
                            KycImageType.frontCard,
                            source,
                          );
                        }
                      },
                    ),

                    const SizedBox(height: 12),

                    // Back Card
                    KycCardPickerWidget(
                      title: 'Mặt sau CCCD',
                      description:
                          'Ảnh chụp mặt sau có dấu vân tay và đặc điểm nhân dạng',
                      icon: Icons.fingerprint_rounded,
                      localPath: state.backCardPath,
                      networkUrl: state.backCardUrl,
                      isUploading: state.isUploadingBack,
                      onPickImage: (source) {
                        if (!isReadOnly) {
                          notifier.pickAndUploadImage(
                            KycImageType.backCard,
                            source,
                          );
                        }
                      },
                    ),

                    const SizedBox(height: 12),

                    // Selfie Card
                    KycCardPickerWidget(
                      title: 'Ảnh chân dung',
                      description:
                          'Chụp ảnh chân dung hiện rõ khuôn mặt của bạn',
                      icon: Icons.face_rounded,
                      localPath: state.selfiePath,
                      networkUrl: state.selfieUrl,
                      isUploading: state.isUploadingSelfie,
                      onPickImage: (source) {
                        if (!isReadOnly) {
                          notifier.pickAndUploadImage(
                            KycImageType.selfie,
                            source,
                          );
                        }
                      },
                    ),

                    const SizedBox(height: 24),

                    // Section: Document Info Form
                    _buildSectionHeader('2. Thông tin giấy tờ'),
                    const SizedBox(height: 12),

                    // ID Number Field
                    _buildInputField(
                      label: 'Số CCCD / CMND *',
                      hint: 'Nhập 12 chữ số trên CCCD',
                      controller: _idNumberController,
                      enabled: !isReadOnly,
                      keyboardType: TextInputType.number,
                      onChanged: (val) =>
                          notifier.updateFormFields(idNumber: val),
                    ),

                    const SizedBox(height: 12),

                    // Full Name Field
                    _buildInputField(
                      label: 'Họ và tên trên CCCD *',
                      hint: 'Ví dụ: NGUYỄN VĂN A',
                      controller: _fullNameController,
                      enabled: !isReadOnly,
                      onChanged: (val) =>
                          notifier.updateFormFields(fullName: val),
                    ),

                    const SizedBox(height: 12),

                    // Date of Birth Picker
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: isReadOnly
                                ? null
                                : () => _selectDate(
                                    context,
                                    state.dateOfBirth,
                                    (date) => notifier.updateFormFields(
                                      dateOfBirth: date,
                                    ),
                                  ),
                            child: _buildInputDecorator(
                              label: 'Ngày sinh',
                              value: state.dateOfBirth ?? 'Chọn ngày sinh',
                              icon: Icons.calendar_today_rounded,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: InkWell(
                            onTap: isReadOnly
                                ? null
                                : () => _selectDate(
                                    context,
                                    state.issueDate,
                                    (date) => notifier.updateFormFields(
                                      issueDate: date,
                                    ),
                                  ),
                            child: _buildInputDecorator(
                              label: 'Ngày cấp',
                              value: state.issueDate ?? 'Chọn ngày cấp',
                              icon: Icons.event_rounded,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    // Issue Place Field
                    _buildInputField(
                      label: 'Nơi cấp',
                      hint: 'Ví dụ: Cục Cảnh sát QLHC về trật tự xã hội',
                      controller: _issuePlaceController,
                      enabled: !isReadOnly,
                      onChanged: (val) =>
                          notifier.updateFormFields(issuePlace: val),
                    ),

                    const SizedBox(height: 32),

                    // Submit Button
                    if (!isReadOnly)
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: state.isSubmitting
                              ? null
                              : () async {
                                  final success = await notifier.submitKyc();
                                  if (success && context.mounted) {
                                    context.pop();
                                  }
                                },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: theme.colorScheme.primary,
                            foregroundColor: theme.colorScheme.onPrimary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 0,
                          ),
                          child: state.isSubmitting
                              ? const SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.white,
                                  ),
                                )
                              : const Text(
                                  'Gửi hồ sơ xác minh KYC',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Inter',
                                  ),
                                ),
                        ),
                      ),

                    const SizedBox(height: 32),
                  ],
                ),
              ),
      ),
    );
  }

  Widget _buildKycStatusBanner(KycModel? kyc) {
    final theme = Theme.of(context);
    final status = kyc?.status ?? KycStatus.unverified;

    Color bgColor;
    Color textColor;
    IconData iconData;
    String statusTitle;
    String statusSubtitle;

    switch (status) {
      case KycStatus.verified:
        bgColor = const Color(0xFFD1FAE5);
        textColor = const Color(0xFF065F46);
        iconData = Icons.verified_rounded;
        statusTitle = 'Đã xác minh KYC (Verified)';
        statusSubtitle =
            'Tài khoản của bạn đã được xác minh danh tính thành công.';
        break;
      case KycStatus.pending:
        bgColor = const Color(0xFFFEF3C7);
        textColor = const Color(0xFF92400E);
        iconData = Icons.pending_actions_rounded;
        statusTitle = 'Đang chờ xét duyệt (Pending)';
        statusSubtitle =
            'Hồ sơ của bạn đã được gửi thành công và đang được quản trị viên xử lý.';
        break;
      case KycStatus.rejected:
        bgColor = const Color(0xFFFEE2E2);
        textColor = const Color(0xFF991B1B);
        iconData = Icons.cancel_rounded;
        statusTitle = 'Hồ sơ bị từ chối (Rejected)';
        statusSubtitle =
            kyc?.rejectedReason ??
            'Hồ sơ chưa đạt yêu cầu. Vui lòng kiểm tra lại ảnh chụp CCCD và gửi lại.';
        break;
      case KycStatus.unverified:
        bgColor = theme.brightness == Brightness.dark
            ? theme.colorScheme.surfaceContainerHighest
            : const Color(0xFFF8FAFC);
        textColor = theme.colorScheme.onSurface;
        iconData = Icons.shield_outlined;
        statusTitle = 'Chưa xác minh danh tính';
        statusSubtitle =
            'Hoàn tất xác minh CCCD để mở khóa đầy đủ quyền lợi Mua/Bán trên ShopNexus.';
        break;
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: textColor.withValues(alpha: 0.2)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(iconData, color: textColor, size: 28),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  statusTitle,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Manrope',
                    color: textColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  statusSubtitle,
                  style: TextStyle(
                    fontSize: 13,
                    fontFamily: 'Inter',
                    color: textColor.withValues(alpha: 0.85),
                    height: 1.35,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    final theme = Theme.of(context);
    return Text(
      title,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        fontFamily: 'Manrope',
        color: theme.colorScheme.onSurface,
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    required String hint,
    required TextEditingController controller,
    bool enabled = true,
    TextInputType keyboardType = TextInputType.text,
    required Function(String) onChanged,
  }) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            fontFamily: 'Inter',
            color: theme.colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          enabled: enabled,
          keyboardType: keyboardType,
          onChanged: onChanged,
          style: TextStyle(
            fontSize: 14,
            fontFamily: 'Inter',
            color: theme.colorScheme.onSurface,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.6),
              fontSize: 14,
            ),
            filled: true,
            fillColor: enabled
                ? (isDarkMode ? AppColors.darkSurface : const Color(0xFFF8FAFC))
                : (isDarkMode ? Colors.black26 : const Color(0xFFE2E8F0)),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 14,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: isDarkMode
                    ? AppColors.darkPrimary.withValues(alpha: 0.2)
                    : const Color(0xFFE2E8F0),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: theme.colorScheme.primary,
                width: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInputDecorator({
    required String label,
    required String value,
    required IconData icon,
  }) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            fontFamily: 'Inter',
            color: theme.colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          decoration: BoxDecoration(
            color: isDarkMode ? AppColors.darkSurface : const Color(0xFFF8FAFC),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isDarkMode
                  ? AppColors.darkPrimary.withValues(alpha: 0.2)
                  : const Color(0xFFE2E8F0),
            ),
          ),
          child: Row(
            children: [
              Icon(icon, size: 18, color: theme.colorScheme.primary),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  value,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Inter',
                    color: theme.colorScheme.onSurface,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
