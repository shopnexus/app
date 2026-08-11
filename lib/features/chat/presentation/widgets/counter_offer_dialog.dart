import 'package:flutter/material.dart';

import 'package:shopnexus_flutter_app/core/utils/money_utils.dart';
import 'package:shopnexus_flutter_app/features/chat/data/models/chat_model.dart';

/// Revising the terms on the table. A negotiation is revised in place rather than
/// by stacking rows, so this always answers against an existing offer — which is
/// also where the currency and the quantity come from.
///
/// A buyer opens a negotiation from the listing page (`POST /offers`); the thread
/// only ever answers one.
class CounterOfferTerms {
  const CounterOfferTerms({
    required this.total,
    required this.quantity,
    this.reason,
  });

  /// Smallest currency unit, like every amount on the wire.
  final int total;
  final int quantity;
  final String? reason;
}

class CounterOfferDialog extends StatefulWidget {
  const CounterOfferDialog({
    super.key,
    required this.offer,
    this.askingUnitPrice,
  });

  final Offer offer;

  /// Giá niêm yết của biến thể đang thương lượng, và là trần của mọi mức giá gõ
  /// ở đây: thương lượng chỉ đi xuống, nên server trả 422 `offer_above_asking`
  /// cho một tổng vượt qua nó.
  ///
  /// Null khi người gọi không tra được — DTO của offer không mang giá niêm yết,
  /// nên nó là một lượt đọc riêng và lượt đọc đó có thể hỏng. Lúc đó hộp thoại
  /// không tự bịa ra một cái trần: server vẫn là chỗ giữ luật.
  final int? askingUnitPrice;

  static Future<CounterOfferTerms?> show(
    BuildContext context,
    Offer offer, {
    int? askingUnitPrice,
  }) {
    return showDialog<CounterOfferTerms>(
      context: context,
      builder: (_) =>
          CounterOfferDialog(offer: offer, askingUnitPrice: askingUnitPrice),
    );
  }

  @override
  State<CounterOfferDialog> createState() => _CounterOfferDialogState();
}

class _CounterOfferDialogState extends State<CounterOfferDialog> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _totalController = TextEditingController(
    text: widget.offer.total.toString(),
  );
  late final TextEditingController _reasonController = TextEditingController(
    text: widget.offer.reason,
  );
  late int _quantity = widget.offer.quantity;

  /// Trần của **tổng tiền**, vì ô nhập là tổng chứ không phải giá mỗi cái — cùng
  /// phép so sánh server làm. Đổi theo số lượng, nên nút cộng/trừ cũng phải chạy
  /// lại `validate`.
  int? get _ceiling {
    final unit = widget.askingUnitPrice;
    return unit == null || unit <= 0 ? null : unit * _quantity;
  }

  @override
  void dispose() {
    _totalController.dispose();
    _reasonController.dispose();
    super.dispose();
  }

  /// Số lượng đổi thì cái trần đổi theo, nên câu báo lỗi đang hiện phải được hỏi
  /// lại — không thì một tổng vừa hợp lệ vẫn đỏ, hoặc ngược lại.
  void _setQuantity(int delta) {
    setState(() => _quantity += delta);
    if (_ceiling != null) _formKey.currentState?.validate();
  }

  void _submit() {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    Navigator.of(context).pop(
      CounterOfferTerms(
        total: int.parse(_totalController.text.trim()),
        quantity: _quantity,
        reason: _reasonController.text.trim().isEmpty
            ? null
            : _reasonController.text.trim(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final currency = widget.offer.currency;

    return AlertDialog(
      title: const Text('Đề nghị mức giá khác'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Mức giá hiện tại: '
              '${MoneyUtils.format(widget.offer.total, currency: currency)}',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _totalController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Tổng tiền đề nghị ($currency)',
              ),
              validator: (value) {
                final parsed = int.tryParse(value?.trim() ?? '');
                if (parsed == null || parsed < 1) {
                  return 'Vui lòng nhập số tiền hợp lệ';
                }
                final ceiling = _ceiling;
                if (ceiling != null && parsed > ceiling) {
                  return 'Không cao hơn giá niêm yết '
                      '(${MoneyUtils.format(ceiling, currency: currency)} '
                      'cho $_quantity sản phẩm)';
                }
                return null;
              },
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: Text('Số lượng', style: theme.textTheme.bodyMedium),
                ),
                IconButton(
                  onPressed: _quantity > 1 ? () => _setQuantity(-1) : null,
                  icon: const Icon(Icons.remove_circle_outline),
                ),
                Text('$_quantity', style: theme.textTheme.titleMedium),
                IconButton(
                  onPressed: () => _setQuantity(1),
                  icon: const Icon(Icons.add_circle_outline),
                ),
              ],
            ),
            const SizedBox(height: 4),
            TextFormField(
              controller: _reasonController,
              maxLines: 3,
              minLines: 2,
              decoration: const InputDecoration(
                labelText: 'Lý do (không bắt buộc)',
                hintText: 'Hiển thị cạnh mức giá bạn đề nghị',
                alignLabelWithHint: true,
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Hủy'),
        ),
        FilledButton(onPressed: _submit, child: const Text('Gửi đề nghị')),
      ],
    );
  }
}
