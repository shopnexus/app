import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_model.freezed.dart';

part 'account_model.g.dart';

/// Resource model dùng chung cho Avatar, tài liệu, v.v. theo OpenAPI
@freezed
abstract class Resource with _$Resource {
  const factory Resource({
    required String id,
    required String mime,
    @JsonKey(name: 'object_key') required String objectKey,
    required String provider,
    required int size,
    String? checksum,
    String? url,
    @JsonKey(name: 'url_expires_at') String? urlExpiresAt,
  }) = _Resource;

  factory Resource.fromJson(Map<String, dynamic> json) =>
      _$ResourceFromJson(json);
}

/// Profile model chứa thông tin công khai của User/Seller
@freezed
abstract class Profile with _$Profile {
  const factory Profile({
    required String name,
    required String country,
    required String locale,
    required String timezone,
    @JsonKey(name: 'created_at') required String createdAt,
    Resource? avatar,
    @JsonKey(name: 'date_of_birth') String? dateOfBirth,
    String? description,
    dynamic gender,
  }) = _Profile;

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);
}

/// Model Me đại diện cho tài khoản hiện tại (GET /me)
@freezed
abstract class Me with _$Me {
  const Me._();

  const factory Me({
    required String id,
    @JsonKey(name: 'created_at') required String createdAt,
    String? email,
    @JsonKey(name: 'email_verified') required bool emailVerified,
    @JsonKey(name: 'has_password') required bool hasPassword,
    @JsonKey(name: 'identity_verified') required bool identityVerified,
    String? phone,
    Profile? profile,
    required String role,
    required String status,
    String? username,
  }) = _Me;

  factory Me.fromJson(Map<String, dynamic> json) => _$MeFromJson(json);

  // Derived from what the route actually sends.
  String get dateCreated => createdAt;

  String get name => profile?.name ?? username ?? email ?? 'Người dùng';

  String? get avatarUrl => profile?.avatar?.url;

  String? get dateOfBirth => profile?.dateOfBirth;

  String? get description => profile?.description;

  String? get gender => profile?.gender?.toString();

  String get country => profile?.country ?? 'VN';

  /// TODO(cart): not a field of `GET /me` — a preferred currency is finance's, and
  /// `lib/features/cart` is the only reader.
  String get currency => 'VND';
}

/// Alias tương thích
typedef AccountProfile = Me;
typedef UserProfile = Me;

/// PublicAccount dùng khi xem thông tin tài khoản public của người khác
@freezed
abstract class PublicAccount with _$PublicAccount {
  const PublicAccount._();

  const factory PublicAccount({
    required String id,
    required String name,
    @JsonKey(name: 'follower_count') required int followerCount,
    @JsonKey(name: 'identity_verified') required bool identityVerified,
    @JsonKey(name: 'created_at') required String createdAt,
    String? description,
    Resource? avatar,
  }) = _PublicAccount;

  factory PublicAccount.fromJson(Map<String, dynamic> json) =>
      _$PublicAccountFromJson(json);

  String? get avatarUrl => avatar?.url;
}

String _parsePhone(dynamic value) {
  if (value == null) return '';
  return value.toString();
}

/// Read-only: every write goes through the generated `CreateContactRequest` /
/// `UpdateContactRequest`. This one survives as a hand-written model because
/// `lib/features/{catalog,checkout}` name it too, and moving them to the
/// generated `Contact` — whose `address_type` is an enum — is theirs to do.
@freezed
abstract class Contact with _$Contact {
  const factory Contact({
    required String id,
    @JsonKey(name: 'full_name') required String fullName,
    @JsonKey(fromJson: _parsePhone) required String phone,
    @JsonKey(name: 'phone_verified') required bool phoneVerified,
    required String address,
    @JsonKey(name: 'address_detail') String? addressDetail,
    @JsonKey(name: 'address_type')
    required String addressType, // 'home' | 'work'
    required String country,
    @JsonKey(name: 'province_code') required String provinceCode,
    @JsonKey(name: 'province_name') required String provinceName,
    @JsonKey(name: 'district_code') String? districtCode,
    @JsonKey(name: 'district_name') String? districtName,
    @JsonKey(name: 'ward_code') required String wardCode,
    @JsonKey(name: 'ward_name') required String wardName,
    @JsonKey(name: 'postal_code') String? postalCode,
    @JsonKey(name: 'is_default_delivery') required bool isDefaultDelivery,
    @JsonKey(name: 'is_default_pickup') required bool isDefaultPickup,
    double? latitude,
    double? longitude,
    @JsonKey(name: 'created_at') required String createdAt,
  }) = _Contact;

  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);
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
}

@freezed
abstract class NotificationMetadata with _$NotificationMetadata {
  const factory NotificationMetadata({
    @JsonKey(name: 'order_id') String? orderId,
    @JsonKey(name: 'ticket_id') String? ticketId,
    @JsonKey(name: 'redirect_url') String? redirectUrl,
  }) = _NotificationMetadata;

  factory NotificationMetadata.fromJson(Map<String, dynamic> json) =>
      _$NotificationMetadataFromJson(json);
}

@freezed
abstract class Notification with _$Notification {
  const Notification._();

  const factory Notification({
    required String title,
    required String
    category, // 'order' | 'promotion' | 'system' | 'chat' | 'social'
    @JsonKey(name: 'created_at') required String createdAt,
    Map<String, dynamic>? payload,
    @JsonKey(name: 'read_at') String? readAt,
    // Fields tương thích
    int? legacyId,
    String? legacyContent,
  }) = _Notification;

  factory Notification.fromJson(Map<String, dynamic> json) =>
      _$NotificationFromJson(json);

  bool get isRead => readAt != null;

  String get type => category;

  String get channel => 'push';

  String get content =>
      legacyContent ??
      payload?['content']?.toString() ??
      payload?['body']?.toString() ??
      title;

  String get dateCreated => createdAt;

  int get id => legacyId ?? createdAt.hashCode;

  NotificationMetadata? get metadata =>
      payload != null ? NotificationMetadata.fromJson(payload!) : null;
}

@freezed
abstract class UnreadCountResponse with _$UnreadCountResponse {
  const UnreadCountResponse._();

  const factory UnreadCountResponse({required int unread}) =
      _UnreadCountResponse;

  factory UnreadCountResponse.fromJson(Map<String, dynamic> json) =>
      _$UnreadCountResponseFromJson(json);

  int get count => unread;
}

@freezed
abstract class MarkNotificationsReadRequest
    with _$MarkNotificationsReadRequest {
  const factory MarkNotificationsReadRequest({required String before}) =
      _MarkNotificationsReadRequest;

  factory MarkNotificationsReadRequest.fromJson(Map<String, dynamic> json) =>
      _$MarkNotificationsReadRequestFromJson(json);

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
}

@freezed
abstract class MessageResponse with _$MessageResponse {
  const factory MessageResponse({required String message}) = _MessageResponse;

  factory MessageResponse.fromJson(Map<String, dynamic> json) =>
      _$MessageResponseFromJson(json);
}
