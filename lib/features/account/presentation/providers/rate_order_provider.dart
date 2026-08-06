import 'dart:io';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopnexus_flutter_app/features/account/data/repositories/rating_repository.dart';

part 'rate_order_provider.g.dart';

/// Gửi cả hai nửa của một lần chấm điểm, theo thứ tự **kín trước, công khai sau**.
///
/// Thứ tự đó là cố ý. Đánh giá giao dịch là thứ cộng vào uy tín và là thứ mù — nếu
/// nửa công khai đi trước rồi nửa kín hỏng, người dùng đã công bố một điểm cho tin
/// mà bên kia không nhận được gì, và họ sẽ không mở lại biểu mẫu đã "gửi xong".
///
/// Nửa công khai là **tuỳ chọn**: một tin hàng cũ độc bản bán một lần, nên đánh giá
/// sản phẩm ở đó gần như không có ai đọc — còn uy tín người bán thì luôn được đọc.
/// Bắt buộc cả hai là bắt người ta viết một thứ vô ích để làm xong một thứ hữu ích.
@Riverpod(keepAlive: true)
class RateOrder extends _$RateOrder {
  @override
  RateOrderState build() => const RateOrderState();

  Future<bool> submit({
    required String orderId,
    required int sellerRating,
    String? sellerComment,
    String? listingId,
    int? productRating,
    String? productBody,
    List<File> photos = const [],
  }) async {
    state = const RateOrderState(isLoading: true);
    final repository = ref.read(ratingRepositoryProvider);
    try {
      await repository.submitFeedback(
        orderId,
        rating: sellerRating,
        comment: sellerComment,
      );

      if (listingId != null && productRating != null) {
        final attachments = <String>[];
        for (final photo in photos) {
          attachments.add(
            await repository.uploadReviewPhoto(photo, mime: 'image/jpeg'),
          );
        }
        await repository.submitReview(
          listingId,
          orderId: orderId,
          rating: productRating,
          body: productBody,
          attachments: attachments.isEmpty ? null : attachments,
        );
      }
      state = const RateOrderState();
      return true;
    } catch (error) {
      state = RateOrderState(errorMessage: error.toString());
      return false;
    }
  }
}

class RateOrderState {
  const RateOrderState({this.isLoading = false, this.errorMessage});

  final bool isLoading;
  final String? errorMessage;
}
