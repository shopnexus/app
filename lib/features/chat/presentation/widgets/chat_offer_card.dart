import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../data/models/chat_model.dart';

class ChatOfferCard extends StatelessWidget {
  final ChatMessage message;
  final Function(OfferStatus status)? onRespondToOffer;
  final VoidCallback? onCounterOffer;

  const ChatOfferCard({
    super.key,
    required this.message,
    this.onRespondToOffer,
    this.onCounterOffer,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final metadata = message.metadata;
    final isMe = message.isMe;
    final currencyFormatter = NumberFormat.currency(
      symbol: '\$',
      decimalDigits: 2,
    );

    final offerPrice = metadata?.offerPrice ?? 0.0;
    final originalPrice =
        metadata?.offerOriginalPrice ?? metadata?.productPrice;
    final quantity = metadata?.quantity ?? 1;
    final totalOfferPrice = offerPrice * quantity;
    final offerStatus = metadata?.offerStatus ?? OfferStatus.pending;
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        maxWidth: (screenWidth * 0.84).clamp(280.0, 350.0),
      ),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: theme.colorScheme.outlineVariant.withValues(alpha: 0.5),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Thông tin sản phẩm (Product header)
          if (metadata?.productTitle != null || metadata?.productImage != null)
            Row(
              children: [
                if (metadata?.productImage != null &&
                    metadata!.productImage!.isNotEmpty)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                      imageUrl: metadata.productImage!,
                      width: 52,
                      height: 52,
                      fit: BoxFit.cover,
                      errorWidget: (context, url, error) => Container(
                        width: 52,
                        height: 52,
                        color: theme.colorScheme.surfaceContainerHighest,
                        child: const Icon(Icons.shopping_bag_outlined),
                      ),
                    ),
                  ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'PRODUCT',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                          letterSpacing: 1.0,
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        metadata?.productTitle ?? 'Sản phẩm',
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          height: 1.2,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),

          const SizedBox(height: 12),

          // Banner trạng thái: "YOUR OFFER SENT" hoặc "NEW OFFER RECEIVED"
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                isMe ? 'YOUR OFFER SENT' : 'NEW OFFER RECEIVED',
                style: theme.textTheme.labelSmall?.copyWith(
                  color: isMe
                      ? theme.colorScheme.primary
                      : theme.colorScheme.secondary,
                  letterSpacing: 0.8,
                  fontWeight: FontWeight.bold,
                  fontSize: 11,
                ),
              ),
              if (quantity > 1)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surfaceContainerHigh,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    'Quantity: $quantity',
                    style: theme.textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 4),

          // Giá đề nghị & Tổng giá trị
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 8,
            runSpacing: 4,
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  quantity > 1
                      ? currencyFormatter.format(totalOfferPrice)
                      : currencyFormatter.format(offerPrice),
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
              ),
              if (originalPrice != null && originalPrice > offerPrice)
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    currencyFormatter.format(originalPrice * quantity),
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ),
            ],
          ),

          if (quantity > 1) ...[
            const SizedBox(height: 2),
            Text(
              '(${currencyFormatter.format(offerPrice)} each)',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],

          // Lời nhắn đề nghị
          if (metadata?.offerNote != null &&
              metadata!.offerNote!.isNotEmpty) ...[
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainerLow,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                '"${metadata.offerNote}"',
                style: theme.textTheme.bodySmall?.copyWith(
                  fontStyle: FontStyle.italic,
                  color: theme.colorScheme.onSurfaceVariant,
                  height: 1.3,
                ),
              ),
            ),
          ],

          const SizedBox(height: 14),

          // Nút thao tác theo trạng thái Offer
          if (offerStatus == OfferStatus.pending) ...[
            if (!isMe) ...[
              // Người nhận đề nghị -> Chấp nhận, Thương lượng, Từ chối
              SizedBox(
                width: double.infinity,
                height: 42,
                child: ElevatedButton(
                  onPressed: () => onRespondToOffer?.call(OfferStatus.accepted),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.primary,
                    foregroundColor: theme.colorScheme.onPrimary,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'Accept Offer',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 40,
                      child: OutlinedButton(
                        onPressed: onCounterOffer,
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          side: BorderSide(color: theme.colorScheme.outline),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            'Counter Offer',
                            style: TextStyle(
                              color: theme.colorScheme.primary,
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: SizedBox(
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () =>
                            onRespondToOffer?.call(OfferStatus.declined),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          backgroundColor: theme.colorScheme.errorContainer,
                          foregroundColor: theme.colorScheme.onErrorContainer,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            'Decline',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ] else ...[
              // Người tạo lời đề nghị -> Rút lời đề nghị
              SizedBox(
                width: double.infinity,
                height: 40,
                child: OutlinedButton.icon(
                  onPressed: () =>
                      onRespondToOffer?.call(OfferStatus.withdrawn),
                  icon: const Icon(Icons.undo_rounded, size: 18),
                  label: const Text('Withdraw Offer'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: theme.colorScheme.outline,
                    side: BorderSide(
                      color: theme.colorScheme.outline.withValues(alpha: 0.5),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ],
          ] else ...[
            // Status Badge sau khi xử lý (Accepted / Declined / Withdrawn)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              decoration: BoxDecoration(
                color: offerStatus == OfferStatus.accepted
                    ? Colors.green.withValues(alpha: 0.12)
                    : offerStatus == OfferStatus.declined
                    ? theme.colorScheme.errorContainer.withValues(alpha: 0.5)
                    : theme.colorScheme.surfaceContainerHigh,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    offerStatus == OfferStatus.accepted
                        ? Icons.check_circle_rounded
                        : offerStatus == OfferStatus.declined
                        ? Icons.cancel_rounded
                        : Icons.info_outline_rounded,
                    size: 18,
                    color: offerStatus == OfferStatus.accepted
                        ? Colors.green.shade700
                        : offerStatus == OfferStatus.declined
                        ? theme.colorScheme.error
                        : theme.colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(width: 6),
                  Flexible(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        offerStatus == OfferStatus.accepted
                            ? 'Offer Accepted'
                            : offerStatus == OfferStatus.declined
                            ? 'Offer Declined'
                            : 'Offer Withdrawn',
                        style: theme.textTheme.labelMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: offerStatus == OfferStatus.accepted
                              ? Colors.green.shade800
                              : offerStatus == OfferStatus.declined
                              ? theme.colorScheme.error
                              : theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
