/// Định nghĩa các API endpoints của hệ thống ShopNexus (Tất cả đường dẫn tương đối với Base URL /api/v1/)
class ApiEndpoints {
  // Base URLs & WebSocket
  static const String baseUrl = 'https://shopnexus.hopto.org/api/v1/';
  static const String webSocketUrl =
      'wss://shopnexus.hopto.org/api/v1/chat'; // Placeholder cho WebSocket Chat

  // --- Auth Features ---
  static const String login = 'login';
  static const String loginOAuth = 'login/oauth';
  static const String register = 'register';
  static const String refreshToken = 'token/refresh';
  static const String logout = 'logout';
  static const String passwordChange = 'password';
  static const String passwordResetRequest = 'password/reset-requests';
  static const String passwordResetConfirm = 'password/resets';
  static const String forgotPassword = 'password/reset-requests';
  static const String emailVerificationRequest = 'email/verification-requests';
  static const String emailVerificationConfirm = 'email/verifications';

  // --- Profile & User Account Features ---
  static const String me = 'me';
  static const String meProfile = 'me/profile';
  static const String meUploads = 'me/uploads';
  static const String profile = 'me';
  static const String accounts = 'accounts';
  static const String getAccountById = 'accounts';
  static const String accountDetailTemplate = 'accounts/{id}';

  static String accountDetail(String id) => 'accounts/$id';

  // --- Contacts Features ---
  static const String contacts = 'contacts';
  static const String contactDetailTemplate = 'contacts/{id}';

  static String contactDetail(String contactId) => 'contacts/$contactId';

  // --- Follows & Social Features ---
  static const String meFollowing = 'me/following';
  static const String followsTemplate = 'follows/{accountID}';

  static String followSeller(String accountId) => 'follows/$accountId';

  // --- Catalog/Product Features ---
  static const String listings = 'listings';
  static const String listingDetailTemplate = 'listings/{id}';
  static String listingDetail(String id) => 'listings/$id';
  static const String listingPublicationTemplate = 'listings/{id}/publication';
  static const String listingVariantsTemplate = 'listings/{id}/variants';
  static const String variantDetailTemplate = 'variants/{id}';
  static const String listingUploads = 'listings/uploads';
  static const String listingUploadsConfirmationTemplate =
      'listings/uploads/{id}/confirmation';

  // Legacy aliases for backwards compatibility
  static const String productCards = 'listings';
  static const String productCardDetailTemplate = 'listings/{id}';
  static String productCardDetail(String id) => 'listings/$id';
  static const String recommendedProducts = 'listings';
  static const String productDetail = 'listings';

  static const String categories = 'categories';
  static const String categoryDetailTemplate = 'categories/{id}';
  static String categoryDetail(String id) => 'categories/$id';

  static const String tags = 'tags';
  static const String tagDetailTemplate = 'tags/{name}';
  static String tagDetail(String name) => 'tags/$name';

  static const String vendorStats = 'me/reputation';

  // --- Comments & Reviews Features ---
  static const String listingReviewsTemplate = 'listings/{listingID}/reviews';
  static String listingReviews(String listingId) =>
      'listings/$listingId/reviews';
  static const String reviewDetailTemplate = 'reviews/{id}';
  static String reviewDetail(String id) => 'reviews/$id';
  static const String reviewRepliesTemplate = 'reviews/{id}/replies';
  static const String reviewVoteTemplate = 'reviews/{id}/vote';
  static const String reviewUploads = 'reviews/uploads';
  static const String reviewUploadsConfirmationTemplate =
      'reviews/uploads/{id}/confirmation';

  // Legacy aliases
  static const String comments = 'reviews';
  static const String reviewableOrders = 'orders';
  static const String voteComment = 'reviews/vote';

  // --- Favorites/Wishlist Features ---
  static const String favorites = 'favorites';
  static const String favoriteListingTemplate = 'favorites/{listingID}';
  static String favoriteListing(String listingId) => 'favorites/$listingId';
  // Legacy aliases
  static const String favoriteSpuTemplate = 'favorites/{listingID}';
  static String favoriteSpu(String spuId) => 'favorites/$spuId';

