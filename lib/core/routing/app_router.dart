import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopnexus_flutter_app/api/generated/model/listing_status.dart';
import 'package:shopnexus_flutter_app/api/generated/model/order_state.dart';
import 'package:shopnexus_flutter_app/core/storage/hive_storage.dart';
import 'package:shopnexus_flutter_app/core/constants/route_constants.dart';
import 'package:shopnexus_flutter_app/features/auth/presentation/screens/splash_screen.dart';
import 'package:shopnexus_flutter_app/features/auth/presentation/screens/login_screen.dart';
import 'package:shopnexus_flutter_app/features/auth/presentation/screens/register_screen.dart';
import 'package:shopnexus_flutter_app/features/auth/presentation/screens/forgot_password_screen.dart';
import 'package:shopnexus_flutter_app/features/catalog/presentation/screens/product_list_screen.dart';
import 'package:shopnexus_flutter_app/features/catalog/presentation/screens/categories_screen.dart';
import 'package:shopnexus_flutter_app/features/catalog/presentation/screens/search_screen.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/screens/following_screen.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/screens/linked_accounts_screen.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/screens/notification_preferences_screen.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/screens/notifications_screen.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/screens/payment_history_screen.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/screens/profile_screen.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/screens/orders_screen.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/screens/order_detail_screen.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/screens/addresses_screen.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/screens/wishlist_screen.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/screens/security_screen.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/screens/settings_screen.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/screens/my_reviews_screen.dart';
import 'package:shopnexus_flutter_app/features/kyc/presentation/screens/kyc_verification_screen.dart';
import 'package:shopnexus_flutter_app/shared/widgets/main_layout.dart';
import 'package:shopnexus_flutter_app/features/catalog/presentation/screens/product_detail_screen.dart';
import 'package:shopnexus_flutter_app/features/cart/presentation/screens/cart_screen.dart';
import 'package:shopnexus_flutter_app/features/checkout/presentation/screens/checkout_screen.dart';
import 'package:shopnexus_flutter_app/features/seller/presentation/screens/seller_profile_screen.dart';
import 'package:shopnexus_flutter_app/features/seller/presentation/screens/seller_dashboard_screen.dart';
import 'package:shopnexus_flutter_app/features/seller/presentation/screens/listing_suggestion_screen.dart';
import 'package:shopnexus_flutter_app/features/seller/presentation/screens/listing_edit_screen.dart';
import 'package:shopnexus_flutter_app/features/seller/presentation/screens/seller_products_screen.dart';
import 'package:shopnexus_flutter_app/features/seller/presentation/screens/seller_orders_screen.dart';
import 'package:shopnexus_flutter_app/features/seller/presentation/screens/seller_earnings_screen.dart';
import 'package:shopnexus_flutter_app/features/seller/presentation/screens/tax_info_screen.dart';
import 'package:shopnexus_flutter_app/features/seller/presentation/screens/wallet_ledger_screen.dart';
import 'package:shopnexus_flutter_app/features/chat/presentation/screens/chat_list_screen.dart';
import 'package:shopnexus_flutter_app/features/chat/presentation/screens/chat_detail_screen.dart';
import 'package:shopnexus_flutter_app/features/help_center/presentation/screens/help_center_screen.dart';
import 'package:shopnexus_flutter_app/features/refund/presentation/screens/refund_detail_screen.dart';
import 'package:shopnexus_flutter_app/features/refund/presentation/screens/refund_list_screen.dart';
import 'package:shopnexus_flutter_app/features/ticket/presentation/screens/ticket_detail_screen.dart';

part 'app_router.g.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>();

String _lastPublicLocation = '/home';

