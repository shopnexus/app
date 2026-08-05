import 'package:flutter/material.dart';

import '../../../../core/utils/money_utils.dart';
import '../../data/models/chat_model.dart';

/// The negotiation card in a thread.
///
/// A system message's card is `{"offer_id": "ofr_…"}` and nothing else, so
/// everything here comes from the resolved [Offer] — the card renders the offer's
/// *current* state and never branches on how it got there. That is what stops a
/// counter-offer leaving yesterday's price on screen.
class ChatOfferCard extends StatelessWidget {
  const ChatOfferCard({
    super.key,
    required this.offer,
    required this.viewerIsBuyer,
    required this.viewerIsAuthor,
    this.onAccept,
    this.onCounter,
    this.onCancel,
    this.onCheckout,
  });

  /// Null while the offer is still being read — the card carried only an id.
  final Offer? offer;

  final bool viewerIsBuyer;

  /// Whoever owns the standing proposal can only withdraw it: the two sides
  /// alternate, so the price in front of you is always the other party's.
  final bool viewerIsAuthor;

  final VoidCallback? onAccept;
  final VoidCallback? onCounter;
  final VoidCallback? onCancel;
  final VoidCallback? onCheckout;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final resolved = offer;

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
      ),
      child: resolved == null
          ? _buildPlaceholder(theme)
          : _buildOffer(theme, resolved),
    );
  }

  Widget _buildPlaceholder(ThemeData theme) {
    return Row(
      children: [
        const SizedBox(
          width: 16,
          height: 16,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
        const SizedBox(width: 10),
        Text(
          'Đang tải thương lượng…',
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  Widget _buildOffer(ThemeData theme, Offer offer) {
    final total = MoneyUtils.format(offer.total, currency: offer.currency);
    final perUnit = MoneyUtils.format(
      offer.total ~/ offer.quantity,
      currency: offer.currency,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'THƯƠNG LƯỢNG GIÁ',
              style: theme.textTheme.labelSmall?.copyWith(
                color: theme.colorScheme.primary,
                letterSpacing: 0.8,
                fontWeight: FontWeight.bold,
                fontSize: 11,
              ),
            ),
            if (offer.quantity > 1)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainerHigh,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  'Số lượng: ${offer.quantity}',
                  style: theme.textTheme.labelSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 6),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            total,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onSurface,
            ),
          ),
        ),
        if (offer.quantity > 1)
          Text(
            '($perUnit / sản phẩm)',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        const SizedBox(height: 4),
        Text(
          viewerIsAuthor
              ? 'Bạn đang đề nghị mức giá này'
              : 'Đối phương đề nghị mức giá này',
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        if (offer.reason != null && offer.reason!.isNotEmpty) ...[
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerLow,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              '"${offer.reason}"',
              style: theme.textTheme.bodySmall?.copyWith(
                fontStyle: FontStyle.italic,
                color: theme.colorScheme.onSurfaceVariant,
                height: 1.3,
              ),
            ),
          ),
        ],
        const SizedBox(height: 14),
        ..._buildActions(theme, offer),
      ],
    );
  }

  /// One branch per *status*, never per transition.
  List<Widget> _buildActions(ThemeData theme, Offer offer) {
    switch (offer.status) {
      case OfferStatus.active:
        return viewerIsAuthor
            ? [
                _outlined(
                  theme,
                  label: 'Rút đề nghị',
                  icon: Icons.undo_rounded,
                  onPressed: onCancel,
                ),
                const SizedBox(height: 6),
                _note(theme, 'Đang chờ đối phương phản hồi.'),
              ]
            : [
                _filled(
                  theme,
                  label: 'Đồng ý mức giá này',
                  onPressed: onAccept,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: _outlined(
                        theme,
                        label: 'Trả giá',
                        icon: Icons.swap_horiz_rounded,
                        onPressed: onCounter,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _danger(
                        theme,
                        label: 'Từ chối',
                        onPressed: onCancel,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                _note(
                  theme,
                  'Đồng ý chưa phải là đặt hàng: giá được giữ trong ít phút để người mua tạo đơn.',
                ),
              ];

      case OfferStatus.accepted:
        return viewerIsBuyer
            ? [
                _filled(
                  theme,
                  label: 'Tạo đơn hàng ngay',
                  onPressed: onCheckout,
                ),
                const SizedBox(height: 6),
                _note(
                  theme,
                  'Giá được giữ đến ${_formatDeadline(offer.expiresAt)}. Bạn chọn đơn vị vận chuyển và thanh toán ở bước sau.',
                ),
              ]
            : [
                _badge(
                  theme,
                  icon: Icons.check_circle_rounded,
                  label: 'Đã thống nhất giá',
                  color: theme.colorScheme.primary,
                ),
                const SizedBox(height: 6),
                _note(theme, 'Đang chờ người mua tạo đơn và thanh toán.'),
              ];

      case OfferStatus.checkedOut:
        return [
          _badge(
            theme,
            icon: Icons.receipt_long_rounded,
            label: 'Đang thanh toán',
            color: theme.colorScheme.primary,
          ),
          const SizedBox(height: 6),
          _note(theme, 'Mức giá này đã được chốt vào một đơn hàng.'),
        ];

      case OfferStatus.cancelled:
        return [
          _badge(
            theme,
            icon: Icons.cancel_rounded,
            label: 'Đã huỷ hoặc hết hạn',
            color: theme.colorScheme.error,
          ),
          const SizedBox(height: 6),
          _note(theme, 'Hãy thương lượng lại nếu vẫn muốn mua.'),
        ];
    }
  }

  Widget _filled(
    ThemeData theme, {
    required String label,
    VoidCallback? onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 42,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: theme.colorScheme.primary,
          foregroundColor: theme.colorScheme.onPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
        ),
      ),
    );
  }

  Widget _outlined(
    ThemeData theme, {
    required String label,
    IconData? icon,
    VoidCallback? onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: OutlinedButton.icon(
        onPressed: onPressed,
        icon: icon == null ? null : Icon(icon, size: 18),
        label: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
          ),
        ),
        style: OutlinedButton.styleFrom(
          foregroundColor: theme.colorScheme.primary,
          side: BorderSide(color: theme.colorScheme.outline),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }

  Widget _danger(
    ThemeData theme, {
    required String label,
    VoidCallback? onPressed,
  }) {
    return SizedBox(
      height: 40,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: theme.colorScheme.errorContainer,
          foregroundColor: theme.colorScheme.onErrorContainer,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
          ),
        ),
      ),
    );
  }

  Widget _badge(
    ThemeData theme, {
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 18, color: color),
          const SizedBox(width: 6),
          Flexible(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                label,
                style: theme.textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _note(ThemeData theme, String text) {
    return Text(
      text,
      style: theme.textTheme.labelSmall?.copyWith(
        color: theme.colorScheme.onSurfaceVariant,
        height: 1.3,
      ),
    );
  }

  String _formatDeadline(DateTime expiresAt) {
    final local = expiresAt.toLocal();
    final hour = local.hour.toString().padLeft(2, '0');
    final minute = local.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }
}
