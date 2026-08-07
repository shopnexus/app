import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopnexus_flutter_app/api/generated/model/listing_condition.dart';
import 'package:shopnexus_flutter_app/api/generated/model/listing_detail.dart';
import 'package:shopnexus_flutter_app/api/generated/model/price_mode.dart';
import 'package:shopnexus_flutter_app/features/seller/data/models/listing_draft.dart';
import 'package:shopnexus_flutter_app/features/seller/data/models/listing_edit.dart';
import 'package:shopnexus_flutter_app/features/seller/presentation/providers/listing_edit_provider.dart';

/// Sửa nội dung một tin đã đăng.
///
/// Cho tới giờ app không có màn này: `updateListing` nằm sẵn trong repository mà
/// không widget nào gọi, nên muốn đổi một chữ trong tiêu đề người bán phải **xoá
/// tin rồi đăng lại** — mất hết đánh giá, lượt lưu và tuổi của tin.
///
/// Không có giá và tồn kho ở đây: chúng thuộc variant, sửa bằng một route khác,
/// và đã có sheet riêng. Một nút "Lưu" gọi hai route là một nút mà khi nửa sau
/// hỏng thì người bán không biết nửa nào đã lưu.
class ListingEditScreen extends ConsumerStatefulWidget {
  const ListingEditScreen({super.key, required this.listingId});

  final String listingId;

  @override
  ConsumerState<ListingEditScreen> createState() => _ListingEditScreenState();
}

class _ListingEditScreenState extends ConsumerState<ListingEditScreen> {
  ListingEdit? _before;
  ListingEdit? _draft;
  final _tagController = TextEditingController();

  @override
  void dispose() {
    _tagController.dispose();
    super.dispose();
  }

  /// Dựng form từ tin đọc về, đúng một lần: nạp lại sau mỗi lần gõ sẽ xoá những
  /// gì đang gõ dở.
  void _seed(ListingDetail listing) {
    if (_before != null) return;
    final edit = ListingEdit.of(listing);
    _before = edit;
    _draft = edit;
  }

