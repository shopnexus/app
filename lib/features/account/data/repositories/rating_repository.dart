import 'dart:io';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopnexus_flutter_app/api/api_providers.dart';
import 'package:shopnexus_flutter_app/api/generated/api/trust_api.dart';
import 'package:shopnexus_flutter_app/api/generated/model/create_upload_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/order_feedback.dart';
import 'package:shopnexus_flutter_app/api/generated/model/review.dart';
import 'package:shopnexus_flutter_app/api/generated/model/review_reply.dart';
import 'package:shopnexus_flutter_app/api/generated/model/submit_feedback_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/submit_review_reply_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/submit_review_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/update_review_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/vote_review_request.dart';

part 'rating_repository.g.dart';

/// Một đơn sinh ra **hai** thứ chấm điểm, và một nhà cho cả hai vì người dùng thấy
/// một việc:
///
/// - **Feedback** (`/orders/{id}/feedback`) là đánh giá *giao dịch*: **kín** cho tới
///   khi cả hai bên gửi hoặc hết cửa sổ mù, hai bên chấm nhau, và nó cộng vào uy tín
///   của account. Chiều được suy từ việc người gọi đứng ở phía nào của đơn — không
///   ai gửi nó lên.
/// - **Review** (`/listings/{id}/reviews`) là đánh giá *sản phẩm*: công khai ngay, và
///   nó cộng vào `cached_rating` của tin.
///
/// Server đếm chúng ở hai cặp cột riêng trên cùng một hàng, đúng vì một đơn có thể
/// sinh ra cả hai và cộng chung sẽ tính đơn đó hai lần.
@riverpod
RatingRepository ratingRepository(Ref ref) =>
    RatingRepository(ref.watch(trustApiProvider));

class RatingRepository {
  const RatingRepository(this._trustApi);

  /// Cả hai hệ đều là trust's, kể cả cái treo trên route `/orders/{id}/feedback`:
  /// đơn chỉ là thứ đánh giá đó nói *về*, còn uy tín là của trust.
  final TrustApi _trustApi;

  // --- Đánh giá giao dịch (kín) ---

  /// Cả hai phía của một đơn, cộng `revealAt`. `theirs` là null khi chưa tới lúc mở:
  /// đó là điều làm cho một điểm thấp không thể là đòn đáp trả.
  Future<OrderFeedback> orderFeedback(String orderId) async {
    final response = await _trustApi.ordersOrderIDFeedbackGet(orderID: orderId);
    final data = response.data?.data;
    if (data == null) throw StateError('empty feedback response');
    return data;
  }

  Future<void> submitFeedback(
    String orderId, {
    required int rating,
    String? comment,
  }) => _trustApi.ordersOrderIDFeedbackPost(
    orderID: orderId,
    submitFeedbackRequest: SubmitFeedbackRequest(
      rating: rating,
      comment: comment,
    ),
  );

  // --- Đánh giá sản phẩm (công khai) ---

  /// `orderId` là bằng chứng đã mua: server chỉ nhận đánh giá từ người thật sự
  /// mua tin này, nên nó nằm trong body chứ không phải một thứ client tự chọn.
  Future<Review> submitReview(
    String listingId, {
    required String orderId,
    required int rating,
    String? body,
    List<String>? attachments,
  }) async {
    final response = await _trustApi.listingsListingIDReviewsPost(
      listingID: listingId,
      submitReviewRequest: SubmitReviewRequest(
        orderId: orderId,
        rating: rating,
        body: body,
        attachments: attachments,
      ),
    );
    final review = response.data?.data;
    if (review == null) throw StateError('empty review response');
    return review;
  }

  Future<Review> review(String reviewId) async {
    final response = await _trustApi.reviewsIdGet(id: reviewId);
    final review = response.data?.data;
    if (review == null) throw StateError('empty review response');
    return review;
  }

  /// Sửa cái đã viết. Bỏ trống một field nghĩa là để nguyên — không phải xoá.
  Future<Review> updateReview(
    String reviewId, {
    int? rating,
    String? body,
    List<String>? attachments,
  }) async {
    final response = await _trustApi.reviewsIdPatch(
      id: reviewId,
      updateReviewRequest: UpdateReviewRequest(
        rating: rating,
        body: body,
        attachments: attachments,
      ),
    );
    final review = response.data?.data;
    if (review == null) throw StateError('empty review response');
    return review;
  }

  Future<void> deleteReview(String reviewId) =>
      _trustApi.reviewsIdDelete(id: reviewId);

  /// Trả lời của người bán, một lần cho mỗi đánh giá.
  Future<ReviewReply> replyToReview(String reviewId, String body) async {
    final response = await _trustApi.reviewsIdRepliesPost(
      id: reviewId,
      submitReviewReplyRequest: SubmitReviewReplyRequest(body: body),
    );
    final reply = response.data?.data;
    if (reply == null) throw StateError('empty reply response');
    return reply;
  }

  Future<void> deleteReply(String replyId) =>
      _trustApi.reviewRepliesIdDelete(id: replyId);

  /// Bình chọn hữu ích. `PUT` là đặt lại chứ không phải cộng thêm, nên bấm hai lần
  /// cùng một phía không đếm hai.
  Future<void> voteReview(String reviewId, {required bool helpful}) =>
      _trustApi.reviewsIdVotePut(
        id: reviewId,
        voteReviewRequest: VoteReviewRequest(
          // Enum của contract là số: +1 hữu ích, -1 không. Tên Dart sinh ra khó đọc
          // nên chỗ này là chỗ duy nhất trong app phải biết chúng.
          vote: helpful
              ? VoteReviewRequestVoteEnum.number1
              : VoteReviewRequestVoteEnum.numberNegative1,
        ),
      );

  Future<void> clearVote(String reviewId) =>
      _trustApi.reviewsIdVoteDelete(id: reviewId);

  /// Ảnh kèm đánh giá. Ba bước như mọi upload khác trong app: giữ chỗ, PUT bằng
  /// Dio trần (URL đã ký là origin của nhà lưu trữ, không được mang bearer của
  /// sàn), rồi xác nhận — trước khi xác nhận thì resource không resolve ra gì.
  Future<String> uploadReviewPhoto(File file, {required String mime}) async {
    final size = await file.length();
    final reserved = (await _trustApi.reviewsUploadsPost(
      createUploadRequest: CreateUploadRequest(
        filename: file.uri.pathSegments.last,
        mime: mime,
        size: size,
      ),
    )).data?.data;
    if (reserved == null) throw StateError('empty upload slot');

    await Dio().put<void>(
      reserved.url,
      data: file.openRead(),
      options: Options(
        headers: {
          ...reserved.headers,
          Headers.contentLengthHeader: size,
        },
        contentType: mime,
      ),
    );

    await _trustApi.reviewsUploadsIdConfirmationPost(id: reserved.resourceId);
    return reserved.resourceId;
  }
}
