import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopnexus_flutter_app/api/generated/model/option_category_name.dart';
import 'package:shopnexus_flutter_app/api/generated/model/transport.dart';
import 'package:shopnexus_flutter_app/api/generated/model/transport_status.dart';
import 'package:shopnexus_flutter_app/core/providers/option_names_provider.dart';
import 'package:shopnexus_flutter_app/features/account/data/repositories/account_repository.dart';

/// "Hàng tôi đang ở đâu" — câu hỏi hay gặp nhất của một người vừa trả tiền, và cho
/// tới giờ app không trả lời được ở đâu cả.
///
/// Trạng thái do **đơn vị vận chuyển** báo, không do người bán: từ hôm nay chỉ
/// webhook của họ (và moderator khi sửa) mới ghi được nó. Sheet nói ra điều đó, vì
/// nó là lý do người mua tin cái mốc đang đọc.
class TransportJourneySheet extends ConsumerWidget {
  const TransportJourneySheet({super.key, required this.orderId});

  final String orderId;

  static Future<void> show(BuildContext context, {required String orderId}) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (_) => TransportJourneySheet(orderId: orderId),
    );
  }

  /// Thứ tự các mốc, để vẽ cái nào đã qua. Ba kết cục không nằm trong dãy này: một
  /// kiện có thể thất bại trước cả khi được lấy hàng.
  static const _ladder = [
    TransportStatus.pending,
    TransportStatus.pickedUp,
    TransportStatus.inTransit,
    TransportStatus.delivered,
  ];

  static const _labels = {
    TransportStatus.pending: 'Chờ lấy hàng',
    TransportStatus.pickedUp: 'Đã lấy hàng',
    TransportStatus.inTransit: 'Đang trên đường',
    TransportStatus.delivered: 'Đã giao',
    TransportStatus.returned: 'Đã trả về người gửi',
    TransportStatus.failed: 'Giao thất bại',
    TransportStatus.cancelled: 'Vận chuyển đã hủy',
  };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(20),
      child: FutureBuilder<Transport>(
        future: ref.read(accountRepositoryProvider).orderTransport(orderId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 40),
              child: Center(child: CircularProgressIndicator()),
            );
          }
          if (snapshot.hasError || snapshot.data == null) {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 40),
              child: Center(child: Text('Không tải được hành trình')),
            );
          }

          final transport = snapshot.data!;
          final reached = _ladder.indexOf(transport.status);
          final offLadder = reached < 0;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Hành trình kiện hàng',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Do ${ref.watch(optionNamesProvider(OptionCategoryName.transport)).nameOf(transport.option)} cập nhật.',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 20),

              if (offLadder)
                // Một kết cục ngoài dãy: vẽ nó một mình thì thật thà hơn là tô
                // xong nửa dãy rồi để người đọc tự đoán chuyện gì đã xảy ra.
                _Step(
                  label: _labels[transport.status] ?? transport.status.value,
                  done: true,
                  isOutcome: true,
                )
              else
                for (var index = 0; index < _ladder.length; index++)
                  _Step(
                    label: _labels[_ladder[index]]!,
                    done: index <= reached,
                    isLast: index == _ladder.length - 1,
                  ),

              const SizedBox(height: 12),
              Text(
                // Nói ra ai là nguồn của thông tin này — đó là điều làm nó đáng tin.
                'Trạng thái do đơn vị giao hàng báo về. Nếu bạn thấy sai, hãy '
                'báo để ShopNexus kiểm tra.',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _Step extends StatelessWidget {
  const _Step({
    required this.label,
    required this.done,
    this.isLast = false,
    this.isOutcome = false,
  });

  final String label;
  final bool done;
  final bool isLast;
  final bool isOutcome;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colour = done
        ? (isOutcome ? theme.colorScheme.error : theme.colorScheme.primary)
        : theme.colorScheme.outlineVariant;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Icon(
              done ? Icons.check_circle_rounded : Icons.circle_outlined,
              size: 20,
              color: colour,
            ),
            if (!isLast && !isOutcome)
              Container(width: 2, height: 24, color: colour),
          ],
        ),
        const SizedBox(width: 12),
        Padding(
          padding: const EdgeInsets.only(top: 1),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: done ? FontWeight.w600 : FontWeight.normal,
              color: done
                  ? theme.colorScheme.onSurface
                  : theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      ],
    );
  }
}