  // --- Notifications Features ---
  static const String notifications = 'notifications';
  static const String notificationsUnreadCount = 'notifications/unread-count';
  static const String notificationsRead = 'notifications/read';
  static const String notificationPreferences = 'notification-preferences';

  // --- Cart & Checkout Features ---
  static const String cart = 'cart-items';
  static const String cartItemDetailTemplate = 'cart-items/{id}';

  static String cartItemDetail(String id) => 'cart-items/$id';
  static const String quoteTransport = 'order/buyer/quote-transport';
  static const String checkout = 'order/buyer/checkout';

  static const String cancelCheckoutTemplate =
      'order/buyer/checkout/{sessionID}/cancel';

  static String cancelCheckout(String sessionID) =>
      'order/buyer/checkout/$sessionID/cancel';

  static const String paymentUrlTemplate =
      'order/buyer/checkout/{sessionID}/payment-url';

  static String paymentUrl(String sessionID) =>
      'order/buyer/checkout/$sessionID/payment-url';

  static const String checkoutSummaryTemplate =
      'order/buyer/checkout-summary/{txID}';

  static String checkoutSummary(String txID) =>
      'order/buyer/checkout-summary/$txID';

  // --- Orders & Items ---
  static const String orders = 'orders';
  static const String orderDetailTemplate = 'orders/{id}';

  static String orderDetail(String id) => 'orders/$id';
  static const String cancelOrderTemplate = 'orders/{id}/cancellation';

  static String cancelOrder(String id) => 'orders/$id/cancellation';

  static const String orderItems = 'items';
  static const String cancelOrderItemTemplate = 'items/{id}/cancellation';

  static String cancelOrderItem(String id) => 'items/$id/cancellation';

  // Legacy order aliases for compatibility
  static const String buyerPendingItems = 'items';
  static const String cancelBuyerPendingItemTemplate =
      'items/{id}/cancellation';

  static String cancelBuyerPendingItem(String id) => 'items/$id/cancellation';
  static const String buyerPendingOrders = 'orders';
  static const String buyerCompletedOrders = 'orders';
  static const String buyerCancelledOrders = 'orders';
  static const String buyerCancelledItems = 'items';
  static const String buyerOrderDetailTemplate = 'orders/{id}';

  static String buyerOrderDetail(String id) => 'orders/$id';

  static const String buyerRefund = 'order/buyer/refund';
  static const String withdrawBuyerRefundTemplate =
      'order/refunds/{id}/withdraw';

  static String withdrawBuyerRefund(String id) => 'order/refunds/$id/withdraw';

  // --- Seller Features ---
  static const String sellerPendingItems = 'order/seller/pending';
  static const String sellerConfirmPending = 'order/seller/pending/confirm';

  static const String sellerCancelConfirmTemplate =
      'order/seller/pending/confirm/{sessionID}/cancel';

  static String sellerCancelConfirm(String sessionID) =>
      'order/seller/pending/confirm/$sessionID/cancel';

  static const String sellerEnsureConfirmPaymentUrlTemplate =
      'order/seller/pending/confirm/{sessionID}/payment-url';

  static String sellerEnsureConfirmPaymentUrl(String sessionID) =>
      'order/seller/pending/confirm/$sessionID/payment-url';

  static const String sellerRejectPending = 'order/seller/pending/reject';
  static const String sellerConfirmedOrders = 'order/seller/confirmed';

  static const String sellerOrderDetailTemplate = 'order/seller/confirmed/{id}';

  static String sellerOrderDetail(String id) => 'order/seller/confirmed/$id';

  static const String sellerRefunds = 'order/seller/refund';

  static const String sellerApproveRefundTemplate =
      'order/refunds/{id}/approve';

  static String sellerApproveRefund(String id) => 'order/refunds/$id/approve';