@riverpod
GoRouter appRouter(Ref ref) {
  final hiveService = ref.watch(hiveServiceProvider);

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/splash',
    routes: [
      GoRoute(
        path: '/splash',
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/register',
        name: 'register',
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: '/forgot-password',
        name: 'forgot-password',
        builder: (context, state) => const ForgotPasswordScreen(),
      ),
      GoRoute(
        path: '/cart',
        name: 'cart',
        builder: (context, state) => const CartScreen(),
      ),
      GoRoute(
        path: '/checkout',
        name: 'checkout',
        builder: (context, state) => const CheckoutScreen(),
        routes: [
          // Sổ địa chỉ dùng lại nguyên vẹn, chỉ ở chế độ chọn — checkout không
          // còn định nghĩa lần thứ hai "một địa chỉ trông thế nào".
          //
          // Route nằm dưới `/checkout` chứ không phải `/account/addresses`: hai
          // route đó khác nhau ở chỗ `/account/*` nằm trong `ShellRoute`, và đẩy
          // một route trong shell lên trên `/checkout` (ngoài shell) làm
          // `_shellNavigatorKey` bị đăng ký hai lần — Navigator ném
          // `!keyReservation.contains(key)`. Ở đây picker cũng không đeo thanh
          // nav dưới, đúng với việc nó là một bước của checkout.
          GoRoute(
            path: 'select-address',
            name: 'checkout_select_address',
            builder: (context, state) =>
                const AddressesScreen(selectMode: true),
          ),
        ],
      ),
      // Cấu hình ShellRoute chứa Bottom Navigation Bar cho 5 tab chính
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return MainLayout(child: child);
        },
        routes: [
          GoRoute(
            path: '/home',
            name: 'home',
            builder: (context, state) => const ProductListScreen(),
            routes: [
              GoRoute(
                path: 'product/:id',
                name: 'product_detail',
                builder: (context, state) {
                  final id = state.pathParameters['id']!;
                  return ProductDetailScreen(productId: id);
                },
              ),
            ],
          ),
          GoRoute(
            path: '/categories',
            name: 'categories',
            builder: (context, state) => const CategoriesScreen(),
          ),
          GoRoute(
            path: '/search',
            name: 'search',
            builder: (context, state) => const SearchScreen(),
          ),
          // Trang công khai của một *người*, không của một shop. Spec không có
          // thực thể shop nào: `reputation` và `follows` đều gắn với account, nên
          // "vendor" là vốn từ B2C mượn vào một sàn C2C.
          GoRoute(
            path: '/users/:id',
            name: 'public_profile',
            builder: (context, state) {
              final id = state.pathParameters['id']!;
              return SellerProfileScreen(vendorId: id);
            },
          ),
          // Cửa duy nhất vào bảng số liệu: màn Tài khoản chỉ link tới
          // `/seller/products`, `/seller/orders` và `/seller/earnings`, nên
          // `/seller` mà redirect đi chỗ khác là dashboard không ai mở được.
          GoRoute(
            path: '/seller',
            name: 'seller',
            builder: (context, state) => const SellerDashboardScreen(),
            routes: [
              GoRoute(
                path: 'new-listing',
                name: 'seller_new_listing',
                builder: (context, state) => const ListingSuggestionScreen(),
              ),
              GoRoute(
                path: 'products',
                name: 'seller_products',
                builder: (context, state) {
                  // The contract's own value, so a link nobody updated lands on
                  // "all" instead of on a filter that matches nothing.
                  final status = _enumByValue(
                    ListingStatus.values,
                    state.uri.queryParameters['status'],
                    (s) => s.value,
                  );
                  return SellerProductsScreen(initialStatus: status);
                },
              ),
              GoRoute(
                path: 'products/:id/edit',
                name: 'seller_listing_edit',
                builder: (context, state) =>
                    ListingEditScreen(listingId: state.pathParameters['id']!),
              ),
              GoRoute(
                path: 'orders',
                name: 'seller_orders',
                builder: (context, state) {
                  final orderState =
                      _enumByValue(
                        OrderState.values,
                        state.uri.queryParameters['state'],
                        (s) => s.value,
                      ) ??
                      OrderState.open;
                  return SellerOrdersScreen(initialState: orderState);
                },
              ),
              GoRoute(
                path: 'earnings',
                name: 'seller_earnings',
                builder: (context, state) => const SellerEarningsScreen(),
              ),
            ],
          ),
          GoRoute(
            path: '/chat',
            name: 'chat',
            builder: (context, state) => const ChatListScreen(),
            routes: [
              GoRoute(
                path: ':id',
                name: 'chat_detail',
                builder: (context, state) {
                  final id = state.pathParameters['id']!;
                  return ChatDetailScreen(conversationId: id);
                },
              ),
            ],
          ),
          GoRoute(
            path: '/account',
            name: 'account',
            builder: (context, state) => const ProfileScreen(),
            routes: [
              // Không còn `?role=`: danh sách gộp cả hai chiều và xếp theo lượt,
              // nên không có vai nào để mở sẵn. Link cũ mang `?role=` hay `?tab=`
              // vẫn mở đúng màn này, tham số chỉ bị bỏ qua.
              GoRoute(
                path: 'orders',
                name: 'buyer_orders',
                builder: (context, state) {
                  final initialTabStr = state.uri.queryParameters['tab'];
                  final initialTab = int.tryParse(initialTabStr ?? '') ?? 0;
                  return OrdersScreen(initialTabIndex: initialTab);
                },
              ),
              GoRoute(
                path: 'order-detail/:id',
                name: 'buyer_order_detail',
                builder: (context, state) {
                  final id = state.pathParameters['id']!;
                  return OrderDetailScreen(orderId: id);
                },
              ),
              GoRoute(
                path: 'addresses',
                name: 'buyer_addresses',
                builder: (context, state) => const AddressesScreen(),
              ),
              GoRoute(
                path: 'wishlist',
                name: 'buyer_wishlist',
                builder: (context, state) => const WishlistScreen(),
              ),
              GoRoute(
                path: 'settings',
                name: 'buyer_settings',
                builder: (context, state) => const SettingsScreen(),
              ),
              GoRoute(
                path: 'kyc',
                name: 'kyc_verification',
                builder: (context, state) => const KycVerificationScreen(),
              ),
              GoRoute(
                path: 'payments',
                name: 'payment_history',
                builder: (context, state) => const PaymentHistoryScreen(),
              ),
              GoRoute(
                path: 'notifications',
                name: 'notifications',
                builder: (context, state) => const NotificationsScreen(),
              ),
              GoRoute(
                path: 'notification-settings',
                name: 'notification_settings',
                builder: (context, state) =>
                    const NotificationPreferencesScreen(),
              ),
              GoRoute(
                path: 'linked-accounts',
                name: 'linked_accounts',
                builder: (context, state) => const LinkedAccountsScreen(),
              ),
              GoRoute(
                path: 'security',
                name: 'security',
                builder: (context, state) => const SecurityScreen(),
              ),
              GoRoute(
                path: 'tax-info',
                name: 'tax_info',
                builder: (context, state) => const TaxInfoScreen(),
              ),
              GoRoute(
                path: 'wallet-ledger',
                name: 'wallet_ledger',
                // VND là loại tiền duy nhất của sàn, nên một link không mang
                // `?currency=` vẫn mở đúng sổ — cùng mặc định `SellerEarningsState`
                // dùng cho một tài khoản chưa có dòng ví nào.
                builder: (context, state) => WalletLedgerScreen(
                  currency: state.uri.queryParameters['currency'] ?? 'VND',
                ),
              ),
              GoRoute(
                path: 'following',
                name: 'following',
                builder: (context, state) => const FollowingScreen(),
              ),
              GoRoute(
                path: 'reviews',
                name: 'my_reviews',
                builder: (context, state) => const MyReviewsScreen(),
              ),
              GoRoute(
                path: 'refunds',
                name: 'refund_list',
                // Không còn `?role=`: một danh sách gộp cả hai chiều, xếp theo
                // lượt. Link cũ mang `?role=` vẫn mở đúng màn này.
                builder: (context, state) => const RefundListScreen(),
                routes: [
                  GoRoute(
                    path: ':id',
                    name: 'refund_detail',
                    builder: (context, state) {
                      final id = state.pathParameters['id']!;
                      return RefundDetailScreen(refundId: id);
                    },
                  ),
                ],
              ),
              GoRoute(
                path: 'help-center',
                name: 'buyer_help_center',
                builder: (context, state) => const HelpCenterScreen(),
                routes: [
                  GoRoute(
                    path: ':id',
                    name: 'ticket_detail',
                    builder: (context, state) {
                      final id = state.pathParameters['id']!;
                      return TicketDetailScreen(ticketId: id);
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
    redirect: (context, state) {
      final matchedLocation = state.matchedLocation;
      final isGoingToSplash = matchedLocation == '/splash';

      // Kiểm tra Token từ Hive
      final token = hiveService.authBox.get('token');
      final isAuthenticated = token != null && token.toString().isNotEmpty;

      // Không redirect nếu đang ở Splash để ứng dụng xử lý logic khởi tạo
      if (isGoingToSplash) return null;

      // Lưu lại vị trí công khai cuối cùng (home, categories, search)
      final publicLocations = ['/home', '/categories', '/search'];
      if (publicLocations.any((loc) => matchedLocation.startsWith(loc))) {
        _lastPublicLocation = state.uri.toString();
      }

      // Định nghĩa các vùng cần bảo mật (yêu cầu đăng nhập)
      final isGoingToProtected = RouteConstants.protectedPrefixes.any(
        (prefix) => matchedLocation.startsWith(prefix),
      );

      // Các trang phục vụ authentication
      final authLocations = ['/login', '/register', '/forgot-password'];
      final isGoingToAuth = authLocations.contains(matchedLocation);

      // Nếu chưa đăng nhập và cố truy cập vùng bảo mật => Đá về Login kèm tham số from và target
      if (!isAuthenticated && isGoingToProtected) {
        return '/login?from=${Uri.encodeComponent(_lastPublicLocation)}&target=${Uri.encodeComponent(state.uri.toString())}';
      }

      // Nếu đã đăng nhập mà lại cố truy cập trang login/register => Đá về Home
      if (isAuthenticated && isGoingToAuth) {
        return '/home';
      }

      return null;
    },
  );
}

/// A query parameter matched against a generated enum's wire values. Answers null
/// for anything else, so a stale deep link opens the unfiltered screen instead of
/// a filter the contract has no value for.
T? _enumByValue<T>(List<T> values, String? raw, String Function(T) valueOf) {
  if (raw == null) return null;
  for (final value in values) {
    if (valueOf(value) == raw) return value;
  }
  return null;
}
