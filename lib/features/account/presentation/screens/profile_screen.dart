import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopnexus_flutter_app/api/generated/model/update_profile_request.dart';
import 'package:shopnexus_flutter_app/core/theme/app_colors.dart';
import 'package:shopnexus_flutter_app/core/utils/money_utils.dart';
import 'package:shopnexus_flutter_app/features/account/data/models/account_model.dart';
import 'package:shopnexus_flutter_app/features/account/data/repositories/account_repository.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/providers/account_provider.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/providers/action_inbox_provider.dart';
import 'package:shopnexus_flutter_app/api/generated/model/listing_status.dart';
import 'package:shopnexus_flutter_app/api/generated/model/order_state.dart';
import 'package:shopnexus_flutter_app/api/generated/model/transport_status.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/providers/orders_provider.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/widgets/account_menu_tile.dart';
import 'package:shopnexus_flutter_app/features/auth/presentation/providers/auth_provider.dart';
import 'package:shopnexus_flutter_app/features/seller/presentation/providers/seller_earnings_provider.dart';
import 'package:shopnexus_flutter_app/features/seller/presentation/providers/seller_orders_provider.dart';
import 'package:shopnexus_flutter_app/features/seller/presentation/providers/seller_products_provider.dart';

/// Trang tài khoản: ba nhóm và một khối việc-cần-làm.
///
/// Khu người bán không ở đây. Nó sống ở tab "Đăng bán" của bottom nav, và trang
/// này từng chép lại gần nguyên vẹn cả Đơn bán, Sản phẩm lẫn Thu nhập của nó —
/// một nửa trang tài khoản lặp lại một tab khác.
class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  bool _isUploadingAvatar = false;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickAndUploadAvatar(Me profile) async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
      maxWidth: 512,
      maxHeight: 512,
    );

    if (image == null) return;

    setState(() {
      _isUploadingAvatar = true;
    });

    try {
      final rsId = await ref
          .read(accountRepositoryProvider)
          .uploadAvatar(
            bytes: await image.readAsBytes(),
            filename: image.name,
            mime: image.mimeType ?? 'image/jpeg',
          );

      await ref
          .read(accountControllerProvider.notifier)
          .updateProfile(UpdateProfileRequest(avatarResourceId: rsId));

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Cập nhật ảnh đại diện thành công!'),
            backgroundColor: Color(0xFF10B981),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Lỗi upload ảnh: $e'),
            backgroundColor: const Color(0xFFBA1A1A),
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isUploadingAvatar = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AuthState>(authProvider, (previous, next) {
      next.maybeWhen(
        unauthenticated: () {
          if (mounted) {
            context.go('/home');
          }
        },
        orElse: () {},
      );
    });

    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final profileAsync = ref.watch(profileProvider);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        // Khớp nhãn tab ở bottom nav, vốn đã là "Tài khoản". Hai tên khác nhau
        // cho cùng một màn hình là một lỗi nhất quán riêng.
        title: Text(
          'Tài khoản',
          style: TextStyle(
            color: theme.colorScheme.onSurface,
            fontWeight: FontWeight.bold,
            fontFamily: 'Manrope',
            fontSize: 20,
          ),
        ),
        backgroundColor: theme.scaffoldBackgroundColor,
        elevation: 0,
        centerTitle: false,
        // Chuông từng ở đây. Thông báo giờ là một tab của Hộp thư và số chưa đọc
        // sống trên badge của thanh nav, thấy được từ mọi màn hình — một cái
        // chuông thứ hai chỉ thấy được khi đã ở đúng trang này thì không thêm gì.
      ),
      body: RefreshIndicator(
        onRefresh: () {
          // `actionInboxProvider` phải ở lại: badge sống ở `main_layout`, ngoài
          // shell của trang này, nên không có ai khác làm mới nó.
          ref.invalidate(actionInboxProvider);
          ref.invalidate(sellerWalletProvider);
          return ref.refresh(profileProvider.future);
        },
        child: profileAsync.when(
          data: (profile) => SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(context, profile),
                Divider(
                  height: 1,
                  color: isDarkMode
                      ? AppColors.darkPrimary.withAlpha(25)
                      : const Color(0xFFEEEEEE),
                ),

                const AccountSectionHeader(title: 'MUA BÁN & GIAO DỊCH'),
                _buildGroup(context, [
                  AccountMenuTile(
                    icon: Icons.receipt_long_outlined,
                    title: 'Đơn hàng của tôi',
                    onTap: () => context.push('/account/orders?tab=0'),
                  ),
                  _ShortcutWrapper(
                    child: _buildOrderStatusShortcutRow(context),
                  ),
                  AccountMenuTile(
                    icon: Icons.inventory_2_outlined,
                    title: 'Sản phẩm của tôi',
                    onTap: () => context.push('/seller/products'),
                  ),
                  _ShortcutWrapper(
                    child: _buildProductStatusShortcutRow(context),
                  ),
                  AccountMenuTile(
                    icon: Icons.storefront_outlined,
                    title: 'Đơn bán của tôi',
                    onTap: () => context.push('/seller/orders'),
                  ),
                  _ShortcutWrapper(
                    child: _buildSellerOrderStatusShortcutRow(context),
                  ),
                  AccountMenuTile(
                    icon: Icons.account_balance_wallet_outlined,
                    title: 'Ví & Số dư',
                    subtitle: _balanceLine(),
                    onTap: () => context.push('/seller/earnings'),
                  ),
                  AccountMenuTile(
                    icon: Icons.assignment_return_outlined,
                    title: 'Yêu cầu hoàn tiền',
                    onTap: () => context.push('/account/refunds'),
                  ),
                ]),

                const AccountSectionHeader(title: 'HỒ SƠ CÁ NHÂN'),
                _buildGroup(context, [
                  AccountMenuTile(
                    icon: Icons.bookmark_border_rounded,
                    title: 'Sản phẩm đã lưu',
                    onTap: () => context.push('/account/wishlist'),
                  ),
                  AccountMenuTile(
                    icon: Icons.person_add_alt_outlined,
                    title: 'Đang theo dõi',
                    onTap: () => context.push('/account/following'),
                  ),
                  AccountMenuTile(
                    icon: Icons.location_on_outlined,
                    title: 'Sổ địa chỉ',
                    onTap: () => context.push('/account/addresses'),
                  ),
                ]),

                const AccountSectionHeader(title: 'HỖ TRỢ & HỆ THỐNG'),
                _buildGroup(context, [
                  AccountMenuTile(
                    icon: Icons.help_outline_rounded,
                    title: 'Trung tâm trợ giúp',
                    onTap: () => context.push('/account/help-center'),
                  ),
                  AccountMenuTile(
                    icon: Icons.settings_outlined,
                    title: 'Cài đặt',
                    onTap: () => context.push('/account/settings'),
                  ),
                  AccountMenuTile(
                    icon: Icons.logout_rounded,
                    title: 'Đăng xuất',
                    tint: isDarkMode
                        ? const Color(0xFFEF4444)
                        : const Color(0xFFBA1A1A),
                    onTap: () => _handleLogout(context, ref),
                  ),
                ]),
                const SizedBox(height: 48),
              ],
            ),
          ),
          loading: () => _buildShimmer(context),
          error: (err, stack) => _buildError(context, err),
        ),
      ),
    );
  }

  /// Khả dụng và đang tạm giữ, cạnh nhau.
  ///
  /// Hai con số vì một con số trả lời sai: escrow của một đơn đã trả tiền chưa
  /// phải tiền rút được, và "₫0" một mình là câu trả lời cho người bán vừa bán
  /// xong và đang đi tìm tiền của họ. Vắng khi chưa đọc xong hoặc đọc hỏng — dòng
  /// menu vẫn vào được, và trang Tài khoản không được vỡ vì một cái ví.
  Widget _buildOrderStatusShortcutRow(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    final ordersFeed = ref.watch(ordersProvider).value;
    final orders = ordersFeed?.orders ?? [];

    int getCount(int tabIndex) {
      return orders.where((v) {
        final isCancelled = v.order.state == OrderState.cancelled ||
            v.order.cancelledAt != null;
        final isDelivered =
            v.order.transport?.status == TransportStatus.delivered;
        final isCompleted = v.order.state == OrderState.completed ||
            v.order.receivedAt != null ||
            v.order.completedAt != null ||
            isDelivered;

        switch (tabIndex) {
          case 1: // Chờ xác nhận
            return v.order.state == OrderState.awaitingConfirmation &&
                !isCancelled;
          case 2: // Đang xử lý
            return v.order.state == OrderState.open &&
                !isCompleted &&
                v.order.transport?.status != TransportStatus.returned &&
                !isCancelled;
          case 3: // Hoàn thành
            return isCompleted && !isCancelled;
          case 4: // Hoàn tiền
            return (v.order.declineReason != null ||
                    v.order.transport?.status == TransportStatus.returned) &&
                !isCancelled;
          case 5: // Đã hủy
            return isCancelled;
          default:
            return false;
        }
      }).length;
    }

    final statuses = [
      (
        icon: Icons.pending_actions_outlined,
        label: 'Chờ xác nhận',
        tabIndex: 1,
      ),
      (
        icon: Icons.local_shipping_outlined,
        label: 'Đang xử lý',
        tabIndex: 2,
      ),
      (
        icon: Icons.check_circle_outline_rounded,
        label: 'Hoàn thành',
        tabIndex: 3,
      ),
      (
        icon: Icons.assignment_return_outlined,
        label: 'Hoàn tiền',
        tabIndex: 4,
      ),
      (
        icon: Icons.cancel_outlined,
        label: 'Đã hủy',
        tabIndex: 5,
      ),
    ];

    return Container(
      padding: const EdgeInsets.only(top: 2, bottom: 14, left: 8, right: 8),
      color: isDarkMode ? AppColors.darkSurface : Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          for (final item in statuses)
            Expanded(
              child: Builder(
                builder: (context) {
                  final count = getCount(item.tabIndex);
                  return GestureDetector(
                    onTap: () =>
                        context.push('/account/orders?tab=${item.tabIndex}'),
                    behavior: HitTestBehavior.opaque,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: isDarkMode
                                    ? theme.colorScheme.primary.withAlpha(40)
                                    : theme.colorScheme.primary.withAlpha(12),
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: Icon(
                                item.icon,
                                size: 22,
                                color: theme.colorScheme.primary,
                              ),
                            ),
                            if (count > 0)
                              Positioned(
                                top: -4,
                                right: -6,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 5,
                                    vertical: 1.5,
                                  ),
                                  constraints: const BoxConstraints(minWidth: 16),
                                  decoration: BoxDecoration(
                                    color: theme.colorScheme.error,
                                    borderRadius: BorderRadius.circular(9),
                                    border: Border.all(
                                      color: isDarkMode
                                          ? AppColors.darkSurface
                                          : Colors.white,
                                      width: 1.5,
                                    ),
                                  ),
                                  child: Text(
                                    count > 99 ? '99+' : '$count',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: theme.colorScheme.onError,
                                      fontSize: 9,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Inter',
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Text(
                          item.label,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 11,
                            fontFamily: 'Inter',
                            color: theme.colorScheme.onSurface,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildProductStatusShortcutRow(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    final counts = ref.watch(sellerListingCountsProvider).value;

    final statuses = [
      (
        icon: Icons.storefront_outlined,
        label: 'Đang bán',
        statusKey: ListingStatus.active,
      ),
      (
        icon: Icons.hourglass_top_rounded,
        label: 'Chờ duyệt',
        statusKey: ListingStatus.pending,
      ),
      (
        icon: Icons.visibility_off_outlined,
        label: 'Đã ẩn',
        statusKey: ListingStatus.hidden,
      ),
      (
        icon: Icons.edit_note_rounded,
        label: 'Nháp',
        statusKey: ListingStatus.draft,
      ),
    ];

    return Container(
      padding: const EdgeInsets.only(top: 2, bottom: 14, left: 8, right: 8),
      color: isDarkMode ? AppColors.darkSurface : Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          for (final item in statuses)
            Expanded(
              child: Builder(
                builder: (context) {
                  final count = counts?[item.statusKey] ?? 0;
                  return GestureDetector(
                    onTap: () => context.push(
                      '/seller/products?status=${item.statusKey.value}',
                    ),
                    behavior: HitTestBehavior.opaque,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: isDarkMode
                                    ? theme.colorScheme.primary.withAlpha(40)
                                    : theme.colorScheme.primary.withAlpha(12),
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: Icon(
                                item.icon,
                                size: 22,
                                color: theme.colorScheme.primary,
                              ),
                            ),
                            if (count > 0)
                              Positioned(
                                top: -4,
                                right: -6,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 5,
                                    vertical: 1.5,
                                  ),
                                  constraints:
                                      const BoxConstraints(minWidth: 16),
                                  decoration: BoxDecoration(
                                    color: theme.colorScheme.error,
                                    borderRadius: BorderRadius.circular(9),
                                    border: Border.all(
                                      color: isDarkMode
                                          ? AppColors.darkSurface
                                          : Colors.white,
                                      width: 1.5,
                                    ),
                                  ),
                                  child: Text(
                                    count > 99 ? '99+' : '$count',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: theme.colorScheme.onError,
                                      fontSize: 9,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Inter',
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Text(
                          item.label,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 11,
                            fontFamily: 'Inter',
                            color: theme.colorScheme.onSurface,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildSellerOrderStatusShortcutRow(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    final sellerOrders = ref.watch(sellerAllOrdersProvider).value ?? [];

    int getCount(OrderState stateKey) {
      return sellerOrders.where((v) {
        final isCancelled = v.order.state == OrderState.cancelled ||
            v.order.cancelledAt != null;
        if (stateKey == OrderState.cancelled) return isCancelled;
        if (isCancelled) return false;

        final isDelivered =
            v.order.transport?.status == TransportStatus.delivered;
        final isCompleted = v.order.state == OrderState.completed ||
            v.order.receivedAt != null ||
            v.order.completedAt != null ||
            isDelivered;

        if (stateKey == OrderState.completed) return isCompleted;
        if (stateKey == OrderState.open) {
          return v.order.state == OrderState.open &&
              !isCompleted &&
              v.order.transport?.status != TransportStatus.returned;
        }
        return v.order.state == stateKey;
      }).length;
    }

    final statuses = [
      (
        icon: Icons.pending_actions_outlined,
        label: 'Chờ xác nhận',
        stateKey: OrderState.awaitingConfirmation,
      ),
      (
        icon: Icons.local_shipping_outlined,
        label: 'Đang xử lý',
        stateKey: OrderState.open,
      ),
      (
        icon: Icons.check_circle_outline_rounded,
        label: 'Hoàn thành',
        stateKey: OrderState.completed,
      ),
      (
        icon: Icons.cancel_outlined,
        label: 'Đã hủy',
        stateKey: OrderState.cancelled,
      ),
    ];

    return Container(
      padding: const EdgeInsets.only(top: 2, bottom: 14, left: 8, right: 8),
      color: isDarkMode ? AppColors.darkSurface : Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          for (final item in statuses)
            Expanded(
              child: Builder(
                builder: (context) {
                  final count = getCount(item.stateKey);
                  return GestureDetector(
                    onTap: () => context.push(
                      '/seller/orders?state=${item.stateKey.value}',
                    ),
                    behavior: HitTestBehavior.opaque,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: isDarkMode
                                    ? theme.colorScheme.primary.withAlpha(40)
                                    : theme.colorScheme.primary.withAlpha(12),
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: Icon(
                                item.icon,
                                size: 22,
                                color: theme.colorScheme.primary,
                              ),
                            ),
                            if (count > 0)
                              Positioned(
                                top: -4,
                                right: -6,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 5,
                                    vertical: 1.5,
                                  ),
                                  constraints:
                                      const BoxConstraints(minWidth: 16),
                                  decoration: BoxDecoration(
                                    color: theme.colorScheme.error,
                                    borderRadius: BorderRadius.circular(9),
                                    border: Border.all(
                                      color: isDarkMode
                                          ? AppColors.darkSurface
                                          : Colors.white,
                                      width: 1.5,
                                    ),
                                  ),
                                  child: Text(
                                    count > 99 ? '99+' : '$count',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: theme.colorScheme.onError,
                                      fontSize: 9,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Inter',
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Text(
                          item.label,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 11,
                            fontFamily: 'Inter',
                            color: theme.colorScheme.onSurface,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }

  String? _balanceLine() {
    final wallet = ref.watch(sellerWalletProvider).value;
    if (wallet == null) return null;

    final available = MoneyUtils.format(
      wallet.availableBalance,
      currency: wallet.currency,
    );
    if (wallet.heldBalance == 0) return 'Khả dụng $available';

    final held = MoneyUtils.format(
      wallet.heldBalance,
      currency: wallet.currency,
    );
    return 'Khả dụng $available · đang giữ $held';
  }

  Widget _buildHeader(BuildContext context, Me profile) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Row(
        children: [
          // Ảnh đại diện là lối vào trang công khai của chính mình — chỗ mà dòng
          // "Xem shop của tôi" từng chiếm một hàng menu để làm. Đổi ảnh chuyển
          // sang cái huy hiệu máy ảnh, vốn đã là glyph duy nhất nói "đổi ảnh":
          // hai việc khác nhau thì không thể dùng chung một vùng chạm.
          Stack(
            clipBehavior: Clip.none,
            children: [
              GestureDetector(
                onTap: () => context.push('/users/${profile.id}'),
                child: CircleAvatar(
                  radius: 32,
                  backgroundColor: isDarkMode
                      ? theme.colorScheme.surfaceContainerHighest
                      : const Color(0xFFEEEEEE),
                  backgroundImage: profile.avatarUrl != null
                      ? NetworkImage(profile.avatarUrl!)
                      : null,
                  child: profile.avatarUrl == null
                      ? Icon(
                          Icons.person_rounded,
                          size: 32,
                          color: theme.colorScheme.onSurfaceVariant,
                        )
                      : null,
                ),
              ),
              // Huy hiệu vẽ 16px nhưng vùng chạm phải là 40px: một nút 16px trên
              // ngón tay là một nút bấm mười lần trúng một. `Positioned` âm cho
              // phần đệm tràn ra ngoài, nên hình không hề to lên.
              Positioned(
                bottom: -12,
                right: -12,
                child: GestureDetector(
                  onTap: _isUploadingAvatar
                      ? null
                      : () => _pickAndUploadAvatar(profile),
                  behavior: HitTestBehavior.opaque,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        shape: BoxShape.circle,
                      ),
                      child: _isUploadingAvatar
                          ? SizedBox(
                              width: 10,
                              height: 10,
                              child: CircularProgressIndicator(
                                strokeWidth: 1.5,
                                color: theme.colorScheme.onPrimary,
                              ),
                            )
                          : Icon(
                              Icons.camera_alt_rounded,
                              size: 10,
                              color: theme.colorScheme.onPrimary,
                            ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),
          // Chạm vào mở Cài đặt — nơi có đủ sáu field và cả thẻ KYC. Trước đây
          // chỗ này mở một bottom sheet riêng với tập field lệch so với form
          // trong Trung tâm tài khoản, cùng gọi một endpoint; rồi mở Trung tâm
          // tài khoản, thứ giờ đã là mục đầu của Cài đặt.
          // Bọc cả phần chữ lẫn chevron: chevron là glyph duy nhất báo "chạm vào
          // đây", nên để nó nằm ngoài vùng chạm là chỗ chết đúng nơi người dùng
          // nhắm tới.
          Expanded(
            child: GestureDetector(
              onTap: () => context.push('/account/settings'),
              behavior: HitTestBehavior.opaque,
              child: Row(
                children: [
                  Expanded(child: _buildIdentity(context, profile)),
                  Icon(
                    Icons.chevron_right_rounded,
                    color: theme.colorScheme.onSurfaceVariant,
                    size: 22,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIdentity(BuildContext context, Me profile) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Text(
                profile.name.isNotEmpty
                    ? profile.name
                    : (profile.username ?? 'Chưa đặt tên'),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onSurface,
                  fontFamily: 'Manrope',
                ),
              ),
            ),
            if (profile.identityVerified) ...[
              const SizedBox(width: 4),
              const Icon(
                Icons.verified_rounded,
                size: 16,
                color: Color(0xFF10B981),
              ),
            ],
          ],
        ),
        const SizedBox(height: 2),
        Text(
          profile.email ?? profile.phone ?? 'Chưa liên kết email',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 13,
            color: theme.colorScheme.onSurfaceVariant,
            fontFamily: 'Inter',
          ),
        ),
      ],
    );
  }

  /// Một nhóm menu: nền liền, kẻ ngăn giữa các dòng và không kẻ ở đáy.
  Widget _buildGroup(BuildContext context, List<Widget> tiles) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final divider = Divider(
      height: 1,
      color: isDarkMode
          ? AppColors.darkPrimary.withAlpha(20)
          : const Color(0xFFF1F5F9),
      indent: 56,
    );

    // `Material`, không `Container(color:)`: một `ListTile` vẽ nền và vệt mực của
    // nó lên `Material` gần nhất, nên một hộp màu chen vào giữa sẽ che hết —
    // chín dòng menu không có phản hồi khi chạm, và framework assert đúng chỗ đó.
    final fullDivider = Divider(
      height: 1,
      color: isDarkMode
          ? AppColors.darkPrimary.withAlpha(20)
          : const Color(0xFFF1F5F9),
      indent: 0,
    );

    return Material(
      color: isDarkMode ? AppColors.darkSurface : Colors.white,
      child: Column(
        children: [
          for (var i = 0; i < tiles.length; i++) ...[
            tiles[i],
            if (i < tiles.length - 1 && tiles[i + 1] is! _ShortcutWrapper)
              tiles[i] is _ShortcutWrapper ? fullDivider : divider,
          ],
        ],
      ),
    );
  }

  Widget _buildError(BuildContext context, Object err) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline_rounded,
              size: 48,
              color: isDarkMode
                  ? const Color(0xFFEF4444)
                  : const Color(0xFFBA1A1A),
            ),
            const SizedBox(height: 16),
            Text(
              'Không thể tải thông tin cá nhân',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Inter',
                color: theme.colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              err.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: theme.colorScheme.onSurfaceVariant,
                fontSize: 13,
                fontFamily: 'Inter',
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              height: 48,
              width: 140,
              child: ElevatedButton(
                onPressed: () => ref.refresh(profileProvider),
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.primary,
                  foregroundColor: theme.colorScheme.onPrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Thử lại',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Inter',
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleLogout(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: isDarkMode ? AppColors.darkSurface : Colors.white,
        title: Text(
          'Đăng xuất',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Inter',
            color: theme.colorScheme.onSurface,
          ),
        ),
        content: Text(
          'Bạn có chắc chắn muốn đăng xuất tài khoản này?',
          style: TextStyle(
            fontFamily: 'Inter',
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              'Hủy',
              style: TextStyle(
                color: theme.colorScheme.onSurfaceVariant,
                fontFamily: 'Inter',
              ),
            ),
          ),
          TextButton(
            onPressed: () async {
              Navigator.of(context).pop();
              await ref.read(authProvider.notifier).logout();
              if (context.mounted) {
                context.go('/home');
              }
            },
            child: Text(
              'Đăng xuất',
              style: TextStyle(
                color: isDarkMode
                    ? const Color(0xFFEF4444)
                    : const Color(0xFFBA1A1A),
                fontFamily: 'Inter',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShimmer(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Shimmer.fromColors(
      baseColor: isDarkMode ? Colors.grey[800]! : const Color(0xFFF1F5F9),
      highlightColor: isDarkMode ? Colors.grey[700]! : const Color(0xFFF8FAFC),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 32,
                    backgroundColor: isDarkMode
                        ? AppColors.darkSurface
                        : Colors.white,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 140,
                          height: 20,
                          color: isDarkMode
                              ? AppColors.darkSurface
                              : Colors.white,
                        ),
                        const SizedBox(height: 8),
                        Container(
                          width: 180,
                          height: 14,
                          color: isDarkMode
                              ? AppColors.darkSurface
                              : Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Container(
              color: isDarkMode ? AppColors.darkSurface : Colors.white,
              height: 300,
            ),
          ],
        ),
      ),
    );
  }
}

class _ShortcutWrapper extends StatelessWidget {
  final Widget child;

  const _ShortcutWrapper({required this.child});

  @override
  Widget build(BuildContext context) => child;
}
