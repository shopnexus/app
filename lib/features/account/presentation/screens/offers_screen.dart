import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:shopnexus_flutter_app/api/generated/model/offer.dart';
import 'package:shopnexus_flutter_app/api/generated/model/offer_status.dart';
import 'package:shopnexus_flutter_app/core/utils/money_utils.dart';
import 'package:shopnexus_flutter_app/features/account/data/repositories/account_repository.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/widgets/waiting_group.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/providers/account_provider.dart';

/// Những cuộc mặc cả, xếp theo ai đang giữ lượt.
///
/// Không có segment vai. Route trả cả hai chiều trong một danh sách — nó **luôn**
/// trả vậy, tham số `role` chưa từng được server đọc — nên "Tôi mua | Tôi bán" ở
/// đây từng là hai tab cho ra cùng một kết quả. Thứ thật sự phân loại là
/// `author_id`: ai đang giữ đề nghị trên bàn thì lượt **không** thuộc về họ.
///
/// Không có nút trả giá ở đây: thương lượng sống trong thread hai người đang nói
/// với nhau, và `chat_offer_card` đã làm đủ việc đó — chấp nhận, trả giá, huỷ,
/// thanh toán. Màn này là chỗ để không bỏ sót một cái đồng hồ, và một lối vào
/// thread. Thứ duy nhất nó thêm là **thương lượng lại** một cuộc đã chết, vì đó là
/// một đề nghị mới chứ không phải một hành động trên đề nghị cũ.
class OffersScreen extends ConsumerStatefulWidget {
  const OffersScreen({super.key});

  @override
  ConsumerState<OffersScreen> createState() => _OffersScreenState();
}

class _OffersScreenState extends ConsumerState<OffersScreen> {
  late Future<List<Offer>> _future;

  @override
  void initState() {
    super.initState();
    _future = ref.read(accountRepositoryProvider).offers(limit: 50);
  }

  Future<void> _reload() async {
    final next = ref.read(accountRepositoryProvider).offers(limit: 50);
    setState(() => _future = next);
    await next;
  }

  /// `active` và `accepted` là hai thứ còn sống; cái thứ hai chỉ giữ giá 30 phút.
  static bool _live(OfferStatus status) =>
      status == OfferStatus.active || status == OfferStatus.accepted;

  /// Lượt của ai. `author_id` là người đang giữ đề nghị, nên lượt là của bên kia —
  /// và một cuộc đã đồng giá thì lượt thuộc **người mua**, vì chỉ họ bấm thanh toán.
  WaitingSide _side(Offer offer, String? me) {
    if (!_live(offer.status)) return WaitingSide.done;
    if (offer.status == OfferStatus.accepted) {
      return offer.buyerId == me ? WaitingSide.you : WaitingSide.other;
    }
    return offer.authorId == me ? WaitingSide.other : WaitingSide.you;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // Id của chính mình, vì mọi câu "lượt của ai" đều so với nó. `profileProvider`
    // là nơi giữ tài khoản; auth chỉ giữ hai cái token.
    final me = ref.watch(profileProvider).value?.id;

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(title: const Text('Thương lượng')),
      body: RefreshIndicator(
        onRefresh: _reload,
        child: FutureBuilder<List<Offer>>(
          future: _future,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return _Empty(
                icon: Icons.wifi_off_rounded,
                title: 'Không tải được',
                action: TextButton(
                  onPressed: _reload,
                  child: const Text('Thử lại'),
                ),
              );
            }

            final offers = snapshot.data ?? const <Offer>[];
            if (offers.isEmpty) {
              return const _Empty(
                icon: Icons.handshake_outlined,
                title: 'Chưa có thương lượng nào',
                note:
                    'Trên một tin cho phép thương lượng, bạn có thể đề nghị '
                    'mức giá của mình.',
              );
            }

            final groups = <WaitingSide, List<Offer>>{
              for (final side in WaitingSide.values) side: [],
            };
            for (final offer in offers) {
              groups[_side(offer, me)]!.add(offer);
            }
            // Trong nhóm cần mình: hạn gần nhất lên trước. Đó là cả lý do nhóm này
            // tồn tại — thứ sắp mất phải ở trên cùng.
            groups[WaitingSide.you]!.sort(
              (a, b) => a.expiresAt.compareTo(b.expiresAt),
            );

            return ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.only(bottom: 24),
              children: [
                for (final side in WaitingSide.values)
                  if (groups[side]!.isNotEmpty) ...[
                    WaitingGroupHeader(side: side, count: groups[side]!.length),
                    for (final offer in groups[side]!)
                      _OfferRow(offer: offer, side: side, me: me),
                  ],
              ],
            );
          },
        ),
      ),
    );
  }
}

