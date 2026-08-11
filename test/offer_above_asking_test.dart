import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shopnexus_flutter_app/api/generated/model/account_summary.dart';
import 'package:shopnexus_flutter_app/api/generated/model/offer.dart';
import 'package:shopnexus_flutter_app/api/generated/model/offer_listing.dart';
import 'package:shopnexus_flutter_app/api/generated/model/offer_status.dart';
import 'package:shopnexus_flutter_app/features/chat/presentation/widgets/counter_offer_dialog.dart';

/// Thương lượng chỉ đi xuống. Giá niêm yết vốn đã là lời đề nghị bán ở mức đó,
/// nên một đề xuất *cao hơn* nó là thứ không ai gõ có chủ đích — và server trả
/// 422 `offer_above_asking` cho nó.
///
/// Hỏi ở client để câu trả lời tới lúc đang gõ, chứ không phải sau khi bấm gửi:
/// hộp thoại trả giá không tự biết giá niêm yết (DTO của offer không mang), nên
/// nó nhận cái trần từ người gọi và **không bịa ra một cái khi không có**.
void main() {
  Offer offerOf({required int total, required int quantity}) => Offer(
    id: 'ofr_1',
    listingId: 'lst_1',
    variantId: 'var_1',
    buyerId: 'acc_buyer',
    sellerId: 'acc_seller',
    authorId: 'acc_buyer',
    listing: OfferListing(name: 'Áo khoác denim size M', cover: null),
    counterparty: AccountSummary(id: 'acc_seller', name: 'Bob', avatar: null),
    status: OfferStatus.active,
    quantity: quantity,
    total: total,
    currency: 'VND',
    reason: '',
    createdAt: DateTime(2026, 8, 10),
    expiresAt: DateTime(2026, 8, 12),
  );

  Future<void> pump(
    WidgetTester tester, {
    required int? askingUnitPrice,
    required int quantity,
  }) async {
    // Mở qua `show` chứ không dựng thẳng widget: gửi được nghĩa là hộp thoại
    // đóng lại, và đóng cần một Navigator thật ở trên nó.
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) => Scaffold(
            body: TextButton(
              onPressed: () => CounterOfferDialog.show(
                context,
                offerOf(total: 80000, quantity: quantity),
                askingUnitPrice: askingUnitPrice,
              ),
              child: const Text('mở'),
            ),
          ),
        ),
      ),
    );
    await tester.tap(find.text('mở'));
    await tester.pumpAndSettle();
  }

  Future<void> type(WidgetTester tester, String amount) async {
    await tester.enterText(find.byType(TextFormField).first, amount);
    await tester.tap(find.text('Gửi đề nghị'));
    await tester.pumpAndSettle();
  }

  testWidgets('trên giá niêm yết thì không gửi, và nói vì sao', (tester) async {
    await pump(tester, askingUnitPrice: 100000, quantity: 1);
    await type(tester, '120000');

    expect(find.textContaining('Không cao hơn giá niêm yết'), findsOneWidget);
    // Hộp thoại vẫn mở: không có terms nào rời khỏi đây.
    expect(find.text('Đề nghị mức giá khác'), findsOneWidget);
  });

  testWidgets('đúng bằng giá niêm yết thì gửi được', (tester) async {
    await pump(tester, askingUnitPrice: 100000, quantity: 1);
    await type(tester, '100000');

    expect(find.textContaining('Không cao hơn giá niêm yết'), findsNothing);
    // Đóng lại là dấu hiệu terms đã đi ra.
    expect(find.text('Đề nghị mức giá khác'), findsNothing);
  });

  testWidgets('trần nhân theo số lượng, vì ô nhập là tổng tiền', (
    tester,
  ) async {
    await pump(tester, askingUnitPrice: 100000, quantity: 3);
    // 250k cho ba cái là dưới trần 300k, dù hơn giá một cái.
    await type(tester, '250000');
    expect(find.textContaining('Không cao hơn giá niêm yết'), findsNothing);

    await pump(tester, askingUnitPrice: 100000, quantity: 3);
    await type(tester, '300001');
    expect(find.textContaining('Không cao hơn giá niêm yết'), findsOneWidget);
  });

  testWidgets('không tra được giá niêm yết thì không chặn gì', (tester) async {
    await pump(tester, askingUnitPrice: null, quantity: 1);
    await type(tester, '999000');

    expect(find.textContaining('Không cao hơn giá niêm yết'), findsNothing);
  });
}
