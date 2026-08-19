import 'package:shopnexus_flutter_app/api/generated/model/account_create_upload_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/account_summary.dart';
import 'package:shopnexus_flutter_app/api/generated/model/account_summary_page.dart';
import 'package:shopnexus_flutter_app/api/generated/model/accounts_account_id_reputation_get200_response.dart';
import 'package:shopnexus_flutter_app/api/generated/model/accounts_id_get200_response.dart';
import 'package:shopnexus_flutter_app/api/generated/model/add_attachments_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/add_cart_item_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/admin_account.dart';
import 'package:shopnexus_flutter_app/api/generated/model/admin_account_page.dart';
import 'package:shopnexus_flutter_app/api/generated/model/admin_accounts_id_suspension_post200_response.dart';
import 'package:shopnexus_flutter_app/api/generated/model/admin_categories_post201_response.dart';
import 'package:shopnexus_flutter_app/api/generated/model/admin_identity_document.dart';
import 'package:shopnexus_flutter_app/api/generated/model/admin_identity_documents_id_verdict_post200_response.dart';
import 'package:shopnexus_flutter_app/api/generated/model/admin_listings_id_approval_post200_response.dart';
import 'package:shopnexus_flutter_app/api/generated/model/admin_options_get200_response.dart';
import 'package:shopnexus_flutter_app/api/generated/model/admin_options_id_patch200_response.dart';
import 'package:shopnexus_flutter_app/api/generated/model/admin_refunds_id_verdict_post200_response.dart';
import 'package:shopnexus_flutter_app/api/generated/model/admin_tags_slug_put200_response.dart';
import 'package:shopnexus_flutter_app/api/generated/model/admin_tax_info_account_id_verification_post200_response.dart';
import 'package:shopnexus_flutter_app/api/generated/model/admin_ticket.dart';
import 'package:shopnexus_flutter_app/api/generated/model/admin_ticket_page.dart';
import 'package:shopnexus_flutter_app/api/generated/model/admin_tickets_id_claim_post200_response.dart';
import 'package:shopnexus_flutter_app/api/generated/model/admin_tickets_id_get200_response.dart';
import 'package:shopnexus_flutter_app/api/generated/model/admin_wallets_account_id_adjustments_post200_response.dart';
import 'package:shopnexus_flutter_app/api/generated/model/admin_withdrawals_id_approval_post200_response.dart';
import 'package:shopnexus_flutter_app/api/generated/model/administrative_area.dart';
import 'package:shopnexus_flutter_app/api/generated/model/administrative_area_list.dart';
import 'package:shopnexus_flutter_app/api/generated/model/auth_result.dart';
import 'package:shopnexus_flutter_app/api/generated/model/bank_account.dart';
import 'package:shopnexus_flutter_app/api/generated/model/bank_account_list.dart';
import 'package:shopnexus_flutter_app/api/generated/model/bank_accounts_post201_response.dart';
import 'package:shopnexus_flutter_app/api/generated/model/cart_item.dart';
import 'package:shopnexus_flutter_app/api/generated/model/cart_items_get200_response.dart';
import 'package:shopnexus_flutter_app/api/generated/model/cart_items_post201_response.dart';
import 'package:shopnexus_flutter_app/api/generated/model/category.dart';
import 'package:shopnexus_flutter_app/api/generated/model/category_list.dart';
import 'package:shopnexus_flutter_app/api/generated/model/change_password_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/chat_unread_count.dart';
import 'package:shopnexus_flutter_app/api/generated/model/checkout_line.dart';
import 'package:shopnexus_flutter_app/api/generated/model/checkout_offer_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/checkout_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/checkout_result.dart';
import 'package:shopnexus_flutter_app/api/generated/model/confirm_receipt_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/contact.dart';
import 'package:shopnexus_flutter_app/api/generated/model/contact_list.dart';
import 'package:shopnexus_flutter_app/api/generated/model/contacts_post201_response.dart';
import 'package:shopnexus_flutter_app/api/generated/model/conversation.dart';
import 'package:shopnexus_flutter_app/api/generated/model/conversation_page.dart';
import 'package:shopnexus_flutter_app/api/generated/model/conversation_read_mark.dart';
import 'package:shopnexus_flutter_app/api/generated/model/conversations_id_messages_post201_response.dart';
import 'package:shopnexus_flutter_app/api/generated/model/conversations_post200_response.dart';
import 'package:shopnexus_flutter_app/api/generated/model/conversations_unread_count_get200_response.dart';
import 'package:shopnexus_flutter_app/api/generated/model/conversations_uploads_id_confirmation_post200_response.dart';
import 'package:shopnexus_flutter_app/api/generated/model/conversations_uploads_post201_response.dart';
import 'package:shopnexus_flutter_app/api/generated/model/create_bank_account_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/create_category_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/create_contact_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/create_draft_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/create_listing_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/create_moderator_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/create_offer_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/create_refund_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/create_upload_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/create_variant_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/create_web_socket_ticket201_response.dart';
import 'package:shopnexus_flutter_app/api/generated/model/create_withdrawal_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/cursor_meta.dart';
import 'package:shopnexus_flutter_app/api/generated/model/decline_order_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/deleted_message_ref.dart';
import 'package:shopnexus_flutter_app/api/generated/model/device.dart';
import 'package:shopnexus_flutter_app/api/generated/model/device_list.dart';
import 'package:shopnexus_flutter_app/api/generated/model/devices_put200_response.dart';
import 'package:shopnexus_flutter_app/api/generated/model/draft_order.dart';
import 'package:shopnexus_flutter_app/api/generated/model/draft_order_page.dart';
import 'package:shopnexus_flutter_app/api/generated/model/draft_variant_snapshot.dart';
import 'package:shopnexus_flutter_app/api/generated/model/drafts_id_checkout_post201_response.dart';
import 'package:shopnexus_flutter_app/api/generated/model/drafts_post201_response.dart';
import 'package:shopnexus_flutter_app/api/generated/model/email_verification_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/error.dart';
import 'package:shopnexus_flutter_app/api/generated/model/error_error.dart';
import 'package:shopnexus_flutter_app/api/generated/model/error_field.dart';
import 'package:shopnexus_flutter_app/api/generated/model/feedback.dart';
import 'package:shopnexus_flutter_app/api/generated/model/feedback_page.dart';
import 'package:shopnexus_flutter_app/api/generated/model/identity_document.dart';
import 'package:shopnexus_flutter_app/api/generated/model/identity_document_list.dart';
import 'package:shopnexus_flutter_app/api/generated/model/identity_document_page.dart';
import 'package:shopnexus_flutter_app/api/generated/model/identity_documents_post201_response.dart';
import 'package:shopnexus_flutter_app/api/generated/model/identity_scans.dart';
import 'package:shopnexus_flutter_app/api/generated/model/identity_verdict_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/identity_verification_ticket.dart';
import 'package:shopnexus_flutter_app/api/generated/model/items_id_cancellation_post200_response.dart';
import 'package:shopnexus_flutter_app/api/generated/model/listing.dart';
import 'package:shopnexus_flutter_app/api/generated/model/listing_detail.dart';
import 'package:shopnexus_flutter_app/api/generated/model/listing_location.dart';
import 'package:shopnexus_flutter_app/api/generated/model/listing_page.dart';
import 'package:shopnexus_flutter_app/api/generated/model/listing_suggestion.dart';
import 'package:shopnexus_flutter_app/api/generated/model/listings_interactions_post_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/listings_interactions_post_request_interactions_inner.dart';
import 'package:shopnexus_flutter_app/api/generated/model/listings_listing_id_reviews_post201_response.dart';
import 'package:shopnexus_flutter_app/api/generated/model/listings_suggestions_post200_response.dart';
import 'package:shopnexus_flutter_app/api/generated/model/login_post200_response.dart';
import 'package:shopnexus_flutter_app/api/generated/model/login_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/logout_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/mark_conversation_read_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/mark_notifications_read_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/me.dart';
import 'package:shopnexus_flutter_app/api/generated/model/me_get200_response.dart';
import 'package:shopnexus_flutter_app/api/generated/model/me_profile_patch200_response.dart';
import 'package:shopnexus_flutter_app/api/generated/model/message.dart';
import 'package:shopnexus_flutter_app/api/generated/model/message_page.dart';
import 'package:shopnexus_flutter_app/api/generated/model/moderation_note_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/money_by_currency.dart';
import 'package:shopnexus_flutter_app/api/generated/model/notification.dart';
import 'package:shopnexus_flutter_app/api/generated/model/notification_page.dart';
import 'package:shopnexus_flutter_app/api/generated/model/notification_preference.dart';
import 'package:shopnexus_flutter_app/api/generated/model/notification_preference_list.dart';
import 'package:shopnexus_flutter_app/api/generated/model/notifications_read_post200_response.dart';
import 'package:shopnexus_flutter_app/api/generated/model/o_auth_identity.dart';
import 'package:shopnexus_flutter_app/api/generated/model/o_auth_identity_list.dart';
import 'package:shopnexus_flutter_app/api/generated/model/o_auth_login_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/offer.dart';
import 'package:shopnexus_flutter_app/api/generated/model/offer_listing.dart';
import 'package:shopnexus_flutter_app/api/generated/model/offer_page.dart';
import 'package:shopnexus_flutter_app/api/generated/model/offers_post201_response.dart';
import 'package:shopnexus_flutter_app/api/generated/model/open_ticket_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/option.dart';
import 'package:shopnexus_flutter_app/api/generated/model/option_list.dart';
import 'package:shopnexus_flutter_app/api/generated/model/order.dart';
import 'package:shopnexus_flutter_app/api/generated/model/order_address_snapshot.dart';
import 'package:shopnexus_flutter_app/api/generated/model/order_feedback.dart';
import 'package:shopnexus_flutter_app/api/generated/model/order_item.dart';
import 'package:shopnexus_flutter_app/api/generated/model/order_item_page.dart';
import 'package:shopnexus_flutter_app/api/generated/model/order_page.dart';
import 'package:shopnexus_flutter_app/api/generated/model/order_ref.dart';
import 'package:shopnexus_flutter_app/api/generated/model/order_summary.dart';
import 'package:shopnexus_flutter_app/api/generated/model/order_summary_day.dart';
import 'package:shopnexus_flutter_app/api/generated/model/orders_id_get200_response.dart';
import 'package:shopnexus_flutter_app/api/generated/model/orders_id_transport_get200_response.dart';
import 'package:shopnexus_flutter_app/api/generated/model/orders_order_id_feedback_get200_response.dart';
import 'package:shopnexus_flutter_app/api/generated/model/orders_order_id_feedback_post201_response.dart';
import 'package:shopnexus_flutter_app/api/generated/model/orders_summary_get200_response.dart';
import 'package:shopnexus_flutter_app/api/generated/model/page_meta.dart';
import 'package:shopnexus_flutter_app/api/generated/model/password_reset_confirm_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/password_reset_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/payment_session.dart';
import 'package:shopnexus_flutter_app/api/generated/model/payment_session_page.dart';
import 'package:shopnexus_flutter_app/api/generated/model/payment_sessions_id_get200_response.dart';
import 'package:shopnexus_flutter_app/api/generated/model/payment_sessions_id_payments_post201_response.dart';
import 'package:shopnexus_flutter_app/api/generated/model/pending_edit.dart';
import 'package:shopnexus_flutter_app/api/generated/model/profile.dart';
import 'package:shopnexus_flutter_app/api/generated/model/public_account.dart';
import 'package:shopnexus_flutter_app/api/generated/model/publish_listing_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/put_tag_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/refresh_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/refund.dart';
import 'package:shopnexus_flutter_app/api/generated/model/refund_page.dart';
import 'package:shopnexus_flutter_app/api/generated/model/refund_summary.dart';
import 'package:shopnexus_flutter_app/api/generated/model/refund_verdict_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/register_device_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/register_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/reputation.dart';
import 'package:shopnexus_flutter_app/api/generated/model/resolve_ticket_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/resource.dart';
import 'package:shopnexus_flutter_app/api/generated/model/review.dart';
import 'package:shopnexus_flutter_app/api/generated/model/review_page.dart';
import 'package:shopnexus_flutter_app/api/generated/model/review_reply.dart';
import 'package:shopnexus_flutter_app/api/generated/model/review_vote_tally.dart';
import 'package:shopnexus_flutter_app/api/generated/model/reviews_id_replies_post201_response.dart';
import 'package:shopnexus_flutter_app/api/generated/model/reviews_id_vote_put200_response.dart';
import 'package:shopnexus_flutter_app/api/generated/model/save_option_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/send_message_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/shipping_quote.dart';
import 'package:shopnexus_flutter_app/api/generated/model/shipping_quotes.dart';
import 'package:shopnexus_flutter_app/api/generated/model/shipping_quotes_post200_response.dart';
import 'package:shopnexus_flutter_app/api/generated/model/shipping_quotes_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/start_conversation_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/start_identity_verification_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/start_payment_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/stock.dart';
import 'package:shopnexus_flutter_app/api/generated/model/submit_feedback_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/submit_review_reply_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/submit_review_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/suggest_listing_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/suspend_account_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/tag.dart';
import 'package:shopnexus_flutter_app/api/generated/model/tag_page.dart';
import 'package:shopnexus_flutter_app/api/generated/model/takedown_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/tax_info.dart';
import 'package:shopnexus_flutter_app/api/generated/model/tax_verification_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/ticket.dart';
import 'package:shopnexus_flutter_app/api/generated/model/ticket_page.dart';
import 'package:shopnexus_flutter_app/api/generated/model/transaction.dart';
import 'package:shopnexus_flutter_app/api/generated/model/transaction_list.dart';
import 'package:shopnexus_flutter_app/api/generated/model/transport.dart';
import 'package:shopnexus_flutter_app/api/generated/model/transport_checkpoint_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/unread_count.dart';
import 'package:shopnexus_flutter_app/api/generated/model/update_account_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/update_bank_account_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/update_cart_item_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/update_category_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/update_contact_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/update_listing_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/update_message_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/update_notification_preferences_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/update_notification_preferences_request_items_inner.dart';
import 'package:shopnexus_flutter_app/api/generated/model/update_offer_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/update_profile_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/update_review_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/update_variant_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/upload_slot.dart';
import 'package:shopnexus_flutter_app/api/generated/model/upsert_tax_info_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/variant.dart';
import 'package:shopnexus_flutter_app/api/generated/model/verify_contact_phone_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/vote_review_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/wallet.dart';
import 'package:shopnexus_flutter_app/api/generated/model/wallet_adjustment_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/wallet_list.dart';
import 'package:shopnexus_flutter_app/api/generated/model/wallet_transaction.dart';
import 'package:shopnexus_flutter_app/api/generated/model/wallet_transaction_page.dart';
import 'package:shopnexus_flutter_app/api/generated/model/web_socket_ticket.dart';
import 'package:shopnexus_flutter_app/api/generated/model/withdrawal.dart';
import 'package:shopnexus_flutter_app/api/generated/model/withdrawal_approval_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/withdrawal_page.dart';
import 'package:shopnexus_flutter_app/api/generated/model/withdrawal_rejection_request.dart';

