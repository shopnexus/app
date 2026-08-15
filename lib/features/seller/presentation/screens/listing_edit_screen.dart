import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopnexus_flutter_app/api/generated/model/category.dart';
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
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Bạn chưa thay đổi gì.')));
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

        Text('Thẻ (tối đa $maxListingTags)', style: theme.textTheme.titleSmall),
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
          'Ảnh, giá bán và phiên bản sửa ở màn danh sách tin, mục "Quản lý phiên bản (giá & tồn kho)".',
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

  String _categoryLabel(Category cat, List<Category> all) {
    if (cat.parentId == null) return cat.name;
    final parent = all.where((c) => c.id == cat.parentId).firstOrNull;
    if (parent == null) return cat.name;
    return '${_categoryLabel(parent, all)} > ${cat.name}';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(editableCategoriesProvider);
    final theme = Theme.of(context);

    return switch (categories) {
      AsyncData(value: final tree) => InkWell(
          onTap: !enabled || tree.isEmpty
              ? null
              : () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    builder: (sheetContext) => _EditCategorySearchBottomSheet(
                      categories: tree,
                      selectedCategoryId: value,
                      categoryLabel: (cat) => _categoryLabel(cat, tree),
                      onSelect: (selectedId) {
                        onChanged(selectedId);
                        Navigator.pop(sheetContext);
                      },
                    ),
                  );
                },
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: theme.colorScheme.outline.withAlpha(120),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.category_outlined,
                  size: 20,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    tree.where((c) => c.id == value).firstOrNull?.let(
                              (c) => _categoryLabel(c, tree),
                            ) ??
                        'Chọn danh mục...',
                    style: TextStyle(
                      fontSize: 14,
                      color: theme.colorScheme.onSurface,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Icon(
                  Icons.search,
                  size: 20,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ],
            ),
          ),
        ),
      AsyncError() => const Text('Không tải được danh mục.'),
      _ => const LinearProgressIndicator(),
    };
  }
}

extension _CategoryLet<T> on T {
  R let<R>(R Function(T) op) => op(this);
}

class _EditCategorySearchBottomSheet extends StatefulWidget {
  final List<Category> categories;
  final String? selectedCategoryId;
  final String Function(Category) categoryLabel;
  final ValueChanged<String> onSelect;

  const _EditCategorySearchBottomSheet({
    required this.categories,
    required this.selectedCategoryId,
    required this.categoryLabel,
    required this.onSelect,
  });

  @override
  State<_EditCategorySearchBottomSheet> createState() =>
      _EditCategorySearchBottomSheetState();
}

class _EditCategorySearchBottomSheetState
    extends State<_EditCategorySearchBottomSheet> {
  final _searchController = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final query = _query.trim().toLowerCase();

    final filtered = widget.categories.where((cat) {
      if (query.isEmpty) return true;
      final nameMatch = cat.name.toLowerCase().contains(query);
      final labelMatch =
          widget.categoryLabel(cat).toLowerCase().contains(query);
      return nameMatch || labelMatch;
    }).toList();

    return DraggableScrollableSheet(
      initialChildSize: 0.75,
      minChildSize: 0.4,
      maxChildSize: 0.95,
      expand: false,
      builder: (context, scrollController) {
        return Column(
          children: [
            const SizedBox(height: 12),
            Container(
              width: 36,
              height: 4,
              decoration: BoxDecoration(
                color: theme.colorScheme.onSurfaceVariant.withAlpha(80),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Chọn danh mục',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                controller: _searchController,
                autofocus: false,
                style: TextStyle(color: theme.colorScheme.onSurface),
                decoration: InputDecoration(
                  hintText: 'Tìm kiếm danh mục...',
                  hintStyle: TextStyle(
                    fontSize: 13,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  prefixIcon: const Icon(Icons.search, size: 20),
                  suffixIcon: _query.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear, size: 18),
                          onPressed: () {
                            _searchController.clear();
                            setState(() => _query = '');
                          },
                        )
                      : null,
                  filled: true,
                  fillColor: isDark
                      ? theme.colorScheme.surfaceContainerHighest
                      : const Color(0xFFF1F5F9),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
                onChanged: (val) => setState(() => _query = val),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '${filtered.length} danh mục',
                  style: TextStyle(
                    fontSize: 12,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            ),
            const Divider(height: 1),
            Expanded(
              child: filtered.isEmpty
                  ? Center(
                      child: Text(
                        'Không tìm thấy danh mục "$_query"',
                        style: TextStyle(
                          color: theme.colorScheme.onSurfaceVariant,
                          fontSize: 14,
                        ),
                      ),
                    )
                  : ListView.separated(
                      controller: scrollController,
                      itemCount: filtered.length,
                      separatorBuilder: (_, __) =>
                          const Divider(height: 1, indent: 16, endIndent: 16),
                      itemBuilder: (context, index) {
                        final cat = filtered[index];
                        final isSelected =
                            cat.id == widget.selectedCategoryId;
                        final label = widget.categoryLabel(cat);

                        return ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 4,
                          ),
                          title: Text(
                            label,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: isSelected
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              color: isSelected
                                  ? theme.colorScheme.primary
                                  : theme.colorScheme.onSurface,
                            ),
                          ),
                          trailing: isSelected
                              ? Icon(
                                  Icons.check_circle_rounded,
                                  color: theme.colorScheme.primary,
                                  size: 20,
                                )
                              : null,
                          onTap: () => widget.onSelect(cat.id),
                        );
                      },
                    ),
            ),
          ],
        );
      },
    );
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