class _OfferRow extends StatelessWidget {
  const _OfferRow({required this.offer, required this.side, required this.me});

  final Offer offer;
  final WaitingSide side;
  final String? me;

  bool get _selling => offer.sellerId == me;

  /// Một câu nói việc, không một trạng thái. Vai nằm trong câu chứ không thành một
  /// cái nhãn riêng: "Trả lời đề nghị của Lan" đã cho biết đề nghị là của Lan.
  String get _line {
    final who = offer.counterparty.name;
    return switch (offer.status) {
      OfferStatus.active =>
        side == WaitingSide.you
            ? 'Trả lời đề nghị của $who'
            : 'Chờ $who trả lời',
      OfferStatus.accepted =>
        side == WaitingSide.you
            ? 'Đã đồng giá — tạo đơn và thanh toán'
            : 'Đã đồng giá — chờ $who thanh toán',
      OfferStatus.checkedOut => 'Đã thành đơn hàng',
      OfferStatus.cancelled => _selling ? 'Đã huỷ' : 'Đã huỷ hoặc quá hạn',
    };
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final remaining = side == WaitingSide.done
        ? null
        : remainingLabel(offer.expiresAt);
    final cover = offer.listing.cover?.url;

    return Opacity(
      opacity: side == WaitingSide.done ? 0.6 : 1,
      child: InkWell(
        // Vào thread, nơi thương lượng thật sự diễn ra — thẻ đề nghị ở đó có đủ
        // chấp nhận / trả giá / huỷ / thanh toán.
        onTap: () => context.push('/chat/${offer.counterparty.id}'),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: cover == null
                    ? Container(
                        width: 56,
                        height: 56,
                        color: theme.colorScheme.surfaceContainerHighest,
                        child: Icon(
                          Icons.image_not_supported_outlined,
                          size: 18,
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      )
                    : CachedNetworkImage(
                        imageUrl: cover,
                        width: 56,
                        height: 56,
                        fit: BoxFit.cover,
                        placeholder: (_, _) => Container(
                          color: theme.colorScheme.surfaceContainerHighest,
                        ),
                        errorWidget: (_, _, _) => Container(
                          color: theme.colorScheme.surfaceContainerHighest,
                        ),
                      ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      offer.listing.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      _line,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 12,
                        color: side == WaitingSide.you
                            ? theme.colorScheme.primary
                            : theme.colorScheme.onSurfaceVariant,
                        fontWeight: side == WaitingSide.you
                            ? FontWeight.w600
                            : FontWeight.normal,
                      ),
                    ),
                    if (remaining != null)
                      Text(
                        remaining,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: theme.colorScheme.error,
                        ),
                      ),
                    // Thương lượng lại là một đề nghị **mới**, không một hành động
                    // trên đề nghị cũ — nên nó dẫn về trang tin, nơi `POST /offers`
                    // được mở ra, chứ không gọi thẳng ở đây.
                    if (side == WaitingSide.done &&
                        offer.status == OfferStatus.cancelled &&
                        !_selling)
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: const Size(0, 32),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          onPressed: () =>
                              context.push('/home/product/${offer.listingId}'),
                          child: const Text('Thương lượng lại'),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    MoneyUtils.format(offer.total, currency: offer.currency),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (offer.quantity > 1)
                    Text(
                      '× ${offer.quantity}',
                      style: TextStyle(
                        fontSize: 12,
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Empty extends StatelessWidget {
  const _Empty({
    required this.icon,
    required this.title,
    this.note,
    this.action,
  });

  final IconData icon;
  final String title;
  final String? note;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 80, left: 32, right: 32),
          child: Column(
            children: [
              Icon(icon, size: 48, color: theme.colorScheme.onSurfaceVariant),
              const SizedBox(height: 12),
              Text(
                title,
                textAlign: TextAlign.center,
                style: theme.textTheme.titleMedium,
              ),
              if (note != null) ...[
                const SizedBox(height: 4),
                Text(
                  note!,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
              if (action != null) ...[const SizedBox(height: 12), action!],
            ],
          ),
        ),
      ],
    );
  }
}
