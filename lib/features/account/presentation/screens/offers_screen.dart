import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:shopnexus_flutter_app/api/generated/model/offer.dart';
import 'package:shopnexus_flutter_app/api/generated/model/offer_status.dart';
import 'package:shopnexus_flutter_app/core/utils/deadline_utils.dart';
import 'package:shopnexus_flutter_app/core/utils/money_utils.dart';
import 'package:shopnexus_flutter_app/features/account/data/repositories/account_repository.dart';

/// Những cuộc mặc cả đang mở, hai vai trong một màn.
///
/// Nó tồn tại vì một đề nghị **có hạn 12 giờ** và trước đây chỉ tới được qua một
/// thẻ trong chat: cuộc trò chuyện bị đẩy xuống dưới là mất tăm một việc có đồng
/// hồ. Cùng hình dạng với màn Đơn hàng — một segment, hai nhóm — vì đây cũng là
/// câu hỏi "còn gì đang chờ tôi".
///
/// Không có nút trả giá ở đây: thương lượng sống trong thread mà hai người đang
/// nói với nhau, và một nút phản hồi tách khỏi ngữ cảnh đó là mời người ta chốt
/// giá mà không đọc lại đang bàn gì.
class OffersScreen extends ConsumerStatefulWidget {
  const OffersScreen({super.key});

  @override
  ConsumerState<OffersScreen> createState() => _OffersScreenState();
}

class _OffersScreenState extends ConsumerState<OffersScreen> {
  bool _selling = false;
  Future<List<Offer>>? _future;

  @override
  void initState() {
    super.initState();
    _load();
  }

  void _load() {
    _future = ref
        .read(accountRepositoryProvider)
        .offers(role: _selling ? 'seller' : 'buyer');
  }

  Future<void> _reload() async {
    setState(_load);
    await _future;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Thương lượng')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: SegmentedButton<bool>(
              segments: const [
                ButtonSegment(value: false, label: Text('Tôi mua')),
                ButtonSegment(value: true, label: Text('Tôi bán')),
              ],
              selected: {_selling},
              onSelectionChanged: (selection) {
                setState(() {
                  _selling = selection.first;
                  _load();
                });
              },
            ),
          ),
          Expanded(
            child: RefreshIndicator(
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
                  final live = [
                    for (final offer in offers)
                      if (_isLive(offer.status)) offer,
                  ];
                  final done = [
                    for (final offer in offers)
                      if (!_isLive(offer.status)) offer,
                  ];

                  if (offers.isEmpty) {
                    return const _Empty(
                      icon: Icons.handshake_outlined,
                      title: 'Chưa có thương lượng nào',
                      note: 'Trên một tin cho phép thương lượng, bạn có thể '
                          'đề nghị mức giá của mình.',
                    );
                  }

                  return ListView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.only(bottom: 24),
                    children: [
                      if (live.isNotEmpty) ...[
                        _GroupHeader(title: 'ĐANG THƯƠNG LƯỢNG'),
                        for (final offer in live)
                          _OfferRow(offer: offer, selling: _selling),
                      ],
                      if (done.isNotEmpty) ...[
                        _GroupHeader(title: 'ĐÃ XONG'),
                        for (final offer in done)
                          Opacity(
                            opacity: 0.6,
                            child: _OfferRow(offer: offer, selling: _selling),
                          ),
                      ],
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
      backgroundColor: theme.colorScheme.surface,
    );
  }

  /// `active` và `accepted` là hai thứ còn chờ ai đó: một cái chờ trả lời, một cái
  /// chờ người mua bấm thanh toán — và cái thứ hai chỉ giữ giá 30 phút.
  static bool _isLive(OfferStatus status) =>
      status == OfferStatus.active || status == OfferStatus.accepted;
}

class _OfferRow extends StatelessWidget {
  const _OfferRow({required this.offer, required this.selling});

  final Offer offer;
  final bool selling;

  static const _statusLabels = {
    OfferStatus.active: 'Đang chờ trả lời',
    OfferStatus.accepted: 'Đã đồng giá — chờ thanh toán',
    OfferStatus.checkedOut: 'Đã thanh toán',
    OfferStatus.cancelled: 'Đã hủy',
  };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final remaining = DeadlineUtils.remaining(offer.expiresAt);

    return ListTile(
      title: Text(
        MoneyUtils.format(offer.total, currency: 'VND'),
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(_statusLabels[offer.status] ?? offer.status.value),
          if (remaining != null &&
              _OffersScreenState._isLive(offer.status))
            Text(
              remaining,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: theme.colorScheme.error,
              ),
            ),
          if (offer.reason.isNotEmpty)
            Text(
              offer.reason,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 12,
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
        ],
      ),
      trailing: const Icon(Icons.chevron_right_rounded),
      // Vào thread, nơi thương lượng thật sự diễn ra. Id đối phương suy từ vai:
      // ở vai mua thì người kia là người bán, và ngược lại.
      onTap: () => context.push(
        '/chat/${selling ? offer.buyerId : offer.sellerId}',
      ),
    );
  }
}

class _GroupHeader extends StatelessWidget {
  const _GroupHeader({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.6,
          color: theme.colorScheme.onSurfaceVariant,
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
