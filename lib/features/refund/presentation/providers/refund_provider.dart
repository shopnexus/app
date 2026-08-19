import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopnexus_flutter_app/api/generated/model/refund.dart';
import 'package:shopnexus_flutter_app/api/generated/model/transport_checkpoint.dart';
import 'package:shopnexus_flutter_app/features/refund/data/repositories/refund_repository.dart';

part 'refund_provider.g.dart';

/// Cả hai chiều trong một danh sách — không tham số vai. Xem [RefundListScreen].
@riverpod
Future<List<Refund>> refundList(Ref ref) async {
  final page = await ref.watch(refundRepositoryProvider).list();
  return page.refunds;
}

@riverpod
Future<Refund> refundDetail(Ref ref, String id) =>
    ref.watch(refundRepositoryProvider).read(id);

/// The moves either party can still make on a live case. Everything that decides
/// money is staff's, reached by opening a `refund-dispute` ticket.
///
/// `keepAlive` vì action provider được gọi bằng `read`: autoDispose sẽ huỷ
/// notifier trong lúc `await`, khiến `_invalidate` sau đó ném lỗi Ref disposed.
@Riverpod(keepAlive: true)
class RefundActions extends _$RefundActions {
  @override
  void build() {}

  Future<void> withdraw(String id) async {
    await ref.read(refundRepositoryProvider).withdraw(id);
    _invalidate(id);
  }

  Future<void> accept(String id) async {
    await ref.read(refundRepositoryProvider).accept(id);
    _invalidate(id);
  }

  Future<void> reportReturn(String id, TransportCheckpoint status) async {
    await ref.read(refundRepositoryProvider).reportReturn(id, status);
    _invalidate(id);
  }

  Future<void> addAttachments(String id, List<String> resourceIds) async {
    await ref.read(refundRepositoryProvider).addAttachments(id, resourceIds);
    _invalidate(id);
  }

  void _invalidate(String id) {
    ref.invalidate(refundDetailProvider(id));
    ref.invalidate(refundListProvider);
  }
}
