import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../account/presentation/providers/account_provider.dart';
import '../../data/models/kyc_model.dart';
import '../../data/repositories/kyc_repository.dart';

part 'kyc_provider.g.dart';

enum KycImageType { frontCard, backCard, selfie }

class KycFormState {
  final IdentityDocument? kycModel;

  /// Set when the vendor runs its own web flow instead of deciding now — the
  /// seam covers both, and the caller stores whichever came back.
  final String? vendorSessionUrl;
  final bool isLoading;
  final bool isSubmitting;

  final IdentityDocumentType docType;

  // Selected Image Local Paths
  final String? frontCardPath;
  final String? backCardPath;
  final String? selfiePath;

  // Uploaded Resource IDs
  final String? frontResourceId;
  final String? backResourceId;
  final String? selfieResourceId;

  final bool isUploadingFront;
  final bool isUploadingBack;
  final bool isUploadingSelfie;

  final String? errorMessage;
  final String? successMessage;

  const KycFormState({
    this.kycModel,
    this.vendorSessionUrl,
    this.isLoading = false,
    this.isSubmitting = false,
    this.docType = IdentityDocumentType.nationalId,
    this.frontCardPath,
    this.backCardPath,
    this.selfiePath,
    this.frontResourceId,
    this.backResourceId,
    this.selfieResourceId,
    this.isUploadingFront = false,
    this.isUploadingBack = false,
    this.isUploadingSelfie = false,
    this.errorMessage,
    this.successMessage,
  });

  KycFormState copyWith({
    IdentityDocument? kycModel,
    String? vendorSessionUrl,
    bool? isLoading,
    bool? isSubmitting,
    IdentityDocumentType? docType,
    String? frontCardPath,
    String? backCardPath,
    String? selfiePath,
    String? frontResourceId,
    String? backResourceId,
    String? selfieResourceId,
    bool? isUploadingFront,
    bool? isUploadingBack,
    bool? isUploadingSelfie,
    String? errorMessage,
    String? successMessage,
  }) {
    return KycFormState(
      kycModel: kycModel ?? this.kycModel,
      vendorSessionUrl: vendorSessionUrl ?? this.vendorSessionUrl,
      isLoading: isLoading ?? this.isLoading,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      docType: docType ?? this.docType,
      frontCardPath: frontCardPath ?? this.frontCardPath,
      backCardPath: backCardPath ?? this.backCardPath,
      selfiePath: selfiePath ?? this.selfiePath,
      frontResourceId: frontResourceId ?? this.frontResourceId,
      backResourceId: backResourceId ?? this.backResourceId,
      selfieResourceId: selfieResourceId ?? this.selfieResourceId,
      isUploadingFront: isUploadingFront ?? this.isUploadingFront,
      isUploadingBack: isUploadingBack ?? this.isUploadingBack,
      isUploadingSelfie: isUploadingSelfie ?? this.isUploadingSelfie,
      errorMessage: errorMessage,
      successMessage: successMessage,
    );
  }
}

@riverpod
class KycNotifier extends _$KycNotifier {
  final ImagePicker _picker = ImagePicker();

  @override
  KycFormState build() {
    _loadInitialKycStatus();
    return const KycFormState(isLoading: true);
  }

  Future<void> _loadInitialKycStatus() async {
    try {
      final profileAsync = ref.read(profileProvider);
      final profile = profileAsync.value;
      if (profile != null) {
        final repository = ref.read(kycRepositoryProvider);
        final kyc = await repository.getKycStatus(profile.id);
        state = state.copyWith(
          kycModel: kyc,
          docType: kyc?.docType ?? IdentityDocumentType.nationalId,
          isLoading: false,
        );
      } else {
        state = state.copyWith(isLoading: false);
      }
    } catch (_) {
      state = state.copyWith(isLoading: false);
    }
  }

  void setDocType(IdentityDocumentType docType) {
    state = state.copyWith(docType: docType, errorMessage: null);
  }

