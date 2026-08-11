import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:shopnexus_flutter_app/api/generated/model/order.dart';
import 'package:shopnexus_flutter_app/features/account/data/models/order_view.dart';

/// Chụp nguyên văn từ gateway thật, và nó là một đơn đang **kẹt**: `state: open`,
/// `received_at: null`, kiện hàng `delivered`. Câu truy vấn payout đòi
/// `received_at IS NOT NULL`, mà app không có đường nào set nó — nên tiền của
/// người bán nằm trong escrow vĩnh viễn. Test này giữ cái cửa sổ đó.
const deliveredOrderJson = r'''
{
  "id": "ord_1kp63nxtq57gw",
  "draft_id": "drf_dk67gj2ygshdd",
  "offer_id": null,
  "buyer": {
    "id": "acc_ce9c5g2rzqt68",
    "name": "123123",
    "avatar": null
  },
  "seller": {
    "id": "acc_48gmxxfhd8ta3",
    "name": "Bob Electronics",
    "avatar": null
  },
  "address": {
    "full_name": "Trương Tuấn Tú",
    "phone": "+8412312312",
    "country": "VN",
    "province_code": "04",
    "district_code": null,
    "ward_code": "01270",
    "address_detail": null
  },
  "pickup_address": {
    "full_name": "Bob Electronics",
    "phone": "+84900000002",
    "country": "VN",
    "province_code": "79",
    "district_code": null,
    "ward_code": "26734",
    "address_detail": null
  },
  "items": [
    {
      "id": "itm_2q1jyxn030p57",
      "order_id": "ord_1kp63nxtq57gw",
      "listing_id": "lst_a60p5qh3t6ry4",
      "variant_id": "vrn_0ev7apet9dsq8",
      "seller_id": "acc_48gmxxfhd8ta3",
      "quantity": 1,
      "currency": "VND",
      "total_amount": 49000,
      "transport_option": "mock-standard",
      "payment_session_id": "pay_6km4r6jyrk113",
      "note": "",
      "cancelled_at": null,
      "created_at": "2026-08-06T10:42:33.548514Z"
    }
  ],
  "state": "open",
  "total": 49000,
  "currency": "VND",
  "transport": {
    "id": "trp_andz2vppgr6aa",
    "option": "mock-standard",
    "status": "delivered",
    "fee": 15000,
    "created_at": "2026-08-06T10:42:33.80824Z"
  },
  "confirmed_at": "2026-08-06T13:59:39.635571Z",
  "confirmation_deadline_at": null,
  "decline_reason": null,
  "received_at": null,
  "receipt_attachments": [],
  "payout_deadline_at": null,
  "payout_released_at": null,
  "created_at": "2026-08-06T10:42:33.826375Z",
  "completed_at": null,
  "cancelled_at": null,
  "refund": null
}
''';

OrderView viewOf(Map<String, dynamic> json) =>
    OrderView(order: Order.fromJson(json), lines: const []);

Map<String, dynamic> decode() =>
    jsonDecode(deliveredOrderJson) as Map<String, dynamic>;

void main() {
  test('một đơn thật đã giao và chưa xác nhận thì xác nhận được', () {
    final view = viewOf(decode());

    expect(view.order.receivedAt, isNull);
    expect(view.canConfirmReceipt, isTrue);
  });

  test('đã xác nhận rồi thì không hỏi lại', () {
    final json = decode()..['received_at'] = '2026-08-06T10:00:00Z';

    expect(viewOf(json).canConfirmReceipt, isFalse);
  });

  /// Đọc kiện hàng, không đọc `state`: `open` chỉ nói người bán đã nhận đơn.
  /// Hỏi "đã nhận hàng chưa" khi hàng còn trên đường là mời người mua xác nhận
  /// một thứ chưa xảy ra — và xác nhận đó không hoàn tác được.
  test('hàng chưa tới thì không hỏi, dù đơn đang open', () {
    for (final status in ['pending', 'picked-up', 'in-transit']) {
      final json = decode();
      (json['transport'] as Map<String, dynamic>)['status'] = status;

      expect(
        viewOf(json).canConfirmReceipt,
        isFalse,
        reason: 'transport $status',
      );
    }
  });

  /// Đơn đã có kết cục thì không còn gì để xác nhận — và `completed` nghĩa là
  /// tiền đã đi rồi.
  test('đơn đã xong hoặc đã hủy thì không hỏi', () {
    for (final state in ['completed', 'cancelled']) {
      final json = decode()..['state'] = state;

      expect(viewOf(json).canConfirmReceipt, isFalse, reason: state);
    }
  });
}
