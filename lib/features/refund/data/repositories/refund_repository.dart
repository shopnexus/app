import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../api/api_providers.dart';
import '../../../../api/generated/api/order_api.dart';
import '../../../../api/generated/model/add_attachments_request.dart';
import '../../../../api/generated/model/admin_refunds_id_verdict_post200_response.dart';
import '../../../../api/generated/model/create_refund_request.dart';
import '../../../../api/generated/model/refund.dart';
import '../../../../api/generated/model/refund_status.dart';
import '../../../../api/generated/model/reject_refund_request.dart';

part 'refund_repository.g.dart';

/// Which side of the order the caller is on. `seller` resolves through the
/// order — a refund row itself only records the buyer.
enum RefundRole {
  buyer('buyer'),
  seller('seller');

  const RefundRole(this.value);

  final String value;
}

class RefundPageResult {
  const RefundPageResult({required this.refunds, this.nextCursor});

  final List<Refund> refunds;
  final String? nextCursor;

  bool get hasMore => nextCursor != null && nextCursor!.isNotEmpty;
}

/// A refund is always for one entire order, so it carries no amount of its own:
/// what is owed is the order's checkout total. There is no escalation route —
/// a party who disagrees opens a `refund-dispute` ticket.
class RefundRepository {
  const RefundRepository(this._api);

  final OrderApi _api;

  Future<RefundPageResult> list({
    required RefundRole role,
    RefundStatus? status,
    String? cursor,
  }) async {
    final response = await _api.refundsGet(
      role: role.value,
      status: status,
      cursor: cursor,
    );
    final page = response.data;
    return RefundPageResult(
      refunds: page?.data ?? const [],
      nextCursor: page?.meta.nextCursor,
    );
  }

  Future<Refund> read(String id) => _unwrap(_api.refundsIdGet(id: id));

  Future<Refund> request({
    required String orderId,
    required String reason,
    List<String>? attachments,
  }) {
    return _unwrap(
      _api.ordersIdRefundsPost(
        id: orderId,
        createRefundRequest: CreateRefundRequest(
          reason: reason,
          attachments: attachments == null || attachments.isEmpty
              ? null
              : attachments,
        ),
      ),
    );
  }

  Future<void> withdraw(String id) => _api.refundsIdDelete(id: id);

  Future<Refund> accept(String id) =>
      _unwrap(_api.refundsIdAcceptancePost(id: id));

  Future<Refund> reject(String id, String reason) {
    return _unwrap(
      _api.refundsIdRejectionPost(
        id: id,
        rejectRefundRequest: RejectRefundRequest(reason: reason),
      ),
    );
  }

  /// The buyer's evidence, topped up until the case closes.
  Future<Refund> addAttachments(String id, List<String> resourceIds) {
    return _unwrap(
      _api.refundsIdAttachmentsPost(
        id: id,
        addAttachmentsRequest: AddAttachmentsRequest(attachments: resourceIds),
      ),
    );
  }

  Future<Refund> _unwrap(
    Future<Response<AdminRefundsIdVerdictPost200Response>> call,
  ) async {
    final refund = (await call).data?.data;
    if (refund == null) throw StateError('empty refund response');
    return refund;
  }
}

@riverpod
RefundRepository refundRepository(Ref ref) =>
    RefundRepository(ref.watch(orderApiProvider));
