import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shopnexus_flutter_app/api/generated/api/account_api.dart';
import 'package:shopnexus_flutter_app/core/storage/hive_storage.dart';
import 'package:shopnexus_flutter_app/features/account/data/models/account_model.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/providers/account_provider.dart';
import 'package:shopnexus_flutter_app/features/kyc/data/models/kyc_model.dart';
import 'package:shopnexus_flutter_app/features/kyc/data/repositories/kyc_repository.dart';
import 'package:shopnexus_flutter_app/features/kyc/presentation/providers/selling_gate_provider.dart';

/// Server chặn `POST /listings` khi chưa định danh (`identity_required`, 422) và
/// app không kiểm ở đâu cả: người chưa định danh chụp ảnh, tải lên, ghi âm, đợi
/// model chạy, rồi mới bị từ chối — bằng nguyên văn tiếng Anh của server.
///
/// Ba nhánh phải khác nhau, vì ba việc cần làm khác nhau: nộp, chờ, nộp lại.
void main() {
  ProviderContainer containerWith({
    required bool identityVerified,
    IdentityDocument? document,
  }) => ProviderContainer(
    overrides: [
      profileProvider.overrideWith(
        (ref) async => _me(identityVerified: identityVerified),
      ),
      kycRepositoryProvider.overrideWithValue(_FakeKycRepository(document)),
    ],
  );

  group('sellingEligibility', () {
    /// `identity_verified` là nguồn duy nhất cho "được bán" — đúng cái cờ server
    /// đọc — nên hồ sơ không cần đọc tới.
    test('đã định danh thì qua cửa, không cần đọc hồ sơ', () async {
      final repository = _FakeKycRepository(null);
      final container = ProviderContainer(
        overrides: [
          profileProvider.overrideWith(
            (ref) async => _me(identityVerified: true),
          ),
          kycRepositoryProvider.overrideWithValue(repository),
        ],
      );
      addTearDown(container.dispose);

      final gate = await container.read(sellingEligibilityProvider.future);

      expect(gate.gate, SellingGate.allowed);
      expect(gate.allowed, isTrue);
      expect(repository.reads, 0);
    });

    test('chưa có hồ sơ nào thì mở định danh', () async {
      final container = containerWith(identityVerified: false);
      addTearDown(container.dispose);

      final gate = await container.read(sellingEligibilityProvider.future);

      expect(gate.gate, SellingGate.notStarted);
    });

    test('đang chờ duyệt là một nhánh riêng, không phải "chưa nộp"', () async {
      final container = containerWith(
        identityVerified: false,
        document: _document(IdentityStatus.pending),
      );
      addTearDown(container.dispose);

      final gate = await container.read(sellingEligibilityProvider.future);

      expect(gate.gate, SellingGate.pending);
    });

    /// Bị từ chối mà không được biết vì sao thì chỉ có thể nộp lại đúng hồ sơ
    /// vừa bị từ chối.
    test('bị từ chối thì mang theo lý do', () async {
      final container = containerWith(
        identityVerified: false,
        document: _document(
          IdentityStatus.rejected,
          reason: 'Ảnh giấy tờ bị loá, không đọc được ngày hết hạn',
        ),
      );
      addTearDown(container.dispose);

      final gate = await container.read(sellingEligibilityProvider.future);

      expect(gate.gate, SellingGate.rejected);
      expect(gate.rejectionReason, contains('loá'));
    });

    /// Một hồ sơ `verified` nhưng đã hết hạn vẫn làm `identity_verified` false ở
    /// server, và lúc đó việc cần làm là nộp lại — không phải ngồi chờ một verdict
    /// đã có rồi.
    test('hồ sơ đã duyệt nhưng cờ tắt thì coi như phải nộp lại', () async {
      final container = containerWith(
        identityVerified: false,
        document: _document(IdentityStatus.verified),
      );
      addTearDown(container.dispose);

      final gate = await container.read(sellingEligibilityProvider.future);

      expect(gate.gate, SellingGate.notStarted);
    });
  });
}

Me _me({required bool identityVerified}) => Me(
  id: 'acc_62mxefynht57b',
  createdAt: '2026-08-06T00:00:00Z',
  emailVerified: true,
  hasPassword: true,
  identityVerified: identityVerified,
  role: 'user',
  status: 'active',
);

IdentityDocument _document(IdentityStatus status, {String? reason}) =>
    IdentityDocument(
      createdAt: DateTime.utc(2026, 8, 1),
      docType: IdentityDocumentType.nationalId,
      expiresAt: null,
      id: 'idc_1',
      provider: 'fpt-ai',
      rejectionReason: reason,
      status: status,
      verifiedAt: null,
    );

class _FakeKycRepository extends KycRepository {
  _FakeKycRepository(this.document)
    : super(hiveService: HiveService(), api: AccountApi(Dio()));

  final IdentityDocument? document;
  int reads = 0;

  @override
  Future<IdentityDocument?> getKycStatus(String accountId) async {
    reads++;
    return document;
  }
}
