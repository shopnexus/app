/// Các hằng số liên quan đến điều hướng (Routing) trong hệ thống
class RouteConstants {
  /// Danh sách các đường dẫn (route prefixes) yêu cầu người dùng phải đăng nhập mới được truy cập
  static const List<String> protectedPrefixes = [
    '/cart',
    '/checkout',
    '/account',
    '/seller',
    '/dispute',
    '/chat',
  ];
}
