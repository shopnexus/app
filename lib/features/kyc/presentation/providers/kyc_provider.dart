import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../account/presentation/providers/account_provider.dart';
import '../../data/models/kyc_model.dart';
import '../../data/repositories/kyc_repository.dart';

part 'kyc_provider.g.dart';

enum KycImageType { frontCard, backCard, selfie }

class KycFormState {
  final KycModel? kycModel;
  final bool isLoading;
  final bool isSubmitting;

  // Selected Image Paths / URLs
  final String? frontCardPath;
  final String? backCardPath;
  final String? selfiePath;

  final String? frontCardUrl;
  final String? backCardUrl;
  final String? selfieUrl;

  final bool isUploadingFront;
  final bool isUploadingBack;
  final bool isUploadingSelfie;

  // Input Fields
  final String idNumber;
  final String fullName;
  final String? dateOfBirth;
  final String? issueDate;
  final String? issuePlace;

  final String? errorMessage;
  final String? successMessage;

  const KycFormState({
    this.kycModel,
    this.isLoading = false,
    this.isSubmitting = false,
    this.frontCardPath,
    this.backCardPath,
    this.selfiePath,
    this.frontCardUrl,
    this.backCardUrl,
    this.selfieUrl,
    this.isUploadingFront = false,
    this.isUploadingBack = false,
    this.isUploadingSelfie = false,
    this.idNumber = '',
    this.fullName = '',
    this.dateOfBirth,
    this.issueDate,
    this.issuePlace,
    this.errorMessage,
    this.successMessage,
  });

  KycFormState copyWith({
    KycModel? kycModel,
    bool? isLoading,
    bool? isSubmitting,
    String? frontCardPath,
    String? backCardPath,
    String? selfiePath,
    String? frontCardUrl,
    String? backCardUrl,
    String? selfieUrl,
    bool? isUploadingFront,
    bool? isUploadingBack,
    bool? isUploadingSelfie,
    String? idNumber,
    String? fullName,
    String? dateOfBirth,
    String? issueDate,
    String? issuePlace,
    String? errorMessage,
    String? successMessage,
  }) {
    return KycFormState(
      kycModel: kycModel ?? this.kycModel,
      isLoading: isLoading ?? this.isLoading,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      frontCardPath: frontCardPath ?? this.frontCardPath,
      backCardPath: backCardPath ?? this.backCardPath,
      selfiePath: selfiePath ?? this.selfiePath,
      frontCardUrl: frontCardUrl ?? this.frontCardUrl,
      backCardUrl: backCardUrl ?? this.backCardUrl,
      selfieUrl: selfieUrl ?? this.selfieUrl,
      isUploadingFront: isUploadingFront ?? this.isUploadingFront,
      isUploadingBack: isUploadingBack ?? this.isUploadingBack,
      isUploadingSelfie: isUploadingSelfie ?? this.isUploadingSelfie,
      idNumber: idNumber ?? this.idNumber,
      fullName: fullName ?? this.fullName,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      issueDate: issueDate ?? this.issueDate,
      issuePlace: issuePlace ?? this.issuePlace,
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
          isLoading: false,
          idNumber: kyc?.idNumber ?? '',
          fullName: kyc?.fullName ?? profile.name ?? '',
          dateOfBirth: kyc?.dateOfBirth ?? profile.dateOfBirth,
          issueDate: kyc?.issueDate,
          issuePlace: kyc?.issuePlace,
          frontCardUrl: kyc?.frontCardUrl,
          backCardUrl: kyc?.backCardUrl,
          selfieUrl: kyc?.selfieUrl,
        );
      } else {
        state = state.copyWith(isLoading: false);
      }
    } catch (_) {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> pickAndUploadImage(
    KycImageType type,
    ImageSource source,
  ) async {
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
      final resource = await repository.uploadKycImage(bytes, image.name);

      switch (type) {
        case KycImageType.frontCard:
          state = state.copyWith(
            frontCardUrl: resource.url,
            isUploadingFront: false,
          );
          break;
        case KycImageType.backCard:
          state = state.copyWith(
            backCardUrl: resource.url,
            isUploadingBack: false,
          );
          break;
        case KycImageType.selfie:
          state = state.copyWith(
            selfieUrl: resource.url,
            isUploadingSelfie: false,
          );
          break;
      }
    } catch (e) {
      switch (type) {
        case KycImageType.frontCard:
          state = state.copyWith(
            isUploadingFront: false,
            errorMessage: 'Lỗi tải ảnh mặt trước CCCD: $e',
          );
          break;
        case KycImageType.backCard:
          state = state.copyWith(
            isUploadingBack: false,
            errorMessage: 'Lỗi tải ảnh mặt sau CCCD: $e',
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

  void updateFormFields({
    String? idNumber,
    String? fullName,
    String? dateOfBirth,
    String? issueDate,
    String? issuePlace,
  }) {
    state = state.copyWith(
      idNumber: idNumber ?? state.idNumber,
      fullName: fullName ?? state.fullName,
      dateOfBirth: dateOfBirth ?? state.dateOfBirth,
      issueDate: issueDate ?? state.issueDate,
      issuePlace: issuePlace ?? state.issuePlace,
      errorMessage: null,
    );
  }

  Future<bool> submitKyc() async {
    final profile = ref.read(profileProvider).value;
    if (profile == null) {
      state = state.copyWith(errorMessage: 'Không tìm thấy thông tin tài khoản');
      return false;
    }

    if (state.idNumber.trim().isEmpty) {
      state = state.copyWith(errorMessage: 'Vui lòng nhập số CCCD/CMND');
      return false;
    }

    if (state.idNumber.trim().length < 9) {
      state = state.copyWith(errorMessage: 'Số CCCD/CMND không hợp lệ (tối thiểu 9 chữ số)');
      return false;
    }

    if (state.fullName.trim().isEmpty) {
      state = state.copyWith(errorMessage: 'Vui lòng nhập họ và tên trên CCCD');
      return false;
    }

    if (state.frontCardPath == null && state.frontCardUrl == null) {
      state = state.copyWith(errorMessage: 'Vui lòng chụp/chọn ảnh mặt trước CCCD');
      return false;
    }

    if (state.backCardPath == null && state.backCardUrl == null) {
      state = state.copyWith(errorMessage: 'Vui lòng chụp/chọn ảnh mặt sau CCCD');
      return false;
    }

    if (state.selfiePath == null && state.selfieUrl == null) {
      state = state.copyWith(errorMessage: 'Vui lòng chụp/chọn ảnh chân dung cầm CCCD');
      return false;
    }

    state = state.copyWith(isSubmitting: true, errorMessage: null);

    try {
      final repository = ref.read(kycRepositoryProvider);
      final req = SubmitKycRequest(
        idNumber: state.idNumber.trim(),
        fullName: state.fullName.trim(),
        dateOfBirth: state.dateOfBirth,
        issueDate: state.issueDate,
        issuePlace: state.issuePlace,
      );

      final kycResult = await repository.submitKyc(
        accountId: profile.id,
        request: req,
        frontCardUrl: state.frontCardUrl ?? state.frontCardPath,
        backCardUrl: state.backCardUrl ?? state.backCardPath,
        selfieUrl: state.selfieUrl ?? state.selfiePath,
      );

      state = state.copyWith(
        kycModel: kycResult,
        isSubmitting: false,
        successMessage: 'Nộp hồ sơ xác minh KYC thành công!',
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
