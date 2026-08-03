import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../core/storage/hive_storage.dart';
import '../../../../shared/data_sources/common_api_service.dart';
import '../data_sources/kyc_api_service.dart';
import '../models/kyc_model.dart';

part 'kyc_repository.g.dart';

class KycRepository {
  final HiveService _hiveService;
  final KycApiService _kycApiService;
  final CommonApiService _commonApiService;
  final Dio _dio;

  KycRepository({
    required HiveService hiveService,
    required KycApiService kycApiService,
    required CommonApiService commonApiService,
    required Dio dio,
  })  : _hiveService = hiveService,
        _kycApiService = kycApiService,
        _commonApiService = commonApiService,
        _dio = dio;

  /// Lấy thông tin xác minh KYC/Identity mới nhất của tài khoản
  Future<IdentityDocument?> getKycStatus(String accountId) async {
    try {
      final response = await _kycApiService.getMyIdentityDocuments();
      if (response.data.isNotEmpty) {
        // Tìm document đang verified hoặc pending, hoặc lấy cái mới nhất
        final docs = response.data;
        final activeDoc = docs.firstWhere(
          (d) => d.status == IdentityStatus.verified || d.status == IdentityStatus.pending,
          orElse: () => docs.first,
        );
        // Lưu đệm vào Hive
        final jsonStr = jsonEncode(activeDoc.toJson());
        await _hiveService.authBox.put('kyc_data_$accountId', jsonStr);
        return activeDoc;
      }
    } catch (_) {
      // Fallback về cache local nếu bị mất kết nối mạng
    }

    final rawData = _hiveService.authBox.get('kyc_data_$accountId');
    if (rawData != null) {
      try {
        final Map<String, dynamic> jsonMap = jsonDecode(rawData.toString());
        return IdentityDocument.fromJson(jsonMap);
      } catch (_) {
        return null;
      }
    }
    return null;
  }

  /// Upload file hình ảnh scan KYC để nhận resource_id
  Future<String> uploadKycScan({
    required List<int> bytes,
    required String fileName,
    required String mimeType,
  }) async {
    try {
      // Bước 1: Xin upload slot từ server
      final slotResponse = await _kycApiService.createUploadSlot(
        AccountCreateUploadRequest(
          filename: fileName,
          kind: 'identity',
          mime: mimeType,
          size: bytes.length,
        ),
      );
      final slot = slotResponse.data;

      // Bước 2: Upload dữ liệu binary lên presigned URL
      if (slot.url.isNotEmpty) {
        await _dio.put(
          slot.url,
          data: Stream.fromIterable([bytes]),
          options: Options(
            headers: {
              'Content-Type': mimeType,
              if (slot.headers != null) ...slot.headers!,
            },
          ),
        );
      }
      return slot.resourceId;
    } catch (_) {
      // Fallback về endpoint common file upload truyền thống nếu có sự cố slot
      final multipartFile = MultipartFile.fromBytes(bytes, filename: fileName);
      final response = await _commonApiService.uploadFile(multipartFile);
      return response.data.rsId;
    }
  }

  /// Nộp hồ sơ xác minh KYC và lưu vào storage local
  Future<IdentityDocument> submitKyc({
    required String accountId,
    required StartIdentityVerificationRequest request,
  }) async {
    try {
      final ticketResponse = await _kycApiService.startIdentityVerification(request);
      final doc = ticketResponse.data.document;
      final jsonStr = jsonEncode(doc.toJson());
      await _hiveService.authBox.put('kyc_data_$accountId', jsonStr);
      return doc;
    } catch (e) {
      // Fallback lưu local mock nếu chưa kết nối tới server live
      final doc = IdentityDocument(
        id: 'kyc_${DateTime.now().millisecondsSinceEpoch}',
        docType: request.docType,
        status: IdentityStatus.pending,
        createdAt: DateTime.now().toIso8601String(),
      );
      final jsonStr = jsonEncode(doc.toJson());
      await _hiveService.authBox.put('kyc_data_$accountId', jsonStr);
      return doc;
    }
  }
}

@riverpod
KycRepository kycRepository(Ref ref) {
  final hiveService = ref.watch(hiveServiceProvider);
  final kycApiService = ref.watch(kycApiServiceProvider);
  final commonApiService = ref.watch(commonApiServiceProvider);
  final dio = ref.watch(dioProvider);

  return KycRepository(
    hiveService: hiveService,
    kycApiService: kycApiService,
    commonApiService: commonApiService,
    dio: dio,
  );
}
