import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_model.freezed.dart';

part 'account_model.g.dart';

/// Alias UserProfile cho AccountProfile để tương thích với checklist của task
typedef UserProfile = AccountProfile;

@freezed
abstract class AccountProfile with _$AccountProfile {
  const factory AccountProfile({
    required String id,
    @JsonKey(name: 'date_created') required String dateCreated,
    @JsonKey(name: 'date_updated') required String dateUpdated,
    required String status,
    required String role,
    String? phone,
    String? email,
    String? username,
    String? gender,
    String? name,
    @JsonKey(name: 'date_of_birth') String? dateOfBirth,
    @JsonKey(name: 'email_verified') required bool emailVerified,
    @JsonKey(name: 'phone_verified') required bool phoneVerified,
    @JsonKey(name: 'default_contact_id') String? defaultContactId,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    String? description,
    required String country,
    required String currency,
    @JsonKey(name: 'internal_balance') required int internalBalance,
  }) = _AccountProfile;

  factory AccountProfile.fromJson(Map<String, dynamic> json) =>
      _$AccountProfileFromJson(json);

  @override
  Map<String, dynamic> toJson();
}

@freezed
abstract class UpdateProfileRequest with _$UpdateProfileRequest {
  const factory UpdateProfileRequest({
    String? username,
    String? phone,
    String? email,
    String? gender, // 'Male' | 'Female' | 'Other'
    String? name,
    @JsonKey(name: 'date_of_birth') String? dateOfBirth,
    @JsonKey(name: 'avatar_rs_id') String? avatarRsId,
    @JsonKey(name: 'default_contact_id') String? defaultContactId,
    String? description,
  }) = _UpdateProfileRequest;

  factory UpdateProfileRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileRequestFromJson(json);

  @override
  Map<String, dynamic> toJson();
}

@freezed
abstract class UpdateCountryRequest with _$UpdateCountryRequest {
  const factory UpdateCountryRequest({required String country}) =
      _UpdateCountryRequest;

  factory UpdateCountryRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateCountryRequestFromJson(json);

  @override
  Map<String, dynamic> toJson();
}

@freezed
abstract class UpdateCountryResponse with _$UpdateCountryResponse {
  const factory UpdateCountryResponse({
    required String country,
    @JsonKey(name: 'inferred_currency') required String inferredCurrency,
  }) = _UpdateCountryResponse;

  factory UpdateCountryResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateCountryResponseFromJson(json);

  @override
  Map<String, dynamic> toJson();
}

String _parsePhone(dynamic value) {
  if (value == null) return '';
  return value.toString();
}

@freezed
abstract class Contact with _$Contact {
  const factory Contact({
    required String id,
    @JsonKey(name: 'account_id') required String accountId,
    @JsonKey(name: 'full_name') required String fullName,
    @JsonKey(fromJson: _parsePhone) required String phone,
    @JsonKey(name: 'phone_verified') required bool phoneVerified,
    required String address,
    @JsonKey(name: 'address_detail') String? addressDetail,
    @JsonKey(name: 'address_type')
    required String addressType, // 'Home' | 'Office' | 'Other'
    double? latitude,
    double? longitude,
    @JsonKey(name: 'date_created') required String dateCreated,
    @JsonKey(name: 'date_updated') String? dateUpdated,
  }) = _Contact;

  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);

  @override
  Map<String, dynamic> toJson();
}

@freezed
abstract class CreateContactRequest with _$CreateContactRequest {
  const factory CreateContactRequest({
    @JsonKey(name: 'full_name') required String fullName,
    required String phone,
    required String address,
    @JsonKey(name: 'address_detail') String? addressDetail,
    @JsonKey(name: 'address_type')
    required String addressType, // 'Home' | 'Office' | 'Other'
    required double latitude,
    required double longitude,
  }) = _CreateContactRequest;

  factory CreateContactRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateContactRequestFromJson(json);

  @override
  Map<String, dynamic> toJson();
}

@freezed
abstract class UpdateContactRequest with _$UpdateContactRequest {
  const factory UpdateContactRequest({
    @JsonKey(name: 'contact_id') required String contactId,
    @JsonKey(name: 'full_name') String? fullName,
    String? phone,
    String? address,
    @JsonKey(name: 'address_detail') String? addressDetail,
    @JsonKey(name: 'address_type')
    String? addressType, // 'Home' | 'Office' | 'Other'
    @JsonKey(name: 'phone_verified') bool? phoneVerified,
    double? latitude,
    double? longitude,
  }) = _UpdateContactRequest;

  factory UpdateContactRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateContactRequestFromJson(json);

  @override
  Map<String, dynamic> toJson();
}

