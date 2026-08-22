import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:shopnexus_flutter_app/core/utils/deadline_utils.dart';
import 'package:shopnexus_flutter_app/core/utils/money_utils.dart';
import 'package:shopnexus_flutter_app/features/chat/data/models/chat_model.dart';

/// The negotiation card in a thread.
///
/// A system message's card is `{"offer_id": "ofr_…"}` and nothing else, so
/// everything here comes from the resolved [Offer] — the card renders the offer's
/// *current* state and never branches on how it got there. That is what stops a
/// counter-offer leaving yesterday's price on screen.
///
/// This card is the *only* home a negotiation has — there is no separate list
/// screen any more — so it carries what that screen used to: the listing being
/// haggled over, the other party, and the clock. An offer runs for 12 hours (30
/// minutes once agreed), and a deadline that does not tick is one people notice
/// after it has passed.
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
    this.onRenegotiate,
    this.onOpenListing,
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

  /// Re-opening a dead negotiation is a *new* offer, not an action on the old
  /// one, so it leads back to the listing page where `POST /offers` lives.
  final VoidCallback? onRenegotiate;

  /// Mở trang tin đang được mặc cả.
  ///
  /// Cái thẻ nói giá của *một tin đăng cụ thể*, mà cả ảnh lẫn tên tin trước đây
  /// đều không bấm được: người ta đang quyết có đồng ý một mức giá hay không mà
  /// không có đường nào xem lại thứ mình mua ngoài việc thoát cuộc trò chuyện đi
  /// tìm lại nó. Một hành động mở ra, không phải một hành động trên đề nghị, nên
  /// nó tách khỏi [onRenegotiate] dù hai chỗ dẫn tới cùng một trang.
  final VoidCallback? onOpenListing;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final resolved = offer;

    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        maxWidth: (screenWidth * 0.88).clamp(300.0, 390.0),
      ),
      padding: const EdgeInsets.all(16),
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
        _buildListing(theme, offer),
        const SizedBox(height: 12),
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
        if (offer.reason.isNotEmpty) ...[
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
        // A clock only means something while there is something left to lose: on an
        // offer already checked out or cancelled, its deadline is old news.
        if (offer.status == OfferStatus.active ||
            offer.status == OfferStatus.accepted) ...[
          const SizedBox(height: 10),
          _OfferCountdown(expiresAt: offer.expiresAt),
        ],
        const SizedBox(height: 14),
        ..._buildActions(theme, offer),
      ],
    );
  }

  /// The listing being haggled over, and with whom.
  ///
  /// One thread holds a single conversation but may carry offers on several
  /// listings, so "what is this price for" cannot be inferred from context — it
  /// has to be on the card itself.
  Widget _buildListing(ThemeData theme, Offer offer) {
    final row = _buildListingRow(theme, offer);
    if (onOpenListing == null) return row;

    return InkWell(
      onTap: onOpenListing,
      borderRadius: BorderRadius.circular(8),
      child: row,
    );
  }

  Widget _buildListingRow(ThemeData theme, Offer offer) {
    final cover = offer.listing.cover?.url;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: cover == null
              ? Container(
                  width: 44,
                  height: 44,
                  color: theme.colorScheme.surfaceContainerHighest,
                  child: Icon(
                    Icons.image_not_supported_outlined,
                    size: 16,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                )
              : CachedNetworkImage(
                  imageUrl: cover,
                  width: 44,
                  height: 44,
                  fit: BoxFit.cover,
                  placeholder: (_, _) => Container(
                    width: 44,
                    height: 44,
                    color: theme.colorScheme.surfaceContainerHighest,
                  ),
                  errorWidget: (_, _, _) => Container(
                    width: 44,
                    height: 44,
                    color: theme.colorScheme.surfaceContainerHighest,
                  ),
                ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                offer.listing.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  height: 1.25,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                'Với ${offer.counterparty.name}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.labelSmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
        // Chỉ hiện khi hàng này bấm được: một mũi chevron trên thứ không mở ra gì
        // là một lời hứa suông.
        if (onOpenListing != null)
          Padding(
            padding: const EdgeInsets.only(left: 4, top: 2),
            child: Icon(
              Icons.chevron_right_rounded,
              size: 18,
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
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
          const SizedBox(height: 8),
          // Only a buyer may open one: `POST /offers` is theirs.
          if (viewerIsBuyer)
            _outlined(
              theme,
              label: 'Thương lượng lại',
              icon: Icons.refresh_rounded,
              onPressed: onRenegotiate,
            )
          else
            _note(theme, 'Người mua có thể mở một đề nghị mới từ trang tin.'),
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
      height: 46,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: theme.colorScheme.primary,
          foregroundColor: theme.colorScheme.onPrimary,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          alignment: Alignment.center,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          label,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.bold,
            fontSize: 15,
            height: 1.2,
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
      height: 44,
      child: OutlinedButton.icon(
        onPressed: onPressed,
        icon: icon == null ? null : Icon(icon, size: 19),
        label: Text(
          label,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
            fontSize: 14,
            height: 1.2,
          ),
        ),
        style: OutlinedButton.styleFrom(
          foregroundColor: theme.colorScheme.primary,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
          alignment: Alignment.center,
          side: BorderSide(color: theme.colorScheme.outline),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
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
      height: 44,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: theme.colorScheme.errorContainer,
          foregroundColor: theme.colorScheme.onErrorContainer,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
          alignment: Alignment.center,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          label,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
            fontSize: 14,
            height: 1.2,
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
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 20, color: color),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.labelMedium?.copyWith(
                fontFamily: 'Inter',
                fontWeight: FontWeight.bold,
                fontSize: 13.5,
                color: color,
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

/// How long is left, counting itself down.
///
/// A thread is a screen people leave open: a label drawn once still reads "còn 2
/// giờ" long after the offer expired, with a button under it that no longer works.
/// Thirty seconds is fine — the label only resolves to minutes under the hour.
class _OfferCountdown extends StatefulWidget {
  const _OfferCountdown({required this.expiresAt});

  final DateTime expiresAt;

  @override
  State<_OfferCountdown> createState() => _OfferCountdownState();
}

class _OfferCountdownState extends State<_OfferCountdown> {
  Timer? _ticker;

  @override
  void initState() {
    super.initState();
    _ticker = Timer.periodic(
      const Duration(seconds: 30),
      (_) => setState(() {}),
    );
  }

  @override
  void dispose() {
    _ticker?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final label = DeadlineUtils.remaining(widget.expiresAt);
    if (label == null) return const SizedBox.shrink();

    // Dưới một giờ thì cái hạn mới là tin; trước đó nó chỉ là bối cảnh.
    final urgent = widget.expiresAt.difference(DateTime.now()).inMinutes < 60;
    final colour = urgent
        ? theme.colorScheme.error
        : theme.colorScheme.onSurfaceVariant;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.timer_outlined, size: 14, color: colour),
        const SizedBox(width: 4),
        Text(
          label,
          style: theme.textTheme.labelSmall?.copyWith(
            color: colour,
            fontWeight: urgent ? FontWeight.bold : FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
