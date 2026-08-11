import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shopnexus_flutter_app/api/generated/api/trust_api.dart';
import 'package:shopnexus_flutter_app/api/generated/model/review.dart';
import 'package:shopnexus_flutter_app/features/account/data/repositories/rating_repository.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/providers/rate_order_provider.dart';

import 'support/uploader.dart';

/// Một đơn sinh ra hai thứ chấm điểm — feedback giao dịch (**kín**, vào uy tín) và
/// review sản phẩm (công khai, vào `cached_rating` của tin). Người dùng thấy một
/// việc, hệ thống ghi hai bản. Test này giữ ba tính chất của cái ghép đó.
class _FakeRatings extends RatingRepository {
  /// Một `TrustApi` trên Dio trần: không method nào ở dưới gọi tới nó, mọi thứ
  /// test dùng đều được override, nên không có request nào rời khỏi tiến trình.
  _FakeRatings({this.failReview = false})
    : super(TrustApi(Dio()), uploaderOn());

  final bool failReview;
  final List<String> calls = [];

  @override
  Future<void> submitFeedback(
    String orderId, {
    required int rating,
    String? comment,
  }) async {
    calls.add('feedback:$rating');
  }

  @override
  Future<Review> submitReview(
    String listingId, {
    required String orderId,
    required int rating,
    String? body,
    List<String>? attachments,
  }) async {
    calls.add('review:$rating:${attachments?.length ?? 0}');
    if (failReview) throw StateError('review refused');
    return Review.fromJson(_reviewJson);
  }

  @override
  Future<String> uploadReviewPhoto(File file, {required String mime}) async {
    calls.add('upload');
    return 'res_1';
  }
}

void main() {
  ProviderContainer containerWith(_FakeRatings fake) {
    final container = ProviderContainer(
      overrides: [ratingRepositoryProvider.overrideWithValue(fake)],
    );
    addTearDown(container.dispose);
    return container;
  }

  test('nửa kín đi trước nửa công khai', () async {
    final fake = _FakeRatings();
    final container = containerWith(fake);

    final ok = await container
        .read(rateOrderProvider.notifier)
        .submit(
          orderId: 'ord_1',
          sellerRating: 5,
          listingId: 'lst_1',
          productRating: 4,
        );

    expect(ok, isTrue);
    // Thứ tự là cố ý: nếu công khai đi trước rồi kín hỏng, người dùng đã công bố
    // một điểm cho tin mà bên kia không nhận được gì — và họ sẽ không mở lại một
    // biểu mẫu đã "gửi xong".
    expect(fake.calls, ['feedback:5', 'review:4:0']);
  });

  test('không chấm sản phẩm thì chỉ gửi nửa kín', () async {
    final fake = _FakeRatings();
    final container = containerWith(fake);

    final ok = await container
        .read(rateOrderProvider.notifier)
        .submit(orderId: 'ord_1', sellerRating: 3, listingId: 'lst_1');

    expect(ok, isTrue);
    // Nửa công khai là tuỳ chọn: một tin hàng cũ độc bản bán một lần nên đánh giá
    // sản phẩm ở đó gần như không ai đọc, còn uy tín người bán thì luôn được đọc.
    expect(fake.calls, ['feedback:3']);
  });

  test('đơn nhiều tin thì không có listingId, nên không hỏi sản phẩm', () async {
    final fake = _FakeRatings();
    final container = containerWith(fake);

    await container
        .read(rateOrderProvider.notifier)
        .submit(orderId: 'ord_1', sellerRating: 4, productRating: 5);

    // productRating có nhưng listingId không: review gắn với một tin, nên thiếu
    // tin thì không gửi thay vì đoán.
    expect(fake.calls, ['feedback:4']);
  });

  test('ảnh được upload trước khi gửi đánh giá sản phẩm', () async {
    final fake = _FakeRatings();
    final container = containerWith(fake);

    await container.read(rateOrderProvider.notifier).submit(
      orderId: 'ord_1',
      sellerRating: 5,
      listingId: 'lst_1',
      productRating: 5,
      photos: [File('a.jpg'), File('b.jpg')],
    );

    expect(fake.calls, ['feedback:5', 'upload', 'upload', 'review:5:2']);
  });

  test('nửa công khai hỏng thì báo hỏng, nhưng nửa kín đã ghi', () async {
    final fake = _FakeRatings(failReview: true);
    final container = containerWith(fake);

    final ok = await container
        .read(rateOrderProvider.notifier)
        .submit(
          orderId: 'ord_1',
          sellerRating: 5,
          listingId: 'lst_1',
          productRating: 4,
        );

    expect(ok, isFalse);
    expect(container.read(rateOrderProvider).errorMessage, isNotNull);
    // Uy tín đã được ghi và không mất — đó chính là điều thứ tự trên bảo vệ.
    expect(fake.calls, ['feedback:5', 'review:4:0']);
  });
}

/// Đúng những field `Review` khai là required — giá trị không được đọc trong test.
/// Nó cũng là một contract check nhỏ: thêm một required mới vào spec thì test này
/// vỡ, đúng lúc phải nhìn lại.
const _reviewJson = {
  'id': 'rvw_1',
  'listing_id': 'lst_1',
  'author': {'id': 'acc_1', 'name': 'Bean', 'avatar': null},
  'rating': 5,
  'body': '',
  'attachments': <Object>[],
  'replies': <Object>[],
  'reply_count': 0,
  'votes': {'helpful': 0, 'not_helpful': 0, 'my_vote': null},
  'created_at': '2026-08-07T00:00:00Z',
  'updated_at': '2026-08-07T00:00:00Z',
};
