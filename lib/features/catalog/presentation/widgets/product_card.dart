import 'package:flutter/material.dart';
import '../../../../shared/widgets/shared_product_card.dart';
import '../../data/models/catalog_model.dart';

/// The feed card plus what only a geo browse knows: how far the goods are.
/// `distance_km` arrives only when the browse sent a position, so no badge means
/// "not asked", never "far away".
class CatalogProductCard extends StatelessWidget {
  final TProductCard product;
  final VoidCallback? onTap;
  final double aspectRatio;
  final bool isFavorite;
  final VoidCallback? onFavoriteTap;
  final bool showFavoriteButton;
  final bool showVendor;

  const CatalogProductCard({
    super.key,
    required this.product,
    this.onTap,
    this.aspectRatio = 1.0,
    this.isFavorite = false,
    this.onFavoriteTap,
    this.showFavoriteButton = false,
    this.showVendor = true,
  });

  @override
  Widget build(BuildContext context) {
    // SharedProductCard reads the legacy `is_negotiable` flag; the API only ever
    // says `price_mode`. Normalising here keeps the "Thương lượng" chip honest
    // without reaching into shared code.
    final card = SharedProductCard(
      product: product.effectiveIsNegotiable && !product.isNegotiable
          ? product.copyWith(isNegotiable: true)
          : product,
      onTap: onTap,
      aspectRatio: aspectRatio,
      isFavorite: isFavorite,
      onFavoriteTap: onFavoriteTap,
      showFavoriteButton: showFavoriteButton,
      showVendor: showVendor,
    );

    final distanceKm = product.distanceKm;
    if (distanceKm == null) return card;

    return Stack(
      children: [
        card,
        // Top-left: the favourite button owns the top-right corner.
        Positioned(
          top: 8.0,
          left: 8.0,
          child: _DistanceBadge(distanceKm: distanceKm),
        ),
      ],
    );
  }
}

class _DistanceBadge extends StatelessWidget {
  final double distanceKm;

  const _DistanceBadge({required this.distanceKm});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: Colors.black.withAlpha(140),
        borderRadius: BorderRadius.circular(9999.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.near_me_rounded, size: 11, color: Colors.white),
          const SizedBox(width: 4.0),
          Text(
            'Cách ${_formatDistance(distanceKm)}',
            style: theme.textTheme.labelSmall?.copyWith(
              fontFamily: 'Inter',
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

/// Vietnamese decimal comma, and metres below a kilometre — "0,4 km" reads as
/// less precise than it is.
String _formatDistance(double distanceKm) {
  if (distanceKm < 1) {
    return '${(distanceKm * 1000).round()} m';
  }
  if (distanceKm < 10) {
    return '${distanceKm.toStringAsFixed(1).replaceAll('.', ',')} km';
  }
  return '${distanceKm.round()} km';
}
