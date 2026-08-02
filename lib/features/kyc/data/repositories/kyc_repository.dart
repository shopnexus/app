import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/storage/hive_storage.dart';
import '../../../../shared/data_sources/common_api_service.dart';
import '../../../../shared/models/geocode_model.dart';
import '../models/kyc_model.dart';

part 'kyc_repository.g.dart';

class KycRepository {
  final HiveService _hiveService;
  final CommonApiService _commonApiService;

  KycRepository({
    required HiveService hiveService,
    required CommonApiService commonApiService,
  }) : _hiveService = hiveService,
       _commonApiService = commonApiService;

  /// Lấy thông tin KYC hiện tại của tài khoản (ưu tiên từ Hive cache)
  Future<KycModel?> getKycStatus(String accountId) async {
    final rawData = _hiveService.authBox.get('kyc_data_$accountId');
    if (rawData != null) {
      try {
        final Map<String, dynamic> jsonMap = jsonDecode(rawData.toString());
        return KycModel.fromJson(jsonMap);
      } catch (_) {
        return null;
      }
    }
    return null;
  }

  /// Upload file hình ảnh CCCD/Chân dung lên server để lấy FileUploadResponse
  Future<FileUploadResponse> uploadKycImage(
    List<int> bytes,
    String fileName,
  ) async {
    final multipartFile = MultipartFile.fromBytes(bytes, filename: fileName);
    final response = await _commonApiService.uploadFile(multipartFile);
    return response.data;
  }

  /// Nộp hồ sơ xác minh KYC và lưu vào storage local
  Future<KycModel> submitKyc({
    required String accountId,
    required SubmitKycRequest request,
    String? frontCardUrl,
    String? backCardUrl,
    String? selfieUrl,
  }) async {
    // Giả lập lưu thông tin xác minh KYC gửi lên hệ thống
    final kycModel = KycModel(
      id: 'kyc_${DateTime.now().millisecondsSinceEpoch}',
      accountId: accountId,
      idNumber: request.idNumber,
      fullName: request.fullName,
      dateOfBirth: request.dateOfBirth,
      issueDate: request.issueDate,
      issuePlace: request.issuePlace,
      frontCardUrl: frontCardUrl,
      backCardUrl: backCardUrl,
      selfieUrl: selfieUrl,
      status: KycStatus.pending,
      submittedAt: DateTime.now().toIso8601String(),
    );

    // Lưu vào Hive box để duy trì trạng thái ứng dụng
    final jsonStr = jsonEncode(kycModel.toJson());
    await _hiveService.authBox.put('kyc_data_$accountId', jsonStr);

    return kycModel;
  }
}

@riverpod
KycRepository kycRepository(Ref ref) {
  final hiveService = ref.watch(hiveServiceProvider);
  final commonApiService = ref.watch(commonApiServiceProvider);
  return KycRepository(
    hiveService: hiveService,
    commonApiService: commonApiService,
  );
}
