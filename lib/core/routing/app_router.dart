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
import 'package:shopnexus_flutter_app/features/account/presentation/screens/profile_screen.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/screens/orders_screen.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/screens/order_detail_screen.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/screens/addresses_screen.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/screens/wishlist_screen.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/screens/notifications_screen.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/screens/settings_screen.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/screens/account_center_screen.dart';
import 'package:shopnexus_flutter_app/features/kyc/presentation/screens/kyc_verification_screen.dart';
import 'package:shopnexus_flutter_app/shared/widgets/main_layout.dart';
import 'package:shopnexus_flutter_app/features/catalog/presentation/screens/product_detail_screen.dart';
import 'package:shopnexus_flutter_app/features/cart/presentation/screens/cart_screen.dart';
import 'package:shopnexus_flutter_app/features/checkout/presentation/screens/checkout_screen.dart';
import 'package:shopnexus_flutter_app/features/seller/presentation/screens/seller_profile_screen.dart';
import 'package:shopnexus_flutter_app/features/seller/presentation/screens/seller_dashboard_screen.dart';
import 'package:shopnexus_flutter_app/features/seller/presentation/screens/listing_suggestion_screen.dart';
import 'package:shopnexus_flutter_app/features/seller/presentation/screens/seller_products_screen.dart';
import 'package:shopnexus_flutter_app/features/seller/presentation/screens/seller_orders_screen.dart';
import 'package:shopnexus_flutter_app/features/seller/presentation/screens/seller_earnings_screen.dart';
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
          GoRoute(
            path: '/vendor/:id',
            name: 'seller_profile',
            builder: (context, state) {
              final id = state.pathParameters['id']!;
              return SellerProfileScreen(vendorId: id);
            },
          ),
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
              GoRoute(
                path: 'orders',
                name: 'buyer_orders',
                builder: (context, state) {
                  final tabString = state.uri.queryParameters['tab'];
                  final initialTab = int.tryParse(tabString ?? '0') ?? 0;
                  return OrdersScreen(initialTab: initialTab);
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
                path: 'notifications',
                name: 'buyer_notifications',
                builder: (context, state) => const NotificationsScreen(),
              ),
              GoRoute(
                path: 'settings',
                name: 'buyer_settings',
                builder: (context, state) => const SettingsScreen(),
              ),
              GoRoute(
                path: 'account-center',
                name: 'account_center',
                builder: (context, state) => const AccountCenterScreen(),
              ),
              GoRoute(
                path: 'kyc',
                name: 'kyc_verification',
                builder: (context, state) => const KycVerificationScreen(),
              ),
              GoRoute(
                path: 'refunds',
                name: 'refund_list',
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
