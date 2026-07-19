import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../storage/hive_storage.dart';
import '../constants/route_constants.dart';
import '../../features/auth/presentation/screens/splash_screen.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/register_screen.dart';
import '../../features/auth/presentation/screens/forgot_password_screen.dart';
import '../../features/catalog/presentation/screens/product_list_screen.dart';
import '../../features/catalog/presentation/screens/categories_screen.dart';
import '../../features/catalog/presentation/screens/search_screen.dart';
import '../../features/account/presentation/screens/profile_screen.dart';
import '../../features/account/presentation/screens/orders_screen.dart';
import '../../features/account/presentation/screens/order_detail_screen.dart';
import '../../features/account/presentation/screens/addresses_screen.dart';
import '../../features/account/presentation/screens/wishlist_screen.dart';
import '../../features/account/presentation/screens/notifications_screen.dart';
import '../../shared/widgets/main_layout.dart';
import '../../shared/widgets/placeholder_screens.dart';
import '../../features/catalog/presentation/screens/product_detail_screen.dart';
import '../../features/cart/presentation/screens/cart_screen.dart';
import '../../features/checkout/presentation/screens/checkout_screen.dart';

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
            path: '/seller',
            name: 'seller',
            builder: (context, state) => const SellerPlaceholderScreen(),
          ),
          GoRoute(
            path: '/chat',
            name: 'chat',
            builder: (context, state) => const ChatPlaceholderScreen(),
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
