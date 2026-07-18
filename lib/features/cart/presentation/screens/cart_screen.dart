import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/money_utils.dart';
import '../../data/models/cart_model.dart';
import '../providers/cart_provider.dart';
import '../../../checkout/presentation/providers/checkout_provider.dart';
import '../../../checkout/data/models/checkout_model.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartState = ref.watch(cartProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F7), // Warm Off-white
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Your Bag'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
          onPressed: () => context.pop(),
        ),
        actions: [
          if (cartState.items.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Center(
                child: Text(
                  '${cartState.items.length} items',
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
            ),
        ],
      ),
      body: _buildBody(context, ref, cartState),
    );
  }

  Widget _buildBody(BuildContext context, WidgetRef ref, CartState state) {
    if (state.isLoading && state.items.isEmpty) {
      return _buildShimmerLoading();
    }

    if (state.errorMessage != null && state.items.isEmpty) {
      return _buildErrorState(ref, state.errorMessage!);
    }

    if (state.items.isEmpty) {
      return _buildEmptyState(context);
    }

    return Column(
      children: [
        Expanded(
          child: RefreshIndicator(
            color: AppColors.primary,
            onRefresh: () => ref.read(cartProvider.notifier).fetchCart(),
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              itemCount: state.items.length,
              itemBuilder: (context, index) {
                final item = state.items[index];
                return _buildCartItem(
                  ref,
                  item,
                  state.preferredCurrency,
                  state.rates,
                );
              },
            ),
          ),
        ),
        _buildOrderSummary(context, ref, state),
      ],
    );
  }

  Widget _buildShimmerLoading() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 3,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            margin: const EdgeInsets.only(bottom: 16),
            height: 120,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        );
      },
    );
  }

  Widget _buildErrorState(WidgetRef ref, String error) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline_rounded,
              size: 64,
              color: Color(0xFFBA1A1A),
            ),
            const SizedBox(height: 16),
            Text(
              error,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 16,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => ref.read(cartProvider.notifier).fetchCart(),
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                color: Color(0xFFEEEEEC),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.shopping_bag_outlined,
                size: 64,
                color: AppColors.accent,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Your Bag is Empty',
              style: TextStyle(
                fontFamily: 'Manrope',
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Looks like you haven\'t added anything to your bag yet. Let\'s explore the marketplace!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 14,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () => context.go('/home'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('Go Shopping'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCartItem(
    WidgetRef ref,
    CartItem item,
    String preferredCurrency,
    Map<String, double> rates,
  ) {
    // Tính giá quy đổi của item đơn lẻ
    double convertedPrice = item.sku.price.toDouble();
    if (item.currency.toUpperCase() != preferredCurrency.toUpperCase()) {
      double priceInUsd = item.sku.price.toDouble();
      if (item.currency.toUpperCase() == 'USD') {
        priceInUsd = item.sku.price / 100.0;
      } else {
        final origRate = rates[item.currency.toUpperCase()] ?? 1.0;
        priceInUsd = item.sku.price / origRate;
      }
      final prefRate = rates[preferredCurrency.toUpperCase()] ?? 1.0;
      double converted = priceInUsd * prefRate;
      convertedPrice = preferredCurrency.toUpperCase() == 'USD'
          ? converted * 100.0
          : converted;
    }

    final priceDisplay = MoneyUtils.formatWithConversion(
      item.sku.price,
      originalCurrency: item.currency,
      preferredCurrency: preferredCurrency,
      exchangeRate:
          convertedPrice /
          (item.sku.price.toDouble() == 0 ? 1.0 : item.sku.price.toDouble()),
    );

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E3E0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(8),
            offset: const Offset(0, 4),
            blurRadius: 16.0,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Thumbnail Image
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              imageUrl: item.resource?.url ?? '',
              width: 90,
              height: 110,
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                color: const Color(0xFFF4F4F1),
                child: const Center(
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
              errorWidget: (context, url, error) => Container(
                color: const Color(0xFFF4F4F1),
                child: const Icon(
                  Icons.image_not_supported_outlined,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          // Product Info wrapped in SizedBox to support height property
          Expanded(
            child: SizedBox(
              height: 110,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              item.sku.name.isNotEmpty
                                  ? item.sku.name
                                  : 'Product Sku',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: AppColors.textPrimary,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => ref
                                .read(cartProvider.notifier)
                                .removeItem(item.sku.id),
                            child: const Icon(
                              Icons.close_rounded,
                              size: 20,
                              color: Color(0xFF6E7977),
                            ),
                          ),
                        ],
                      ),
                      if (item.sku.attributes != null &&
                          item.sku.attributes!.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Text(
                            item.sku.attributes!
                                .map((attr) => '${attr.key}: ${attr.value}')
                                .join(' | '),
                            style: const TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 12,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ),
                    ],
                  ),
                  // Price & Quantity control
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Text(
                          priceDisplay,
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                      // Quantity pill selector
                      Container(
                        height: 32,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF4F4F1),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: const Color(0xFFE2E3E0)),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove, size: 14),
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(
                                minWidth: 28,
                                minHeight: 28,
                              ),
                              onPressed: () => ref
                                  .read(cartProvider.notifier)
                                  .updateQuantity(item.sku.id, -1),
                            ),
                            Text(
                              '${item.quantity}',
                              style: const TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: AppColors.textPrimary,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.add, size: 14),
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(
                                minWidth: 28,
                                minHeight: 28,
                              ),
                              onPressed: () => ref
                                  .read(cartProvider.notifier)
                                  .updateQuantity(item.sku.id, 1),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderSummary(
    BuildContext context,
    WidgetRef ref,
    CartState state,
  ) {
    final subtotalFormatted = MoneyUtils.format(
      state.calculatedTotal,
      currency: state.preferredCurrency,
    );

    return Container(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
        bottom: 20 + MediaQuery.of(context).padding.bottom,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(12),
            offset: const Offset(0, -6),
            blurRadius: 24.0,
          ),
        ],
        border: const Border(top: BorderSide(color: Color(0xFFE2E3E0))),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Price Breakdown
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Subtotal',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  color: AppColors.textSecondary,
                ),
              ),
              Text(
                subtotalFormatted,
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Shipping',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  color: AppColors.textSecondary,
                ),
              ),
              Text(
                'Showed when Checkout',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(color: Color(0xFFE2E3E0), height: 1),
          const SizedBox(height: 16),
          // Total Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total',
                style: TextStyle(
                  fontFamily: 'Manrope',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              Text(
                subtotalFormatted,
                style: const TextStyle(
                  fontFamily: 'Manrope',
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Checkout CTA
          SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton(
              onPressed: () {
                // Đóng gói items chuyển tiếp sang Checkout
                final checkoutItems = state.items.map((item) {
                  return CheckoutItem(
                    skuId: item.sku.id,
                    quantity: item.quantity,
                    transportOption: 'Standard', // Giá trị mặc định khi bắt đầu
                  );
                }).toList();

                ref
                    .read(checkoutProvider.notifier)
                    .initialize(
                      items: checkoutItems,
                      resolvedItems: state.items,
                      buyNow: false,
                    );

                context.push('/checkout');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Proceed to Checkout'),
                  SizedBox(width: 8),
                  Icon(Icons.arrow_forward_rounded, size: 20),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.lock_outline_rounded,
                size: 14,
                color: AppColors.textSecondary,
              ),
              SizedBox(width: 4),
              Text(
                'Secure Checkout',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 12,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