@freezed
abstract class AccountFavorite with _$AccountFavorite {
  const factory AccountFavorite({
    required int id,
    @JsonKey(name: 'account_id') required String accountId,
    @JsonKey(name: 'spu_id') required String spuId,
    @JsonKey(name: 'date_created') required String dateCreated,
  }) = _AccountFavorite;

  factory AccountFavorite.fromJson(Map<String, dynamic> json) =>
      _$AccountFavoriteFromJson(json);

  @override
  Map<String, dynamic> toJson();
}

@freezed
abstract class NotificationMetadata with _$NotificationMetadata {
  const factory NotificationMetadata({
    @JsonKey(name: 'order_id') String? orderId,
    @JsonKey(name: 'refund_id') String? refundId,
    @JsonKey(name: 'redirect_url') String? redirectUrl,
  }) = _NotificationMetadata;

  factory NotificationMetadata.fromJson(Map<String, dynamic> json) =>
      _$NotificationMetadataFromJson(json);

  @override
  Map<String, dynamic> toJson();
}

@freezed
abstract class Notification with _$Notification {
  const factory Notification({
    required int id,
    @JsonKey(name: 'account_id') required String accountId,
    required String type,
    required String channel,
    required String title,
    required String content,
    @JsonKey(name: 'is_read') required bool isRead,
    NotificationMetadata? metadata,
    @JsonKey(name: 'date_created') required String dateCreated,
  }) = _Notification;

  factory Notification.fromJson(Map<String, dynamic> json) =>
      _$NotificationFromJson(json);

  @override
  Map<String, dynamic> toJson();
}

@freezed
abstract class UnreadCountResponse with _$UnreadCountResponse {
  const factory UnreadCountResponse({required int count}) =
      _UnreadCountResponse;

  factory UnreadCountResponse.fromJson(Map<String, dynamic> json) =>
      _$UnreadCountResponseFromJson(json);

  @override
  Map<String, dynamic> toJson();
}

@freezed
abstract class ReadNotificationsRequest with _$ReadNotificationsRequest {
  const factory ReadNotificationsRequest({required List<int> ids}) =
      _ReadNotificationsRequest;

  factory ReadNotificationsRequest.fromJson(Map<String, dynamic> json) =>
      _$ReadNotificationsRequestFromJson(json);

  @override
  Map<String, dynamic> toJson();
}

@freezed
abstract class BuyerOrderItem with _$BuyerOrderItem {
  const factory BuyerOrderItem({
    required int id,
    @JsonKey(name: 'order_id') String? orderId,
    @JsonKey(name: 'sku_id') required String skuId,
    @JsonKey(name: 'spu_id') required String spuId,
    @JsonKey(name: 'sku_name') required String skuName,
    required int quantity,
    @JsonKey(name: 'subtotal_amount') required int subtotalAmount,
    @JsonKey(name: 'total_amount') required int totalAmount,
    @JsonKey(name: 'payment_session_id') int? paymentSessionId,
    required String slug,
    @JsonKey(name: 'image_url') String? imageUrl,
  }) = _BuyerOrderItem;

  factory BuyerOrderItem.fromJson(Map<String, dynamic> json) =>
      _$BuyerOrderItemFromJson(json);

  @override
  Map<String, dynamic> toJson();
}

@freezed
abstract class BuyerOrderTransport with _$BuyerOrderTransport {
  const factory BuyerOrderTransport({
    required int id,
    required String option,
    String? status,
  }) = _BuyerOrderTransport;

  factory BuyerOrderTransport.fromJson(Map<String, dynamic> json) =>
      _$BuyerOrderTransportFromJson(json);

  @override
  Map<String, dynamic> toJson();
}

@freezed
abstract class BuyerOrder with _$BuyerOrder {
  const factory BuyerOrder({
    required String id,
    @JsonKey(name: 'buyer_id') required String buyerId,
    @JsonKey(name: 'seller_id') required String sellerId,
    required String address,
    @JsonKey(name: 'date_created') required String dateCreated,
    @JsonKey(name: 'total_amount') required int totalAmount,
    required List<BuyerOrderItem> items,
    BuyerOrderTransport? transport,
  }) = _BuyerOrder;

  factory BuyerOrder.fromJson(Map<String, dynamic> json) =>
      _$BuyerOrderFromJson(json);

  @override
  Map<String, dynamic> toJson();
}

@freezed
abstract class MessageResponse with _$MessageResponse {
  const factory MessageResponse({required String message}) = _MessageResponse;

  factory MessageResponse.fromJson(Map<String, dynamic> json) =>
      _$MessageResponseFromJson(json);

  @override
  Map<String, dynamic> toJson();
}
