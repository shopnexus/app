/// Định nghĩa các API endpoints của hệ thống ShopNexus
class ApiEndpoints {
  // Base URLs
  static const String baseUrl = 'https://shopnexus.hopto.org';
  static const String webSocketUrl = 'wss://shopnexus.hopto.org/chat'; // Placeholder cho WebSocket Chat

  // --- Auth Features ---
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgot-password';

  // --- Catalog/Product Features ---
  static const String products = '/products';
  static const String categories = '/categories';
  static String productDetail(String slug) => '/products/$slug';
  static String productReviews(String id) => '/products/$id/reviews';

  // --- Cart & Checkout Features ---
  static const String quoteTransport = '/api/v1/order/buyer/quote-transport';
  static const String createOrder = '/api/v1/order/create';
  static String orderStatus(String id) => '/api/v1/order/status/$id';

  // --- Account (Buyer) Features ---
  static const String profile = '/account/profile';
  static const String profileCountry = '/account/profile/country';
  static const String addresses = '/account/addresses';
  static const String wishlist = '/wishlist';
  static const String notifications = '/notifications';
  static const String buyerOrders = '/buyer/orders';
  static String deletePendingItem(String id) => '/buyer/pending-items/$id';

  // --- Seller Features ---
  static const String sellerStats = '/seller/stats';
  static const String videoToProduct = '/catalog/product-spu/from-video';
  static const String sellerProducts = '/seller/products';
  static const String sellerOrders = '/seller/orders';
  static const String sellerRejectPending = '/seller/pending/reject';

  // --- Refund & Dispute Features ---
  static const String buyerRefund = '/buyer/refund';
  static const String withdrawRefund = '/withdraw';
  static String sellerApproveRefund(String id) => '/api/v1/order/refunds/$id/approve';
  static String sellerDisputeRefund(String id) => '/api/v1/order/refunds/$id/dispute';
}
