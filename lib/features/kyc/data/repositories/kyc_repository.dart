import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopnexus_flutter_app/api/api_providers.dart';
import 'package:shopnexus_flutter_app/api/generated/api/account_api.dart';
import 'package:shopnexus_flutter_app/core/storage/hive_storage.dart';
import 'package:shopnexus_flutter_app/features/kyc/data/models/kyc_model.dart';

part 'kyc_repository.g.dart';

class KycRepository {
  const KycRepository({
    required HiveService hiveService,
    required AccountApi api,
  }) : _hiveService = hiveService,
       _api = api;

  final HiveService _hiveService;
  final AccountApi _api;

  /// The document that decides whether this account may sell, or null when there
  /// is nothing on file. Cached so the account centre still renders offline.
  Future<IdentityDocument?> getKycStatus(String accountId) async {
    try {
      final documents = (await _api.meIdentityDocumentsGet()).data?.data;
      if (documents != null && documents.isNotEmpty) {
        final active = documents.firstWhere(
          (d) =>
              d.status == IdentityStatus.verified ||
              d.status == IdentityStatus.pending,
          orElse: () => documents.first,
        );
        await _hiveService.authBox.put(
          'kyc_data_$accountId',
          jsonEncode(active.toJson()),
        );
        return active;
      }
      return null;
    } catch (_) {
      // Offline: fall back to what was last seen.
    }

    final cached = _hiveService.authBox.get('kyc_data_$accountId');
    if (cached == null) return null;
    try {
      return IdentityDocument.fromJson(
        jsonDecode(cached.toString()) as Map<String, dynamic>,
      );
    } catch (_) {
      return null;
    }
  }

  /// Reserve a slot, PUT the bytes, and hand back the resource id the
  /// verification request references. The bytes never pass through the API.
  Future<String> uploadKycScan({
    required List<int> bytes,
    required String fileName,
    required String mimeType,
  }) async {
    final reserved = (await _api.meUploadsPost(
      accountCreateUploadRequest: AccountCreateUploadRequest(
        filename: fileName,
        kind: AccountCreateUploadRequestKindEnum.identity,
        mime: mimeType,
        size: bytes.length,
      ),
    )).data?.data;
    if (reserved == null) throw StateError('empty upload slot');

    // A bare Dio: the signed URL is the storage provider's origin and must not
    // be sent this platform's bearer token.
    await Dio().put<void>(
      reserved.url,
      data: Stream.fromIterable([bytes]),
      options: Options(
        headers: {
          ...?reserved.headers,
          Headers.contentLengthHeader: bytes.length,
        },
        contentType: mimeType,
      ),
    );

    await _api.meUploadsIdConfirmationPost(id: reserved.resourceId);
    return reserved.resourceId;
  }

  /// A vendor either decides now or runs its own web flow, so the ticket may
  /// carry a session URL beside the document. Whichever came back is stored.
  Future<IdentityVerificationTicket> submitKyc({
    required String accountId,
    required StartIdentityVerificationRequest request,
  }) async {
    final ticket = (await _api.identityDocumentsPost(
      startIdentityVerificationRequest: request,
    )).data?.data;
    if (ticket == null) throw StateError('empty verification ticket');
    await _hiveService.authBox.put(
      'kyc_data_$accountId',
      jsonEncode(ticket.document.toJson()),
    );
    return ticket;
  }
}

@riverpod
KycRepository kycRepository(Ref ref) => KycRepository(
  hiveService: ref.watch(hiveServiceProvider),
  api: ref.watch(accountApiProvider),
);
