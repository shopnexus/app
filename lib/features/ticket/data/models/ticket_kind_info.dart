import '../../../../api/generated/model/ticket_action.dart';
import '../../../../api/generated/model/ticket_kind.dart';
import '../../../../api/generated/model/ticket_reason.dart';
import '../../../../api/generated/model/ticket_ref_type.dart';
import '../../../../api/generated/model/ticket_status.dart';

/// What each kind needs and what it is called in Vietnamese. The backend refuses
/// a `ref_id` on a kind that is about nothing and requires one on the kinds that
/// are about something, so the form has to know which is which before it posts.
class TicketKindInfo {
  const TicketKindInfo({
    required this.kind,
    required this.label,
    required this.needsRef,
    required this.needsReason,
    this.refPrefix,
  });

  final TicketKind kind;
  final String label;
  final bool needsRef;

  /// Only the report kinds carry grounds.
  final bool needsReason;

  /// The opaque-id prefix `ref_id` must have. The backend checks that the prefix
  /// agrees with the kind, so a mismatch is a 400 rather than a wrong ticket.
  final String? refPrefix;

  static const List<TicketKindInfo> all = [
    TicketKindInfo(
      kind: TicketKind.reportListing,
      label: 'Báo cáo tin đăng',
      needsRef: true,
      needsReason: true,
      refPrefix: 'lst_',
    ),
    TicketKindInfo(
      kind: TicketKind.reportAccount,
      label: 'Báo cáo người dùng',
      needsRef: true,
      needsReason: true,
      refPrefix: 'acc_',
    ),
    TicketKindInfo(
      kind: TicketKind.reportMessage,
      label: 'Báo cáo tin nhắn',
      needsRef: true,
      needsReason: true,
      refPrefix: 'msg_',
    ),
    TicketKindInfo(
      kind: TicketKind.reportReview,
      label: 'Báo cáo đánh giá',
      needsRef: true,
      needsReason: true,
      refPrefix: 'rvw_',
    ),
    TicketKindInfo(
      kind: TicketKind.reportReviewReply,
      label: 'Báo cáo phản hồi đánh giá',
      needsRef: true,
      needsReason: true,
      refPrefix: 'rpl_',
    ),
    TicketKindInfo(
      kind: TicketKind.refundDispute,
      label: 'Khiếu nại hoàn tiền',
      needsRef: true,
      needsReason: false,
      refPrefix: 'rfd_',
    ),
    TicketKindInfo(
      kind: TicketKind.orderIssue,
      label: 'Sự cố đơn hàng',
      needsRef: true,
      needsReason: false,
      refPrefix: 'ord_',
    ),
    TicketKindInfo(
      kind: TicketKind.payment,
      label: 'Vấn đề thanh toán',
      needsRef: false,
      needsReason: false,
    ),
    TicketKindInfo(
      kind: TicketKind.account,
      label: 'Vấn đề tài khoản',
      needsRef: false,
      needsReason: false,
    ),
    TicketKindInfo(
      kind: TicketKind.featureRequest,
      label: 'Góp ý tính năng',
      needsRef: false,
      needsReason: false,
    ),
    TicketKindInfo(
      kind: TicketKind.other,
      label: 'Khác',
      needsRef: false,
      needsReason: false,
    ),
  ];

  /// The kinds a user raises without already being on the thing it is about —
  /// what the help centre's "create ticket" form offers.
  static List<TicketKindInfo> get selfServe =>
      all.where((info) => !info.needsRef).toList();

  static TicketKindInfo of(TicketKind kind) =>
      all.firstWhere((info) => info.kind == kind);
}

String ticketStatusLabel(TicketStatus status) => switch (status) {
  TicketStatus.open => 'Đang chờ',
  TicketStatus.reviewing => 'Đang xử lý',
  TicketStatus.resolved => 'Đã xử lý',
};

String ticketReasonLabel(TicketReason reason) => switch (reason) {
  TicketReason.scam => 'Lừa đảo',
  TicketReason.counterfeit => 'Hàng giả',
  TicketReason.prohibited => 'Hàng cấm',
  TicketReason.harassment => 'Quấy rối',
  TicketReason.spam => 'Spam',
  TicketReason.inappropriate => 'Nội dung không phù hợp',
  TicketReason.other => 'Khác',
};

/// `none` is a ticket read and answered with nothing done — the turn-down.
String ticketActionLabel(TicketAction action) => switch (action) {
  TicketAction.none => 'Không có vi phạm',
  TicketAction.listingRemoved => 'Đã xóa tin đăng',
  TicketAction.messageRemoved => 'Đã xóa tin nhắn',
  TicketAction.accountSuspended => 'Đã khóa tài khoản',
  TicketAction.warning => 'Đã cảnh báo',
  TicketAction.refundGranted => 'Chấp nhận hoàn tiền',
  TicketAction.refundRefused => 'Từ chối hoàn tiền',
};

String ticketRefTypeLabel(TicketRefType type) => switch (type) {
  TicketRefType.listing => 'Tin đăng',
  TicketRefType.account => 'Tài khoản',
  TicketRefType.message => 'Tin nhắn',
  TicketRefType.review => 'Đánh giá',
  TicketRefType.reviewReply => 'Phản hồi đánh giá',
  TicketRefType.order => 'Đơn hàng',
  TicketRefType.refund => 'Yêu cầu hoàn tiền',
};
