/// Paths for the hand-written retrofit services that have not been migrated yet.
/// `lib/api/generated` is the source of truth for every route: nothing here is
/// checked against the contract, so a constant that outlives its last caller is a
/// lie waiting to be copied — 104 unreferenced ones were deleted at once.
class ApiEndpoints {
  static const String baseUrl = 'https://shopnexus.hopto.org/api/v1/';

  /// The one per-account event stream (asyncapi `userStream`). Authorised by a
  /// single-use ticket from `POST /ws/tickets`, never by a token in the URL.
  static const String webSocketUrl = 'wss://shopnexus.hopto.org/api/v1/ws';

  // --- Auth ---
  /// Takes no bearer: `AuthInterceptor` calls it on a bare Dio.
  static const String refreshToken = 'token/refresh';

  // --- Account ---
  static const String me = 'me';
  static const String meProfile = 'me/profile';
  static const String accountDetailTemplate = 'accounts/{id}';

  // --- Contacts ---
  static const String contacts = 'contacts';
  static const String contactDetailTemplate = 'contacts/{id}';

  // --- Catalog ---
  static const String listings = 'listings';
  static const String listingDetailTemplate = 'listings/{id}';
  static const String categories = 'categories';

  // --- Reviews ---
  static const String listingReviewsTemplate = 'listings/{listingID}/reviews';
  static const String comments = 'reviews';

  // --- Wishlist ---
  static const String favorites = 'favorites';
  static const String favoriteListingTemplate = 'favorites/{listingID}';

  // --- Notifications ---
  static const String notifications = 'notifications';
  static const String notificationsUnreadCount = 'notifications/unread-count';
  static const String notificationsRead = 'notifications/read';

  // --- Cart, drafts & checkout ---
  static const String cart = 'cart-items';
  static const String cartItemDetailTemplate = 'cart-items/{id}';
  static const String drafts = 'drafts';
  static const String draftDetailTemplate = 'drafts/{id}';
  static const String draftCheckoutTemplate = 'drafts/{id}/checkout';
  static const String offerCheckoutTemplate = 'offers/{id}/checkout';
  static const String shippingQuotes = 'shipping-quotes';
  static const String startPaymentTemplate = 'payment-sessions/{id}/payments';

  // --- Buyer orders & items ---
  static const String buyerPendingItems = 'items';
  static const String buyerCancelledItems = 'items';
  static const String cancelBuyerPendingItemTemplate =
      'items/{id}/cancellation';
  static const String buyerPendingOrders = 'orders';
  static const String buyerCompletedOrders = 'orders';
  static const String buyerCancelledOrders = 'orders';
  static const String buyerOrderDetailTemplate = 'orders/{id}';

  // --- Seller ---
  static const String sellerPendingItems = 'order/seller/pending';
  static const String sellerConfirmPending = 'order/seller/pending/confirm';
  static const String sellerCancelConfirmTemplate =
      'order/seller/pending/confirm/{sessionID}/cancel';
  static const String sellerEnsureConfirmPaymentUrlTemplate =
      'order/seller/pending/confirm/{sessionID}/payment-url';
  static const String sellerRejectPending = 'order/seller/pending/reject';
  static const String sellerConfirmedOrders = 'order/seller/confirmed';
  static const String sellerOrderDetailTemplate = 'order/seller/confirmed/{id}';
  static const String productSpu = 'catalog/product-spu';
  static const String productSpuDetailTemplate = 'catalog/product-spu/{id}';
  static const String productSku = 'catalog/product-sku';
  static const String sellerDashboard = 'analytic/seller-dashboard';

  // Routes the backend does not serve. Their callers are still wired, and
  // whether those features stay is not this wave's call.
  static const String uploadFile = 'common/files';
  static const String exchangeRates = 'common/currencies/rates';
  static const String reverseGeocode = 'common/geocode/reverse';
  static const String forwardGeocode = 'common/geocode/forward';
  static const String searchGeocode = 'common/geocode/search';
}
