//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

/// What was raised. The five `report-*` kinds and `refund-dispute`/`order-issue` are about something and carry a `ref_id`; the rest are about nothing in particular. 
enum TicketKind {
          /// What was raised. The five `report-*` kinds and `refund-dispute`/`order-issue` are about something and carry a `ref_id`; the rest are about nothing in particular. 
      @JsonValue(r'report-listing')
      reportListing(r'report-listing'),
          /// What was raised. The five `report-*` kinds and `refund-dispute`/`order-issue` are about something and carry a `ref_id`; the rest are about nothing in particular. 
      @JsonValue(r'report-account')
      reportAccount(r'report-account'),
          /// What was raised. The five `report-*` kinds and `refund-dispute`/`order-issue` are about something and carry a `ref_id`; the rest are about nothing in particular. 
      @JsonValue(r'report-message')
      reportMessage(r'report-message'),
          /// What was raised. The five `report-*` kinds and `refund-dispute`/`order-issue` are about something and carry a `ref_id`; the rest are about nothing in particular. 
      @JsonValue(r'report-review')
      reportReview(r'report-review'),
          /// What was raised. The five `report-*` kinds and `refund-dispute`/`order-issue` are about something and carry a `ref_id`; the rest are about nothing in particular. 
      @JsonValue(r'report-review-reply')
      reportReviewReply(r'report-review-reply'),
          /// What was raised. The five `report-*` kinds and `refund-dispute`/`order-issue` are about something and carry a `ref_id`; the rest are about nothing in particular. 
      @JsonValue(r'refund-dispute')
      refundDispute(r'refund-dispute'),
          /// What was raised. The five `report-*` kinds and `refund-dispute`/`order-issue` are about something and carry a `ref_id`; the rest are about nothing in particular. 
      @JsonValue(r'order-issue')
      orderIssue(r'order-issue'),
          /// What was raised. The five `report-*` kinds and `refund-dispute`/`order-issue` are about something and carry a `ref_id`; the rest are about nothing in particular. 
      @JsonValue(r'payment')
      payment(r'payment'),
          /// What was raised. The five `report-*` kinds and `refund-dispute`/`order-issue` are about something and carry a `ref_id`; the rest are about nothing in particular. 
      @JsonValue(r'account')
      account(r'account'),
          /// What was raised. The five `report-*` kinds and `refund-dispute`/`order-issue` are about something and carry a `ref_id`; the rest are about nothing in particular. 
      @JsonValue(r'feature-request')
      featureRequest(r'feature-request'),
          /// What was raised. The five `report-*` kinds and `refund-dispute`/`order-issue` are about something and carry a `ref_id`; the rest are about nothing in particular. 
      @JsonValue(r'other')
      other(r'other');

  const TicketKind(this.value);

  final String value;

  @override
  String toString() => value;
}