  Future<void> pickAndUploadImage(KycImageType type, ImageSource source) async {
    final XFile? image = await _picker.pickImage(
      source: source,
      imageQuality: 85,
      maxWidth: 1920,
      maxHeight: 1080,
    );

    if (image == null) return;

    switch (type) {
      case KycImageType.frontCard:
        state = state.copyWith(
          frontCardPath: image.path,
          isUploadingFront: true,
          errorMessage: null,
        );
        break;
      case KycImageType.backCard:
        state = state.copyWith(
          backCardPath: image.path,
          isUploadingBack: true,
          errorMessage: null,
        );
        break;
      case KycImageType.selfie:
        state = state.copyWith(
          selfiePath: image.path,
          isUploadingSelfie: true,
          errorMessage: null,
        );
        break;
    }

    try {
      final repository = ref.read(kycRepositoryProvider);
      final bytes = await image.readAsBytes();
      final mimeType = image.mimeType ?? 'image/jpeg';

      final resourceId = await repository.uploadKycScan(
        bytes: bytes,
        fileName: image.name,
        mimeType: mimeType,
      );

      switch (type) {
        case KycImageType.frontCard:
          state = state.copyWith(
            frontResourceId: resourceId,
            isUploadingFront: false,
          );
          break;
        case KycImageType.backCard:
          state = state.copyWith(
            backResourceId: resourceId,
            isUploadingBack: false,
          );
          break;
        case KycImageType.selfie:
          state = state.copyWith(
            selfieResourceId: resourceId,
            isUploadingSelfie: false,
          );
          break;
      }
    } catch (e) {
      switch (type) {
        case KycImageType.frontCard:
          state = state.copyWith(
            isUploadingFront: false,
            errorMessage: 'Lỗi tải ảnh mặt trước: $e',
          );
          break;
        case KycImageType.backCard:
          state = state.copyWith(
            isUploadingBack: false,
            errorMessage: 'Lỗi tải ảnh mặt sau: $e',
          );
          break;
        case KycImageType.selfie:
          state = state.copyWith(
            isUploadingSelfie: false,
            errorMessage: 'Lỗi tải ảnh chân dung: $e',
          );
          break;
      }
    }
  }

  Future<bool> submitKyc() async {
    final profile = ref.read(profileProvider).value;
    if (profile == null) {
      state = state.copyWith(
        errorMessage: 'Không tìm thấy thông tin tài khoản',
      );
      return false;
    }

    if (state.frontResourceId == null && state.frontCardPath == null) {
      state = state.copyWith(
        errorMessage: 'Vui lòng tải lên ảnh mặt trước giấy tờ',
      );
      return false;
    }

    if (state.docType == IdentityDocumentType.nationalId &&
        state.backResourceId == null &&
        state.backCardPath == null) {
      state = state.copyWith(
        errorMessage: 'Vui lòng tải lên ảnh mặt sau giấy tờ',
      );
      return false;
    }

    if (state.selfieResourceId == null && state.selfiePath == null) {
      state = state.copyWith(
        errorMessage: 'Vui lòng tải lên ảnh chân dung cầm giấy tờ',
      );
      return false;
    }

    state = state.copyWith(isSubmitting: true, errorMessage: null);

    try {
      final repository = ref.read(kycRepositoryProvider);
      final req = StartIdentityVerificationRequest(
        docType: state.docType,
        frontResourceId: state.frontResourceId ?? 'res_front_dummy',
        backResourceId: state.backResourceId,
        selfieResourceId: state.selfieResourceId ?? 'res_selfie_dummy',
      );

      final kycResult = await repository.submitKyc(
        accountId: profile.id,
        request: req,
      );

      state = state.copyWith(
        kycModel: kycResult.document,
        vendorSessionUrl: kycResult.vendorSessionUrl,
        isSubmitting: false,
        successMessage: 'Gửi hồ sơ xác minh danh tính thành công!',
      );
      return true;
    } catch (e) {
      state = state.copyWith(
        isSubmitting: false,
        errorMessage: 'Lỗi nộp hồ sơ KYC: $e',
      );
      return false;
    }
  }
}