  static const String sellerDisputeRefundTemplate =
      'order/refunds/{id}/dispute';

  static String sellerDisputeRefund(String id) => 'order/refunds/$id/dispute';

  // --- SPU/SKU CRUD (Seller) ---
  static const String productSpu = 'catalog/product-spu';
  static const String productSpuDetailTemplate = 'catalog/product-spu/{id}';

  static String productSpuDetail(String id) => 'catalog/product-spu/$id';

  static const String productSku = 'catalog/product-sku';
  static const String videoToProduct = 'catalog/product-spu/from-video';
  static const String audioToProduct = 'catalog/product-spu/from-audio';
  static const String refineDescription =
      'catalog/product-spu/refine-description';
  static const String aiStyles = 'catalog/styles';

  // --- Inventory Features ---
  static const String stock = 'inventory/stock';
  static const String stockHistory = 'inventory/stock/history';
  static const String stockImport = 'inventory/stock/import';
  static const String serials = 'inventory/serial';

  // --- Promotion Features ---
  static const String promotions = 'catalog/promotion';
  static const String promotionDetailTemplate = 'catalog/promotion/{id}';

  static String promotionDetail(String id) => 'catalog/promotion/$id';

  // --- Analytic Features ---
  static const String sellerDashboard = 'analytic/seller-dashboard';
  static const String createInteraction = 'analytic/interaction';

  static const String productPopularityTemplate = 'analytic/popularity/{spuId}';

  static String productPopularity(String spuId) => 'analytic/popularity/$spuId';

  static const String topProductPopularity = 'analytic/popularity/top';

  // --- Common Utilities & Geocoding ---
  static const String uploadFile = 'common/files';
  static const String systemOptions = 'common/option';
  static const String exchangeRates = 'common/currencies/rates';
  static const String sseStream = 'common/stream';
  static const String reverseGeocode = 'common/geocode/reverse';
  static const String forwardGeocode = 'common/geocode/forward';
  static const String searchGeocode = 'common/geocode/search';

  // --- Chat & Messaging Features ---
  static const String conversations = 'conversations';
  static const String conversationDetailTemplate = 'conversations/{id}';
  static String conversationDetail(String id) => 'conversations/$id';
  static const String conversationMessagesTemplate =
      'conversations/{id}/messages';
  static String conversationMessages(String id) =>
      'conversations/$id/messages';
  static const String conversationReadTemplate = 'conversations/{id}/read';
  static String conversationRead(String id) => 'conversations/$id/read';
  static const String chatUnreadCount = 'conversations/unread-count';
  static const String chatUploads = 'conversations/uploads';
  static const String chatUploadsConfirmationTemplate =
      'conversations/uploads/{id}/confirmation';
  static String chatUploadsConfirmation(String id) =>
      'conversations/uploads/$id/confirmation';
  static const String messageDetailTemplate = 'messages/{id}';
  static String messageDetail(String id) => 'messages/$id';

  // Legacy aliases for backward compatibility
  static const String sendMessage = 'conversations/{id}/messages';
  static const String markRead = 'conversations/{id}/read';

  // --- Admin Dispute Features ---
  static const String adminDisputes = 'order/disputes';
  static const String adminDisputeDetailTemplate = 'order/disputes/{disputeID}';

  static String adminDisputeDetail(String disputeID) =>
      'order/disputes/$disputeID';

  static const String disputesByRefundTemplate =
      'order/refunds/{refundID}/disputes';

  static String disputesByRefund(String refundID) =>
      'order/refunds/$refundID/disputes';

  static const String upholdDisputeTemplate =
      'order/disputes/{disputeID}/uphold';

  static String upholdDispute(String disputeID) =>
      'order/disputes/$disputeID/uphold';

  static const String dismissDisputeTemplate =
      'order/disputes/{disputeID}/dismiss';

  static String dismissDispute(String disputeID) =>
      'order/disputes/$disputeID/dismiss';
}
