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
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final state = ref.watch(kycProvider);
    final notifier = ref.read(kycProvider.notifier);

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

    final currentStatus = state.kycModel?.status;
    final isSubmittedOrVerified =
        currentStatus == IdentityStatus.pending ||
        currentStatus == IdentityStatus.verified;

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

                    if (isSubmittedOrVerified)
                      // Khi đã nộp / được xác minh: Chỉ hiển thị thông tin văn bản đã xác minh
                      _buildVerifiedInfoCard(state.kycModel!)
                    else ...[
                      // Khi chưa xác minh hoặc bị từ chối: Cho phép chọn loại giấy tờ và chụp ảnh
                      _buildSectionHeader('1. Loại giấy tờ xác minh'),
                      const SizedBox(height: 10),
                      _buildDocTypeSelector(state.docType, notifier),

                      const SizedBox(height: 24),

                      _buildSectionHeader('2. Tải lên ảnh chụp giấy tờ & Chân dung'),
                      const SizedBox(height: 4),
                      Text(
                        'Vui lòng tải lên ảnh chụp rõ nét, không bị lóa hoặc mất góc',
                        style: TextStyle(
                          fontSize: 13,
                          color: theme.colorScheme.onSurfaceVariant,
                          fontFamily: 'Inter',
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Front Card Picker
                      KycCardPickerWidget(
                        title: _getFrontCardTitle(state.docType),
                        description:
                            'Chụp/Chọn ảnh mặt trước chứa ảnh chân dung và thông tin cá nhân',
                        icon: Icons.badge_outlined,
                        localPath: state.frontCardPath,
                        isUploading: state.isUploadingFront,
                        onPickImage: (source) {
                          notifier.pickAndUploadImage(
                            KycImageType.frontCard,
                            source,
                          );
                        },
                      ),

                      const SizedBox(height: 12),

                      // Back Card Picker (if required)
                      if (state.docType == IdentityDocumentType.nationalId) ...[
                        KycCardPickerWidget(
                          title: 'Mặt sau CCCD / CMND',
                          description:
                              'Chụp/Chọn ảnh mặt sau chứa thông tin đặc điểm nhân dạng',
                          icon: Icons.fingerprint_rounded,
                          localPath: state.backCardPath,
                          isUploading: state.isUploadingBack,
                          onPickImage: (source) {
                            notifier.pickAndUploadImage(
                              KycImageType.backCard,
                              source,
                            );
                          },
                        ),
                        const SizedBox(height: 12),
                      ],

                      // Selfie Card Picker
                      KycCardPickerWidget(
                        title: 'Ảnh chân dung',
                        description:
                            'Chụp/Chọn ảnh chân dung hiện rõ khuôn mặt khuôn hình',
                        icon: Icons.face_rounded,
                        localPath: state.selfiePath,
                        isUploading: state.isUploadingSelfie,
                        onPickImage: (source) {
                          notifier.pickAndUploadImage(
                            KycImageType.selfie,
                            source,
                          );
                        },
                      ),

                      const SizedBox(height: 32),

                      // Submit Button
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: state.isSubmitting
                              ? null
                              : () async {
                                  final success = await notifier.submitKyc();
                                  if (success && context.mounted) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          'Hồ sơ của bạn đã được cập nhật thành công',
                                        ),
                                      ),
                                    );
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
                    ],

                    const SizedBox(height: 32),
                  ],
                ),
              ),
      ),
    );
  }

  Widget _buildKycStatusBanner(IdentityDocument? kyc) {
    final theme = Theme.of(context);
    // No document on file is its own case: the contract has no `unverified`
    // status, because absence already says it.
    final status = kyc?.status;

    final Color bgColor;
    final Color textColor;
    final IconData iconData;
    final String statusTitle;
    final String statusSubtitle;

    switch (status) {
      case IdentityStatus.verified:
        bgColor = const Color(0xFFD1FAE5);
        textColor = const Color(0xFF065F46);
        iconData = Icons.verified_rounded;
        statusTitle = 'Đã xác minh KYC (Verified)';
        statusSubtitle =
            'Danh tính của bạn đã được xác minh chính thức trên hệ thống ShopNexus.';
        break;
      case IdentityStatus.pending:
        bgColor = const Color(0xFFFEF3C7);
        textColor = const Color(0xFF92400E);
        iconData = Icons.pending_actions_rounded;
        statusTitle = 'Đang chờ xét duyệt (Pending)';
        statusSubtitle =
            'Hồ sơ xác minh đã được gửi thành công và đang được bộ phận chuyên trách xử lý.';
        break;
      case IdentityStatus.rejected:
        bgColor = const Color(0xFFFEE2E2);
        textColor = const Color(0xFF991B1B);
        iconData = Icons.cancel_rounded;
        statusTitle = 'Hồ sơ bị từ chối (Rejected)';
        statusSubtitle =
            kyc?.rejectionReason ??
            'Hồ sơ chưa đạt yêu cầu. Vui lòng kiểm tra lại hình ảnh và gửi lại.';
        break;
      case null:
        bgColor = theme.brightness == Brightness.dark
            ? theme.colorScheme.surfaceContainerHighest
            : const Color(0xFFF8FAFC);
        textColor = theme.colorScheme.onSurface;
        iconData = Icons.shield_outlined;
        statusTitle = 'Chưa xác minh danh tính';
        statusSubtitle =
            'Hoàn tất gửi ảnh giấy tờ để mở khóa đầy đủ quyền lợi Mua/Bán trên ShopNexus.';
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

  Widget _buildVerifiedInfoCard(IdentityDocument doc) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDarkMode ? AppColors.darkSurface : const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDarkMode
              ? AppColors.darkPrimary.withValues(alpha: 0.2)
              : const Color(0xFFE2E8F0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.verified_user_rounded,
                color: theme.colorScheme.primary,
                size: 24,
              ),
              const SizedBox(width: 10),
              Text(
                'Thông tin hồ sơ xác minh',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Manrope',
                  color: theme.colorScheme.onSurface,
                ),
              ),
            ],
          ),
          const Divider(height: 24, thickness: 1),
          _buildInfoRow('Loại giấy tờ', _getDocTypeName(doc.docType)),
          _buildInfoRow(
            'Trạng thái',
            doc.status == IdentityStatus.verified ? 'Đã xác minh' : 'Đang chờ xử lý',
          ),
          if (doc.id.isNotEmpty) _buildInfoRow('Mã hồ sơ', doc.id),
          if (doc.provider.isNotEmpty)
            _buildInfoRow('Nhà cung cấp', doc.provider),
          _buildInfoRow('Ngày nộp', _formatDateTime(doc.createdAt.toIso8601String())),
          if (doc.verifiedAt != null)
            _buildInfoRow('Ngày duyệt', _formatDateTime(doc.verifiedAt?.toIso8601String())),
          if (doc.expiresAt != null)
            _buildInfoRow('Ngày hết hạn', _formatDateTime(doc.expiresAt?.toIso8601String())),
          if (doc.rejectionReason != null && doc.rejectionReason!.isNotEmpty)
            _buildInfoRow('Lý do từ chối', doc.rejectionReason!, isError: true),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, {bool isError = false}) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 13,
              fontFamily: 'Inter',
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                fontFamily: 'Inter',
                color: isError
                    ? const Color(0xFFBA1A1A)
                    : theme.colorScheme.onSurface,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDocTypeSelector(IdentityDocumentType selected, KycNotifier notifier) {
    return Column(
      children: [
        _buildDocTypeOption(
          type: IdentityDocumentType.nationalId,
          title: 'Căn cước công dân / CMND',
          subtitle: 'Sử dụng thẻ CCCD gắn chíp hoặc CMND hợp lệ',
          isSelected: selected == IdentityDocumentType.nationalId,
          onTap: () => notifier.setDocType(IdentityDocumentType.nationalId),
        ),
        const SizedBox(height: 8),
        _buildDocTypeOption(
          type: IdentityDocumentType.passport,
          title: 'Hộ chiếu (Passport)',
          subtitle: 'Sử dụng trang thông tin chính trên hộ chiếu còn hạn',
          isSelected: selected == IdentityDocumentType.passport,
          onTap: () => notifier.setDocType(IdentityDocumentType.passport),
        ),
        const SizedBox(height: 8),
        _buildDocTypeOption(
          type: IdentityDocumentType.driverLicense,
          title: 'Bằng lái xe (Driver License)',
          subtitle: 'Giấy phép lái xe bản gốc do cơ quan nhà nước cấp',
          isSelected: selected == IdentityDocumentType.driverLicense,
          onTap: () => notifier.setDocType(IdentityDocumentType.driverLicense),
        ),
      ],
    );
  }

  Widget _buildDocTypeOption({
    required IdentityDocumentType type,
    required String title,
    required String subtitle,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: isSelected
              ? theme.colorScheme.primary.withValues(alpha: 0.08)
              : (isDarkMode ? AppColors.darkSurface : const Color(0xFFF8FAFC)),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? theme.colorScheme.primary
                : (isDarkMode
                    ? AppColors.darkPrimary.withValues(alpha: 0.2)
                    : const Color(0xFFE2E8F0)),
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Row(
          children: [
            Icon(
              isSelected
                  ? Icons.radio_button_checked_rounded
                  : Icons.radio_button_off_rounded,
              color: isSelected
                  ? theme.colorScheme.primary
                  : theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.4),
              size: 22,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Manrope',
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Inter',
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
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

  String _getFrontCardTitle(IdentityDocumentType docType) {
    switch (docType) {
      case IdentityDocumentType.nationalId:
        return 'Mặt trước CCCD / CMND';
      case IdentityDocumentType.passport:
        return 'Ảnh trang nhân thân Hộ chiếu';
      case IdentityDocumentType.driverLicense:
        return 'Mặt trước Giấy phép lái xe';
    }
  }

  String _getDocTypeName(IdentityDocumentType docType) {
    switch (docType) {
      case IdentityDocumentType.nationalId:
        return 'Căn cước công dân (National ID)';
      case IdentityDocumentType.passport:
        return 'Hộ chiếu (Passport)';
      case IdentityDocumentType.driverLicense:
        return 'Giấy phép lái xe (Driver License)';
    }
  }

  String _formatDateTime(String? rawStr) {
    if (rawStr == null || rawStr.isEmpty) return '-';
    final parsed = DateTime.tryParse(rawStr);
    if (parsed == null) return rawStr;
    return '${parsed.day.toString().padLeft(2, '0')}/${parsed.month.toString().padLeft(2, '0')}/${parsed.year} ${parsed.hour.toString().padLeft(2, '0')}:${parsed.minute.toString().padLeft(2, '0')}';
  }
}
