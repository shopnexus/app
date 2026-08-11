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
    /// Id của resource đã xác nhận. Ảnh và video lên từ lúc người dùng chọn,
    /// nên ở đây không còn byte nào phải chờ — và một tệp hỏng đã tự loại mình
    /// ra khỏi danh sách thay vì làm hỏng cả lượt gửi đánh giá.
    List<String> attachments = const [],
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
