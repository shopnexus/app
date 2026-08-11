import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopnexus_flutter_app/api/api_providers.dart';
import 'package:shopnexus_flutter_app/api/generated/api/account_api.dart';
import 'package:shopnexus_flutter_app/core/storage/hive_storage.dart';
import 'package:shopnexus_flutter_app/features/kyc/data/models/kyc_model.dart';
import 'package:shopnexus_flutter_app/core/upload/resource_uploader.dart';

part 'kyc_repository.g.dart';

class KycRepository {
  const KycRepository({
    required HiveService hiveService,
    required AccountApi api,
    required ResourceUploader uploader,
  }) : _hiveService = hiveService,
       _api = api,
       _uploader = uploader;

  final HiveService _hiveService;
  final AccountApi _api;
  final ResourceUploader _uploader;

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

  /// Hands back the resource id the verification request references. A scan goes
  /// up as `kind: identity`, not `avatar` — the same store holds both, and only
  /// an avatar may ever resolve to a public link.
  Future<String> uploadKycScan({
    required List<int> bytes,
    required String fileName,
    required String mimeType,
  }) async {
    final resource = await _uploader.upload(
      UploadTarget.identityDocument,
      bytes: bytes,
      filename: fileName,
      mime: mimeType,
    );
    return resource.id;
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
  uploader: ref.watch(resourceUploaderProvider),
);