final _regList = RegExp(r'^List<(.*)>$');
final _regSet = RegExp(r'^Set<(.*)>$');
final _regMap = RegExp(r'^Map<String,(.*)>$');

ReturnType deserialize<ReturnType, BaseType>(
  dynamic value,
  String targetType, {
  bool growable = true,
}) {
  switch (targetType) {
    case 'int':
      return (value is int ? value : int.parse('$value')) as ReturnType;
    case 'bool':
      if (value is bool) {
        return value as ReturnType;
      }
      final valueString = '$value'.toLowerCase();
      return (valueString == 'true' || valueString == '1') as ReturnType;
    case 'double':
      return (value is double ? value : double.parse('$value')) as ReturnType;
    case 'AccountCreateUploadRequest':
      return AccountCreateUploadRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'AccountRole':
    case 'AccountStatus':
    case 'AccountSummary':
      return AccountSummary.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'AccountSummaryPage':
      return AccountSummaryPage.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'AccountsAccountIDReputationGet200Response':
      return AccountsAccountIDReputationGet200Response.fromJson(
            value as Map<String, dynamic>,
          )
          as ReturnType;
    case 'AccountsIdGet200Response':
      return AccountsIdGet200Response.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'AddAttachmentsRequest':
      return AddAttachmentsRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'AddCartItemRequest':
      return AddCartItemRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'AdminAccount':
      return AdminAccount.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'AdminAccountPage':
      return AdminAccountPage.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'AdminAccountsIdSuspensionPost200Response':
      return AdminAccountsIdSuspensionPost200Response.fromJson(
            value as Map<String, dynamic>,
          )
          as ReturnType;
    case 'AdminCategoriesPost201Response':
      return AdminCategoriesPost201Response.fromJson(
            value as Map<String, dynamic>,
          )
          as ReturnType;
    case 'AdminIdentityDocument':
      return AdminIdentityDocument.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'AdminIdentityDocumentsIdVerdictPost200Response':
      return AdminIdentityDocumentsIdVerdictPost200Response.fromJson(
            value as Map<String, dynamic>,
          )
          as ReturnType;
    case 'AdminListingsIdApprovalPost200Response':
      return AdminListingsIdApprovalPost200Response.fromJson(
            value as Map<String, dynamic>,
          )
          as ReturnType;
    case 'AdminOptionsGet200Response':
      return AdminOptionsGet200Response.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'AdminOptionsIdPatch200Response':
      return AdminOptionsIdPatch200Response.fromJson(
            value as Map<String, dynamic>,
          )
          as ReturnType;
    case 'AdminRefundsIdVerdictPost200Response':
      return AdminRefundsIdVerdictPost200Response.fromJson(
            value as Map<String, dynamic>,
          )
          as ReturnType;
    case 'AdminTagsSlugPut200Response':
      return AdminTagsSlugPut200Response.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'AdminTaxInfoAccountIDVerificationPost200Response':
      return AdminTaxInfoAccountIDVerificationPost200Response.fromJson(
            value as Map<String, dynamic>,
          )
          as ReturnType;
    case 'AdminTicket':
      return AdminTicket.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'AdminTicketPage':
      return AdminTicketPage.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'AdminTicketsIdClaimPost200Response':
      return AdminTicketsIdClaimPost200Response.fromJson(
            value as Map<String, dynamic>,
          )
          as ReturnType;
    case 'AdminTicketsIdGet200Response':
      return AdminTicketsIdGet200Response.fromJson(
            value as Map<String, dynamic>,
          )
          as ReturnType;
    case 'AdminWalletsAccountIDAdjustmentsPost200Response':
      return AdminWalletsAccountIDAdjustmentsPost200Response.fromJson(
            value as Map<String, dynamic>,
          )
          as ReturnType;
    case 'AdminWithdrawalsIdApprovalPost200Response':
      return AdminWithdrawalsIdApprovalPost200Response.fromJson(
            value as Map<String, dynamic>,
          )
          as ReturnType;
    case 'AdministrativeArea':
      return AdministrativeArea.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'AdministrativeAreaList':
      return AdministrativeAreaList.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'AuthResult':
      return AuthResult.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'BankAccount':
      return BankAccount.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'BankAccountList':
      return BankAccountList.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'BankAccountsPost201Response':
      return BankAccountsPost201Response.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'CartItem':
      return CartItem.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'CartItemsGet200Response':
      return CartItemsGet200Response.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'CartItemsPost201Response':
      return CartItemsPost201Response.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'Category':
      return Category.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'CategoryList':
      return CategoryList.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'ChangePasswordRequest':
      return ChangePasswordRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'ChatUnreadCount':
      return ChatUnreadCount.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'CheckoutLine':
      return CheckoutLine.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'CheckoutOfferRequest':
      return CheckoutOfferRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'CheckoutRequest':
      return CheckoutRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'CheckoutResult':
      return CheckoutResult.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'ConfirmReceiptRequest':
      return ConfirmReceiptRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'Contact':
      return Contact.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'ContactAddressType':
    case 'ContactList':
      return ContactList.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'ContactsPost201Response':
      return ContactsPost201Response.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'Conversation':
      return Conversation.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'ConversationPage':
      return ConversationPage.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'ConversationReadMark':
      return ConversationReadMark.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'ConversationsIdMessagesPost201Response':
      return ConversationsIdMessagesPost201Response.fromJson(
            value as Map<String, dynamic>,
          )
          as ReturnType;
    case 'ConversationsPost200Response':
      return ConversationsPost200Response.fromJson(
            value as Map<String, dynamic>,
          )
          as ReturnType;
    case 'ConversationsUnreadCountGet200Response':
      return ConversationsUnreadCountGet200Response.fromJson(
            value as Map<String, dynamic>,
          )
          as ReturnType;
    case 'ConversationsUploadsIdConfirmationPost200Response':
      return ConversationsUploadsIdConfirmationPost200Response.fromJson(
            value as Map<String, dynamic>,
          )
          as ReturnType;
    case 'ConversationsUploadsPost201Response':
      return ConversationsUploadsPost201Response.fromJson(
            value as Map<String, dynamic>,
          )
          as ReturnType;
    case 'CreateBankAccountRequest':
      return CreateBankAccountRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'CreateCategoryRequest':
      return CreateCategoryRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'CreateContactRequest':
      return CreateContactRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'CreateDraftRequest':
      return CreateDraftRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'CreateListingRequest':
      return CreateListingRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'CreateModeratorRequest':
      return CreateModeratorRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'CreateOfferRequest':
      return CreateOfferRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'CreateRefundRequest':
      return CreateRefundRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'CreateUploadRequest':
      return CreateUploadRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'CreateVariantRequest':
      return CreateVariantRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'CreateWebSocketTicket201Response':
      return CreateWebSocketTicket201Response.fromJson(
            value as Map<String, dynamic>,
          )
          as ReturnType;
    case 'CreateWithdrawalRequest':
      return CreateWithdrawalRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'CursorMeta':
      return CursorMeta.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'DeclineOrderRequest':
      return DeclineOrderRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'DeletedMessageRef':
      return DeletedMessageRef.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'Device':
      return Device.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'DeviceList':
      return DeviceList.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'DevicePlatform':
    case 'DevicesPut200Response':
      return DevicesPut200Response.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'DraftOrder':
      return DraftOrder.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'DraftOrderPage':
      return DraftOrderPage.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'DraftVariantSnapshot':
      return DraftVariantSnapshot.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'DraftsIdCheckoutPost201Response':
      return DraftsIdCheckoutPost201Response.fromJson(
            value as Map<String, dynamic>,
          )
          as ReturnType;
    case 'DraftsPost201Response':
      return DraftsPost201Response.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'EmailVerificationRequest':
      return EmailVerificationRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'Error':
      return Error.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'ErrorError':
      return ErrorError.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'ErrorField':
      return ErrorField.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'Feedback':
      return Feedback.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'FeedbackDirection':
    case 'FeedbackPage':
      return FeedbackPage.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'IdentityDocument':
      return IdentityDocument.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'IdentityDocumentList':
      return IdentityDocumentList.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'IdentityDocumentPage':
      return IdentityDocumentPage.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'IdentityDocumentType':
    case 'IdentityDocumentsPost201Response':
      return IdentityDocumentsPost201Response.fromJson(
            value as Map<String, dynamic>,
          )
          as ReturnType;
    case 'IdentityScans':
      return IdentityScans.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'IdentityStatus':
    case 'IdentityVerdictRequest':
      return IdentityVerdictRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'IdentityVerificationTicket':
      return IdentityVerificationTicket.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'ItemsIdCancellationPost200Response':
      return ItemsIdCancellationPost200Response.fromJson(
            value as Map<String, dynamic>,
          )
          as ReturnType;
    case 'Listing':
      return Listing.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'ListingCondition':
    case 'ListingDetail':
      return ListingDetail.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'ListingLocation':
      return ListingLocation.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'ListingPage':
      return ListingPage.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'ListingStatus':
    case 'ListingSuggestion':
      return ListingSuggestion.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'ListingsInteractionsPostRequest':
      return ListingsInteractionsPostRequest.fromJson(
            value as Map<String, dynamic>,
          )
          as ReturnType;
    case 'ListingsInteractionsPostRequestInteractionsInner':
      return ListingsInteractionsPostRequestInteractionsInner.fromJson(
            value as Map<String, dynamic>,
          )
          as ReturnType;
    case 'ListingsListingIDReviewsPost201Response':
      return ListingsListingIDReviewsPost201Response.fromJson(
            value as Map<String, dynamic>,
          )
          as ReturnType;
    case 'ListingsSuggestionsPost200Response':
      return ListingsSuggestionsPost200Response.fromJson(
            value as Map<String, dynamic>,
          )
          as ReturnType;
    case 'LoginPost200Response':
      return LoginPost200Response.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'LoginRequest':
      return LoginRequest.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'LogoutRequest':
      return LogoutRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'MarkConversationReadRequest':
      return MarkConversationReadRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'MarkNotificationsReadRequest':
      return MarkNotificationsReadRequest.fromJson(
            value as Map<String, dynamic>,
          )
          as ReturnType;
    case 'Me':
      return Me.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'MeGet200Response':
      return MeGet200Response.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'MeProfilePatch200Response':
      return MeProfilePatch200Response.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'Message':
      return Message.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'MessagePage':
      return MessagePage.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'MessageType':
    case 'ModerationNoteRequest':
      return ModerationNoteRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'MoneyByCurrency':
      return MoneyByCurrency.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'Notification':
      return Notification.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'NotificationCategory':
    case 'NotificationChannel':
    case 'NotificationPage':
      return NotificationPage.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'NotificationPreference':
      return NotificationPreference.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'NotificationPreferenceList':
      return NotificationPreferenceList.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'NotificationsReadPost200Response':
      return NotificationsReadPost200Response.fromJson(
            value as Map<String, dynamic>,
          )
          as ReturnType;
    case 'OAuthIdentity':
      return OAuthIdentity.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'OAuthIdentityList':
      return OAuthIdentityList.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'OAuthLoginRequest':
      return OAuthLoginRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'Offer':
      return Offer.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'OfferListing':
      return OfferListing.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'OfferPage':
      return OfferPage.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'OfferStatus':
    case 'OffersPost201Response':
      return OffersPost201Response.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'OpenTicketRequest':
      return OpenTicketRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'Option':
      return Option.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'OptionCategoryName':
    case 'OptionList':
      return OptionList.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'Order':
      return Order.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'OrderAddressSnapshot':
      return OrderAddressSnapshot.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'OrderFeedback':
      return OrderFeedback.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'OrderItem':
      return OrderItem.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'OrderItemPage':
      return OrderItemPage.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'OrderPage':
      return OrderPage.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'OrderRef':
      return OrderRef.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'OrderState':
    case 'OrderSummary':
      return OrderSummary.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'OrderSummaryDay':
      return OrderSummaryDay.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'OrdersIdGet200Response':
      return OrdersIdGet200Response.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'OrdersIdTransportGet200Response':
      return OrdersIdTransportGet200Response.fromJson(
            value as Map<String, dynamic>,
          )
          as ReturnType;
    case 'OrdersOrderIDFeedbackGet200Response':
      return OrdersOrderIDFeedbackGet200Response.fromJson(
            value as Map<String, dynamic>,
          )
          as ReturnType;
    case 'OrdersOrderIDFeedbackPost201Response':
      return OrdersOrderIDFeedbackPost201Response.fromJson(
            value as Map<String, dynamic>,
          )
          as ReturnType;
    case 'OrdersSummaryGet200Response':
      return OrdersSummaryGet200Response.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'PageMeta':
      return PageMeta.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'PasswordResetConfirmRequest':
      return PasswordResetConfirmRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'PasswordResetRequest':
      return PasswordResetRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'PaymentSession':
      return PaymentSession.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'PaymentSessionKind':
    case 'PaymentSessionPage':
      return PaymentSessionPage.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'PaymentSessionStatus':
    case 'PaymentSessionsIdGet200Response':
      return PaymentSessionsIdGet200Response.fromJson(
            value as Map<String, dynamic>,
          )
          as ReturnType;
    case 'PaymentSessionsIdPaymentsPost201Response':
      return PaymentSessionsIdPaymentsPost201Response.fromJson(
            value as Map<String, dynamic>,
          )
          as ReturnType;
    case 'PendingEdit':
      return PendingEdit.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'PriceMode':
    case 'Profile':
      return Profile.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'ProfileGender':
    case 'PublicAccount':
      return PublicAccount.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'PublishListingRequest':
      return PublishListingRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'PutTagRequest':
      return PutTagRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'RefreshRequest':
      return RefreshRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'Refund':
      return Refund.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'RefundPage':
      return RefundPage.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'RefundStatus':
    case 'RefundSummary':
      return RefundSummary.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'RefundVerdictRequest':
      return RefundVerdictRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'RegisterDeviceRequest':
      return RegisterDeviceRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'RegisterRequest':
      return RegisterRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'Reputation':
      return Reputation.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'ReputationRole':
    case 'ResolveTicketRequest':
      return ResolveTicketRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'Resource':
      return Resource.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'Review':
      return Review.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'ReviewPage':
      return ReviewPage.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'ReviewReply':
      return ReviewReply.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'ReviewVoteTally':
      return ReviewVoteTally.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'ReviewsIdRepliesPost201Response':
      return ReviewsIdRepliesPost201Response.fromJson(
            value as Map<String, dynamic>,
          )
          as ReturnType;
    case 'ReviewsIdVotePut200Response':
      return ReviewsIdVotePut200Response.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'SaveOptionRequest':
      return SaveOptionRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'SendMessageRequest':
      return SendMessageRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'ShippingQuote':
      return ShippingQuote.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'ShippingQuotes':
      return ShippingQuotes.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'ShippingQuotesPost200Response':
      return ShippingQuotesPost200Response.fromJson(
            value as Map<String, dynamic>,
          )
          as ReturnType;
    case 'ShippingQuotesRequest':
      return ShippingQuotesRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'StartConversationRequest':
      return StartConversationRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'StartIdentityVerificationRequest':
      return StartIdentityVerificationRequest.fromJson(
            value as Map<String, dynamic>,
          )
          as ReturnType;
    case 'StartPaymentRequest':
      return StartPaymentRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'Stock':
      return Stock.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'SubmitFeedbackRequest':
      return SubmitFeedbackRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'SubmitReviewReplyRequest':
      return SubmitReviewReplyRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'SubmitReviewRequest':
      return SubmitReviewRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'SuggestListingRequest':
      return SuggestListingRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'SuspendAccountRequest':
      return SuspendAccountRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'Tag':
      return Tag.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'TagPage':
      return TagPage.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'TakedownRequest':
      return TakedownRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'TaxCodeType':
    case 'TaxInfo':
      return TaxInfo.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'TaxVerificationRequest':
      return TaxVerificationRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'TaxVerificationStatus':
    case 'Ticket':
      return Ticket.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'TicketAction':
    case 'TicketKind':
    case 'TicketPage':
      return TicketPage.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'TicketReason':
    case 'TicketRefType':
    case 'TicketResolutionAction':
    case 'TicketStatus':
    case 'Transaction':
      return Transaction.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'TransactionList':
      return TransactionList.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'TransactionStatus':
    case 'Transport':
      return Transport.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'TransportCheckpoint':
    case 'TransportCheckpointRequest':
      return TransportCheckpointRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'TransportStatus':
    case 'UnreadCount':
      return UnreadCount.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'UpdateAccountRequest':
      return UpdateAccountRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'UpdateBankAccountRequest':
      return UpdateBankAccountRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'UpdateCartItemRequest':
      return UpdateCartItemRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'UpdateCategoryRequest':
      return UpdateCategoryRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'UpdateContactRequest':
      return UpdateContactRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'UpdateListingRequest':
      return UpdateListingRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'UpdateMessageRequest':
      return UpdateMessageRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'UpdateNotificationPreferencesRequest':
      return UpdateNotificationPreferencesRequest.fromJson(
            value as Map<String, dynamic>,
          )
          as ReturnType;
    case 'UpdateNotificationPreferencesRequestItemsInner':
      return UpdateNotificationPreferencesRequestItemsInner.fromJson(
            value as Map<String, dynamic>,
          )
          as ReturnType;
    case 'UpdateOfferRequest':
      return UpdateOfferRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'UpdateProfileRequest':
      return UpdateProfileRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'UpdateReviewRequest':
      return UpdateReviewRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'UpdateVariantRequest':
      return UpdateVariantRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'UploadSlot':
      return UploadSlot.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'UpsertTaxInfoRequest':
      return UpsertTaxInfoRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'Variant':
      return Variant.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'VerifyContactPhoneRequest':
      return VerifyContactPhoneRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'VoteReviewRequest':
      return VoteReviewRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'Wallet':
      return Wallet.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'WalletAdjustmentRequest':
      return WalletAdjustmentRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'WalletList':
      return WalletList.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'WalletTransaction':
      return WalletTransaction.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'WalletTransactionKind':
    case 'WalletTransactionPage':
      return WalletTransactionPage.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'WebSocketTicket':
      return WebSocketTicket.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'Withdrawal':
      return Withdrawal.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'WithdrawalApprovalRequest':
      return WithdrawalApprovalRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'WithdrawalOutcome':
    case 'WithdrawalPage':
      return WithdrawalPage.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'WithdrawalRejectionRequest':
      return WithdrawalRejectionRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    default:
      RegExpMatch? match;

      if (value is List && (match = _regList.firstMatch(targetType)) != null) {
        targetType = match![1]!; // ignore: parameter_assignments
        return value
                .map<BaseType>(
                  (dynamic v) => deserialize<BaseType, BaseType>(
                    v,
                    targetType,
                    growable: growable,
                  ),
                )
                .toList(growable: growable)
            as ReturnType;
      }
      if (value is Set && (match = _regSet.firstMatch(targetType)) != null) {
        targetType = match![1]!; // ignore: parameter_assignments
        return value
                .map<BaseType>(
                  (dynamic v) => deserialize<BaseType, BaseType>(
                    v,
                    targetType,
                    growable: growable,
                  ),
                )
                .toSet()
            as ReturnType;
      }
      if (value is Map && (match = _regMap.firstMatch(targetType)) != null) {
        targetType = match![1]!.trim(); // ignore: parameter_assignments
        return Map<String, BaseType>.fromIterables(
              value.keys as Iterable<String>,
              value.values.map(
                (dynamic v) => deserialize<BaseType, BaseType>(
                  v,
                  targetType,
                  growable: growable,
                ),
              ),
            )
            as ReturnType;
      }
      break;
  }
  throw Exception('Cannot deserialize');
}
