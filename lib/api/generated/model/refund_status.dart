//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

/// Every live value names the party whose move the refund is waiting on, and each of those carries a `deadline_at` that the party can miss:  `awaiting-seller-review` — the seller grants it or hands it to staff; they cannot refuse it. Missing the window hands it to staff too. `disputed` — staff are looking at it. `returning` — the goods are on their way back; only a granted refund ever reaches here. `returned` — the seller has acknowledged the return and now inspects what arrived, and may escalate until the window closes, which is where a broken or substituted return is caught. A return the buyer reports and the seller has not goes to `disputed` rather than here.  Then three terminals: `accepted` is money back to the buyer and the order closed with it, `rejected` is no refund and the payout stands, `cancelled` is the buyer withdrawing before the seller decided. Only the last two give the escrow up — `accepted` keeps its claim, because that money has already gone to the buyer.
enum RefundStatus {
  /// Every live value names the party whose move the refund is waiting on, and each of those carries a `deadline_at` that the party can miss:  `awaiting-seller-review` — the seller grants it or hands it to staff; they cannot refuse it. Missing the window hands it to staff too. `disputed` — staff are looking at it. `returning` — the goods are on their way back; only a granted refund ever reaches here. `returned` — the seller has acknowledged the return and now inspects what arrived, and may escalate until the window closes, which is where a broken or substituted return is caught. A return the buyer reports and the seller has not goes to `disputed` rather than here.  Then three terminals: `accepted` is money back to the buyer and the order closed with it, `rejected` is no refund and the payout stands, `cancelled` is the buyer withdrawing before the seller decided. Only the last two give the escrow up — `accepted` keeps its claim, because that money has already gone to the buyer.
  @JsonValue(r'awaiting-seller-review')
  awaitingSellerReview(r'awaiting-seller-review'),

  /// Every live value names the party whose move the refund is waiting on, and each of those carries a `deadline_at` that the party can miss:  `awaiting-seller-review` — the seller grants it or hands it to staff; they cannot refuse it. Missing the window hands it to staff too. `disputed` — staff are looking at it. `returning` — the goods are on their way back; only a granted refund ever reaches here. `returned` — the seller has acknowledged the return and now inspects what arrived, and may escalate until the window closes, which is where a broken or substituted return is caught. A return the buyer reports and the seller has not goes to `disputed` rather than here.  Then three terminals: `accepted` is money back to the buyer and the order closed with it, `rejected` is no refund and the payout stands, `cancelled` is the buyer withdrawing before the seller decided. Only the last two give the escrow up — `accepted` keeps its claim, because that money has already gone to the buyer.
  @JsonValue(r'disputed')
  disputed(r'disputed'),

  /// Every live value names the party whose move the refund is waiting on, and each of those carries a `deadline_at` that the party can miss:  `awaiting-seller-review` — the seller grants it or hands it to staff; they cannot refuse it. Missing the window hands it to staff too. `disputed` — staff are looking at it. `returning` — the goods are on their way back; only a granted refund ever reaches here. `returned` — the seller has acknowledged the return and now inspects what arrived, and may escalate until the window closes, which is where a broken or substituted return is caught. A return the buyer reports and the seller has not goes to `disputed` rather than here.  Then three terminals: `accepted` is money back to the buyer and the order closed with it, `rejected` is no refund and the payout stands, `cancelled` is the buyer withdrawing before the seller decided. Only the last two give the escrow up — `accepted` keeps its claim, because that money has already gone to the buyer.
  @JsonValue(r'returning')
  returning(r'returning'),

  /// Every live value names the party whose move the refund is waiting on, and each of those carries a `deadline_at` that the party can miss:  `awaiting-seller-review` — the seller grants it or hands it to staff; they cannot refuse it. Missing the window hands it to staff too. `disputed` — staff are looking at it. `returning` — the goods are on their way back; only a granted refund ever reaches here. `returned` — the seller has acknowledged the return and now inspects what arrived, and may escalate until the window closes, which is where a broken or substituted return is caught. A return the buyer reports and the seller has not goes to `disputed` rather than here.  Then three terminals: `accepted` is money back to the buyer and the order closed with it, `rejected` is no refund and the payout stands, `cancelled` is the buyer withdrawing before the seller decided. Only the last two give the escrow up — `accepted` keeps its claim, because that money has already gone to the buyer.
  @JsonValue(r'returned')
  returned(r'returned'),

  /// Every live value names the party whose move the refund is waiting on, and each of those carries a `deadline_at` that the party can miss:  `awaiting-seller-review` — the seller grants it or hands it to staff; they cannot refuse it. Missing the window hands it to staff too. `disputed` — staff are looking at it. `returning` — the goods are on their way back; only a granted refund ever reaches here. `returned` — the seller has acknowledged the return and now inspects what arrived, and may escalate until the window closes, which is where a broken or substituted return is caught. A return the buyer reports and the seller has not goes to `disputed` rather than here.  Then three terminals: `accepted` is money back to the buyer and the order closed with it, `rejected` is no refund and the payout stands, `cancelled` is the buyer withdrawing before the seller decided. Only the last two give the escrow up — `accepted` keeps its claim, because that money has already gone to the buyer.
  @JsonValue(r'accepted')
  accepted(r'accepted'),

  /// Every live value names the party whose move the refund is waiting on, and each of those carries a `deadline_at` that the party can miss:  `awaiting-seller-review` — the seller grants it or hands it to staff; they cannot refuse it. Missing the window hands it to staff too. `disputed` — staff are looking at it. `returning` — the goods are on their way back; only a granted refund ever reaches here. `returned` — the seller has acknowledged the return and now inspects what arrived, and may escalate until the window closes, which is where a broken or substituted return is caught. A return the buyer reports and the seller has not goes to `disputed` rather than here.  Then three terminals: `accepted` is money back to the buyer and the order closed with it, `rejected` is no refund and the payout stands, `cancelled` is the buyer withdrawing before the seller decided. Only the last two give the escrow up — `accepted` keeps its claim, because that money has already gone to the buyer.
  @JsonValue(r'rejected')
  rejected(r'rejected'),

  /// Every live value names the party whose move the refund is waiting on, and each of those carries a `deadline_at` that the party can miss:  `awaiting-seller-review` — the seller grants it or hands it to staff; they cannot refuse it. Missing the window hands it to staff too. `disputed` — staff are looking at it. `returning` — the goods are on their way back; only a granted refund ever reaches here. `returned` — the seller has acknowledged the return and now inspects what arrived, and may escalate until the window closes, which is where a broken or substituted return is caught. A return the buyer reports and the seller has not goes to `disputed` rather than here.  Then three terminals: `accepted` is money back to the buyer and the order closed with it, `rejected` is no refund and the payout stands, `cancelled` is the buyer withdrawing before the seller decided. Only the last two give the escrow up — `accepted` keeps its claim, because that money has already gone to the buyer.
  @JsonValue(r'cancelled')
  cancelled(r'cancelled');

  const RefundStatus(this.value);

  final String value;

  @override
  String toString() => value;
}