  Future<void> _save(ListingDetail listing) async {
    final saved = await ref
        .read(listingEditActionsProvider.notifier)
        .save(widget.listingId, _before!, _draft!);
    if (!mounted) return;

    if (saved == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Bạn chưa thay đổi gì.')),
      );
      return;
    }
    if (saved) {
      Navigator.pop(context, true);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            editNeedsReview(listing.status)
                ? 'Đã gửi. Tin sẽ hiện lại sau khi được duyệt.'
                : 'Đã lưu thay đổi.',
          ),
        ),
      );
      return;
    }
    final message =
        ref.read(listingEditActionsProvider).errorMessage ?? 'Không lưu được';
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    final listing = ref.watch(listingToEditProvider(widget.listingId));
    final saving = ref.watch(listingEditActionsProvider).isSaving;

    return Scaffold(
      appBar: AppBar(title: const Text('Sửa tin')),
      body: switch (listing) {
        AsyncError() => _Retry(
          onRetry: () =>
              ref.invalidate(listingToEditProvider(widget.listingId)),
        ),
        AsyncData(:final value) => _form(value, saving),
        _ => const Center(child: CircularProgressIndicator()),
      },
    );
  }

  Widget _form(ListingDetail listing, bool saving) {
    _seed(listing);
    final theme = Theme.of(context);
    final draft = _draft!;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        if (editNeedsReview(listing.status)) ...[
          // Nói trước, không để họ phát hiện khi tin đã rời khỏi sàn.
          Card(
            color: theme.colorScheme.tertiaryContainer,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Icon(
                    Icons.gavel_outlined,
                    color: theme.colorScheme.onTertiaryContainer,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Tin đang được bán. Sau khi lưu, tin sẽ tạm ẩn để chờ '
                      'kiểm duyệt lại rồi mới hiện ra.',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onTertiaryContainer,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],

        TextFormField(
          initialValue: draft.name,
          enabled: !saving,
          maxLength: 200,
          decoration: const InputDecoration(
            labelText: 'Tiêu đề',
            border: OutlineInputBorder(),
          ),
          onChanged: (value) =>
              setState(() => _draft = draft.copyWith(name: value)),
        ),
        const SizedBox(height: 12),

        TextFormField(
          initialValue: draft.description,
          enabled: !saving,
          maxLines: 6,
          decoration: const InputDecoration(
            labelText: 'Mô tả',
            alignLabelWithHint: true,
            border: OutlineInputBorder(),
          ),
          onChanged: (value) =>
              setState(() => _draft = draft.copyWith(description: value)),
        ),
        const SizedBox(height: 20),

        Text('Danh mục', style: theme.textTheme.titleSmall),
        const SizedBox(height: 6),
        _CategoryPicker(
          value: draft.categoryId,
          enabled: !saving,
          onChanged: (id) =>
              setState(() => _draft = draft.copyWith(categoryId: id)),
        ),
        const SizedBox(height: 20),

        Text('Tình trạng', style: theme.textTheme.titleSmall),
        const SizedBox(height: 6),
        SegmentedButton<ListingCondition>(
          segments: const [
            ButtonSegment(value: ListingCondition.new_, label: Text('Mới')),
            ButtonSegment(value: ListingCondition.used, label: Text('Đã dùng')),
            ButtonSegment(
              value: ListingCondition.damaged,
              label: Text('Có lỗi'),
            ),
          ],
          selected: {draft.condition},
          onSelectionChanged: saving
              ? null
              : (selected) => setState(
                  () => _draft = draft.copyWith(condition: selected.first),
                ),
        ),
        const SizedBox(height: 20),

        Text('Kiểu giá', style: theme.textTheme.titleSmall),
        const SizedBox(height: 6),
        SegmentedButton<PriceMode>(
          segments: const [
            ButtonSegment(value: PriceMode.fixed, label: Text('Giá cố định')),
            ButtonSegment(
              value: PriceMode.negotiable,
              label: Text('Cho thương lượng'),
            ),
          ],
          selected: {draft.priceMode},
          onSelectionChanged: saving
              ? null
              : (selected) => setState(
                  () => _draft = draft.copyWith(priceMode: selected.first),
                ),
        ),
        const SizedBox(height: 20),

        Text(
          'Thẻ (tối đa $maxListingTags)',
          style: theme.textTheme.titleSmall,
        ),
        const SizedBox(height: 6),
        _TagField(
          tags: draft.tags,
          controller: _tagController,
          enabled: !saving,
          onChanged: (tags) =>
              setState(() => _draft = draft.copyWith(tags: tags)),
        ),
        const SizedBox(height: 28),

        FilledButton(
          onPressed: saving || !draft.isValid ? null : () => _save(listing),
          child: Text(saving ? 'Đang lưu…' : 'Lưu thay đổi'),
        ),
        const SizedBox(height: 8),
        // Ảnh sửa ở đâu thì nói ra, thay vì để một ô trống người bán tìm mãi.
        Text(
          'Ảnh và giá bán sửa ở màn danh sách tin, mục "Sửa giá & tồn kho".',
          textAlign: TextAlign.center,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}

class _CategoryPicker extends ConsumerWidget {
  const _CategoryPicker({
    required this.value,
    required this.enabled,
    required this.onChanged,
  });

  final String value;
  final bool enabled;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(editableCategoriesProvider);

    return switch (categories) {
      AsyncData(value: final tree) => DropdownButtonFormField<String>(
        initialValue: tree.any((c) => c.id == value) ? value : null,
        decoration: const InputDecoration(border: OutlineInputBorder()),
        items: [
          for (final category in tree)
            DropdownMenuItem(value: category.id, child: Text(category.name)),
        ],
        onChanged: enabled
            ? (next) {
                if (next != null) onChanged(next);
              }
            : null,
      ),
      AsyncError() => const Text('Không tải được danh mục.'),
      _ => const LinearProgressIndicator(),
    };
  }
}

/// Nhập thẻ, hiện thẻ, bỏ thẻ. Slug hoá ở tầng model chứ không ở đây, vì route
/// mới là thứ đặt luật và cùng luật đó dùng cho cả màn đăng tin.
class _TagField extends StatelessWidget {
  const _TagField({
    required this.tags,
    required this.controller,
    required this.enabled,
    required this.onChanged,
  });

  final List<String> tags;
  final TextEditingController controller;
  final bool enabled;
  final ValueChanged<List<String>> onChanged;

  void _add(String raw) {
    final next = listingTags([...tags, raw]);
    controller.clear();
    onChanged(next);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (tags.isNotEmpty)
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: [
              for (final tag in tags)
                Chip(
                  label: Text(tag),
                  onDeleted: enabled
                      ? () => onChanged([...tags]..remove(tag))
                      : null,
                ),
            ],
          ),
        if (tags.length < maxListingTags) ...[
          const SizedBox(height: 6),
          TextField(
            controller: controller,
            enabled: enabled,
            decoration: const InputDecoration(
              hintText: 'Thêm thẻ rồi nhấn Enter',
              border: OutlineInputBorder(),
            ),
            onSubmitted: _add,
          ),
        ],
      ],
    );
  }
}

class _Retry extends StatelessWidget {
  const _Retry({required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Không tải được tin này.'),
        const SizedBox(height: 12),
        OutlinedButton(onPressed: onRetry, child: const Text('Thử lại')),
      ],
    ),
  );
}
