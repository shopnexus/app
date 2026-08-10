import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopnexus_flutter_app/api/generated/model/listing_detail.dart';
import 'package:shopnexus_flutter_app/api/generated/model/update_variant_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/variant.dart';
import 'package:shopnexus_flutter_app/core/utils/money_utils.dart';
import 'package:shopnexus_flutter_app/features/catalog/data/repositories/catalog_repository.dart';
import 'package:shopnexus_flutter_app/features/seller/data/repositories/seller_repository.dart';

/// Sửa giá và số lượng còn của một phiên bản.
///
/// Chỉ hai trường này, không phải "sửa tin": tên, ảnh, mô tả, danh mục thuộc
/// `PATCH /listings/{id}` — một màn khác chưa có. Còn giá và tồn là hai thứ người
/// bán đổi hằng tuần ("hạ giá", "hết size M"), và cho tới giờ họ phải xoá tin đăng
/// lại.
///
/// Số lượng là **tổng còn trên tay**, không phải cộng thêm: server từ chối nếu đặt
/// thấp hơn `reserved + sold`, nên một món đã có người giữ chỗ không thể bị hạ
/// xuống dưới cái đã hứa.
class EditVariantSheet extends ConsumerStatefulWidget {
  const EditVariantSheet({
    super.key,
    required this.listingId,
    required this.currency,
  });

  final String listingId;
  final String currency;

  /// Trả về true nếu có gì được lưu, để bên gọi nạp lại danh sách.
  static Future<bool?> show(
    BuildContext context, {
    required String listingId,
    required String currency,
  }) {
    return showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (_) =>
          EditVariantSheet(listingId: listingId, currency: currency),
    );
  }

  @override
  ConsumerState<EditVariantSheet> createState() => _EditVariantSheetState();
}

class _EditVariantSheetState extends ConsumerState<EditVariantSheet> {
  late final Future<ListingDetail> _future = ref
      .read(catalogRepositoryProvider)
      .listingDetail(widget.listingId);

  /// Phiên bản đang sửa. Hầu hết tin ở đây chỉ có một, nên mở sẵn nó thì không ai
  /// phải chọn một danh sách một dòng.
  Variant? _variant;
  final _price = TextEditingController();
  final _quantity = TextEditingController();
  bool _saving = false;
  String? _error;

  @override
  void dispose() {
    _price.dispose();
    _quantity.dispose();
    super.dispose();
  }

  void _select(Variant variant) {
    setState(() {
      _variant = variant;
      _price.text = variant.price.toString();
      _quantity.text = variant.stock.quantity.toString();
      _error = null;
    });
  }

  Future<void> _save() async {
    final variant = _variant;
    if (variant == null) return;

    final price = int.tryParse(_price.text.trim());
    final quantity = int.tryParse(_quantity.text.trim());
    if (price == null || price <= 0) {
      setState(() => _error = 'Giá phải là một số lớn hơn 0');
      return;
    }
    if (quantity == null || quantity < 0) {
      setState(() => _error = 'Số lượng phải là một số không âm');
      return;
    }
    // Chặn trước cái server sẽ chặn, vì câu ở đây nói được con số cụ thể.
    final committed = variant.stock.reserved + variant.stock.sold;
    if (quantity < committed) {
      setState(
        () => _error =
            'Không thể để dưới $committed: đã có người giữ chỗ hoặc đã bán.',
      );
      return;
    }

    setState(() {
      _saving = true;
      _error = null;
    });
    try {
      await ref
          .read(sellerRepositoryProvider)
          .updateVariant(
            variant.id,
            UpdateVariantRequest(price: price, quantity: quantity),
          );
      if (!mounted) return;
      Navigator.pop(context, true);
    } catch (error) {
      if (!mounted) return;
      setState(() {
        _saving = false;
        _error = _messageOf(error) ?? 'Không lưu được, thử lại sau';
      });
    }
  }

  static String? _messageOf(Object error) {
    final match = RegExp(
      r'"message"\s*:\s*"([^"]+)"',
    ).firstMatch(error.toString());
    return match?.group(1);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
        bottom: MediaQuery.viewInsetsOf(context).bottom + 20,
      ),
      child: FutureBuilder<ListingDetail>(
        future: _future,
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
              child: Center(child: Text('Không tải được tin đăng')),
            );
          }

          final variants = snapshot.data!.variants;
          if (variants.isEmpty) {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 40),
              child: Center(child: Text('Tin này chưa có phiên bản nào')),
            );
          }
          // Một tin một phiên bản là trường hợp thường: mở sẵn nó.
          if (_variant == null && variants.length == 1) {
            WidgetsBinding.instance.addPostFrameCallback(
              (_) => _select(variants.first),
            );
          }

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Giá & tồn kho',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  snapshot.data!.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 16),

                if (variants.length > 1) ...[
                  Text(
                    'Chọn phiên bản',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      for (final variant in variants)
                        ChoiceChip(
                          label: Text(_label(variant)),
                          selected: _variant?.id == variant.id,
                          onSelected: _saving ? null : (_) => _select(variant),
                        ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],

                if (_variant != null) ...[
                  TextField(
                    controller: _price,
                    enabled: !_saving,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      labelText: 'Giá (${widget.currency})',
                      border: const OutlineInputBorder(),
                      helperText: MoneyUtils.format(
                        int.tryParse(_price.text.trim()) ?? 0,
                        currency: widget.currency,
                      ),
                    ),
                    onChanged: (_) => setState(() {}),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _quantity,
                    enabled: !_saving,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      labelText: 'Tổng số còn trên tay',
                      border: const OutlineInputBorder(),
                      helperText:
                          'Đang giữ chỗ ${_variant!.stock.reserved} · '
                          'đã bán ${_variant!.stock.sold}',
                    ),
                  ),
                  if (_error != null) ...[
                    const SizedBox(height: 10),
                    Text(
                      _error!,
                      style: TextStyle(
                        fontSize: 13,
                        color: theme.colorScheme.error,
                      ),
                    ),
                  ],
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _saving ? null : _save,
                      child: Text(_saving ? 'Đang lưu…' : 'Lưu'),
                    ),
                  ),
                ],
              ],
            ),
          );
        },
      ),
    );
  }

  /// Tên phiên bản là các thuộc tính của nó ghép lại — không có trường `name`, vì
  /// "Đỏ / L" là thứ được tạo ra từ `attributes` chứ không phải người bán đặt.
  static String _label(Variant variant) {
    if (variant.attributes.isEmpty) return 'Mặc định';
    return variant.attributes.values.join(' / ');
  }
}
