/// Định nghĩa các API endpoints của hệ thống ShopNexus (Tất cả đường dẫn tương đối với Base URL /api/v1/)
class ApiEndpoints {
  // Base URLs & WebSocket
  static const String baseUrl = 'https://shopnexus.hopto.org/api/v1/';
  static const String webSocketUrl = 'wss://shopnexus.hopto.org/api/v1/chat'; // Placeholder cho WebSocket Chat

  // --- Auth Features ---
  static const String login = 'account/auth/login/basic';
  static const String register = 'account/auth/register/basic';
  static const String refreshToken = 'account/auth/refresh';
  static const String forgotPassword = 'account/auth/forgot-password'; // Placeholder

  // --- Profile Features ---
  static const String profile = 'account/me';
  static const String profileCountry = 'account/profile/country';
  static const String getAccountById = 'account';

  // --- Contacts Features ---
  static const String contacts = 'account/contact';
  static const String contactDetailTemplate = 'account/contact/{id}';
  static String contactDetail(String contactId) => 'account/contact/$contactId';

  // --- Catalog/Product Features ---
  static const String productCards = 'catalog/product-card';
  static const String productCardDetailTemplate = 'catalog/product-card/{id}';
  static String productCardDetail(String id) => 'catalog/product-card/$id';
  
  static const String recommendedProducts = 'catalog/product-card/recommended';
  static const String productDetail = 'catalog/product-detail';
  
  static const String categories = 'catalog/category';
  static const String categoryDetailTemplate = 'catalog/category/{id}';
  static String categoryDetail(String id) => 'catalog/category/$id';
  
  static const String tags = 'catalog/tag';
  static const String tagDetailTemplate = 'catalog/tag/{name}';
  static String tagDetail(String name) => 'catalog/tag/$name';
  
  static const String vendorStats = 'catalog/vendor-stats';

  // --- Comments & Reviews Features ---
  static const String comments = 'catalog/comment';
  static const String reviewableOrders = 'catalog/comment/reviewable-orders';
  static const String voteComment = 'catalog/comment/vote';

  // --- Favorites/Wishlist Features ---
  static const String favorites = 'account/favorite';
  static const String favoriteSpuTemplate = 'account/favorite/{spuId}';
  static String favoriteSpu(String spuId) => 'account/favorite/$spuId';

  // --- Notifications Features ---
  static const String notifications = 'account/notification';
  static const String notificationsUnreadCount = 'account/notification/unread-count';
  static const String notificationsRead = 'account/notification/read';
  static const String notificationsReadAll = 'account/notification/read-all';

  // --- Cart & Checkout Features ---
  static const String cart = 'order/cart';
  static const String quoteTransport = 'order/buyer/quote-transport';
  static const String checkout = 'order/buyer/checkout';
  
  static const String cancelCheckoutTemplate = 'order/buyer/checkout/{sessionID}/cancel';
  static String cancelCheckout(String sessionID) => 'order/buyer/checkout/$sessionID/cancel';
  
  static const String paymentUrlTemplate = 'order/buyer/checkout/{sessionID}/payment-url';
  static String paymentUrl(String sessionID) => 'order/buyer/checkout/$sessionID/payment-url';
  
  static const String checkoutSummaryTemplate = 'order/buyer/checkout-summary/{txID}';
  static String checkoutSummary(String txID) => 'order/buyer/checkout-summary/$txID';

  // --- Buyer Orders & Refunds ---
  static const String buyerPendingItems = 'order/buyer/pending-items';
  static const String cancelBuyerPendingItemTemplate = 'order/buyer/pending-items/{id}';
  static String cancelBuyerPendingItem(String id) => 'order/buyer/pending-items/$id';
  
  static const String buyerPendingOrders = 'order/buyer/pending-orders';
  static const String buyerCompletedOrders = 'order/buyer/completed-orders';
  static const String buyerCancelledItems = 'order/buyer/cancelled-items';
  static const String buyerCancelledOrders = 'order/buyer/cancelled-orders';
  
  static const String buyerOrderDetailTemplate = 'order/buyer/orders/{id}';
  static String buyerOrderDetail(String id) => 'order/buyer/orders/$id';
  
  static const String buyerRefund = 'order/buyer/refund';
  static const String withdrawBuyerRefundTemplate = 'order/refunds/{id}/withdraw';
  static String withdrawBuyerRefund(String id) => 'order/refunds/$id/withdraw';

  // --- Seller Features ---
  static const String sellerPendingItems = 'order/seller/pending';
  static const String sellerConfirmPending = 'order/seller/pending/confirm';
  
  static const String sellerCancelConfirmTemplate = 'order/seller/pending/confirm/{sessionID}/cancel';
  static String sellerCancelConfirm(String sessionID) => 'order/seller/pending/confirm/$sessionID/cancel';
  
  static const String sellerEnsureConfirmPaymentUrlTemplate = 'order/seller/pending/confirm/{sessionID}/payment-url';
  static String sellerEnsureConfirmPaymentUrl(String sessionID) => 'order/seller/pending/confirm/$sessionID/payment-url';
  
  static const String sellerRejectPending = 'order/seller/pending/reject';
  static const String sellerConfirmedOrders = 'order/seller/confirmed';
  
  static const String sellerOrderDetailTemplate = 'order/seller/confirmed/{id}';
  static String sellerOrderDetail(String id) => 'order/seller/confirmed/$id';
  
  static const String sellerRefunds = 'order/seller/refund';
  
  static const String sellerApproveRefundTemplate = 'order/refunds/{id}/approve';
  static String sellerApproveRefund(String id) => 'order/refunds/$id/approve';
  
  static const String sellerDisputeRefundTemplate = 'order/refunds/{id}/dispute';
  static String sellerDisputeRefund(String id) => 'order/refunds/$id/dispute';

  // --- SPU/SKU CRUD (Seller) ---
  static const String productSpu = 'catalog/product-spu';
  static const String productSpuDetailTemplate = 'catalog/product-spu/{id}';
  static String productSpuDetail(String id) => 'catalog/product-spu/$id';
  
  static const String productSku = 'catalog/product-sku';
  static const String videoToProduct = 'catalog/product-spu/from-video';
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

  // --- Chat Features ---
  static const String conversations = 'chat/conversation';
  static const String conversationMessagesTemplate = 'chat/conversation/{id}/messages';
  static String conversationMessages(String id) => 'chat/conversation/$id/messages';
  
  static const String sendMessage = 'chat/send-message';
  static const String markRead = 'chat/mark-read';

  // --- Admin Dispute Features ---
  static const String adminDisputes = 'order/disputes';
  static const String adminDisputeDetailTemplate = 'order/disputes/{disputeID}';
  static String adminDisputeDetail(String disputeID) => 'order/disputes/$disputeID';
  
  static const String disputesByRefundTemplate = 'order/refunds/{refundID}/disputes';
  static String disputesByRefund(String refundID) => 'order/refunds/$refundID/disputes';
  
  static const String upholdDisputeTemplate = 'order/disputes/{disputeID}/uphold';
  static String upholdDispute(String disputeID) => 'order/disputes/$disputeID/uphold';
  
  static const String dismissDisputeTemplate = 'order/disputes/{disputeID}/dismiss';
  static String dismissDispute(String disputeID) => 'order/disputes/$disputeID/dismiss';
}
