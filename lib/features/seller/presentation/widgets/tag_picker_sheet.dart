import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopnexus_flutter_app/api/generated/model/tag.dart';
import 'package:shopnexus_flutter_app/features/catalog/data/repositories/catalog_repository.dart';
import 'package:shopnexus_flutter_app/features/catalog/presentation/providers/catalog_provider.dart';
import 'package:shopnexus_flutter_app/features/seller/data/models/listing_draft.dart';

/// Thẻ gần nghĩa với những gì đã chọn.
///
/// `GET /tags?near=` xếp lại từ điển theo khoảng cách cosine và **bỏ chính các
/// hạt giống ra** — chọn `handmade` thì nó trả về những thẻ nằm cạnh `handmade`
/// trong không gian vector. Hạt giống có thể là một slug thẻ hoặc một id danh
/// mục, nên tin chưa có thẻ nào vẫn gợi ý được từ danh mục người bán vừa chọn.
///
/// Keyed bằng một chuỗi đã nối, không phải một `List`: tham số của family so bằng
/// `==`, mà hai `List` mới thì không bao giờ bằng nhau.
final tagNeighbourSuggestionsProvider = FutureProvider.autoDispose
    .family<List<Tag>, String>((ref, joinedSeeds) {
      final seeds = joinedSeeds.split(',').where((s) => s.isNotEmpty).toList();
      if (seeds.isEmpty) return Future.value(const <Tag>[]);
      return ref.watch(catalogRepositoryProvider).tags(near: seeds, limit: 20);
    });

/// Chọn thẻ từ *từ điển*, không phải gõ vào chỗ trống.
///
/// Route chỉ soi hình dạng của một slug, nên gõ tay vẫn được và vẫn còn ở đây —
/// nhưng gõ tay một mình thì không có gì để tìm ra: người bán không biết sàn đang
/// dùng `do-choi-go` hay `do-choi-bang-go`, và một thẻ không ai khác dùng là một
/// thẻ không ai bấm vào. Nên chỗ này hỏi `?q=` cho cái đang gõ và `?near=` cho
/// những gì đã chọn, đúng hai nửa mà route dựng sẵn cho một bộ chọn thẻ.
class TagPickerSheet extends ConsumerStatefulWidget {
  const TagPickerSheet({super.key, required this.selected, this.categoryId});

  final List<String> selected;

  /// Hạt giống khi tin chưa có thẻ nào.
  final String? categoryId;

  /// Trả về danh sách thẻ mới, hoặc null khi người bán đóng sheet mà không đổi.
  static Future<List<String>?> show(
    BuildContext context, {
    required List<String> selected,
    String? categoryId,
  }) {
    return showModalBottomSheet<List<String>>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (_) =>
          TagPickerSheet(selected: selected, categoryId: categoryId),
    );
  }

  @override
  ConsumerState<TagPickerSheet> createState() => _TagPickerSheetState();
}

class _TagPickerSheetState extends ConsumerState<TagPickerSheet> {
  final _queryController = TextEditingController();

  late List<String> _selected = [...widget.selected];
  String _query = '';

  @override
  void dispose() {
    _queryController.dispose();
    super.dispose();
  }

  bool get _isFull => _selected.length >= maxListingTags;

  void _toggle(String slug) {
    setState(() {
      if (_selected.contains(slug)) {
        _selected.remove(slug);
        return;
      }
      if (_isFull) return;
      _selected = listingTags([..._selected, slug]);
    });
  }

  /// Thẻ tự gõ. Chuẩn hoá bằng đúng cái hàm mà lúc gửi đi dùng, nên chữ hiện trên
  /// chip là chữ server sẽ nhận — không phải một câu tiếng Việt có dấu rồi lát nữa
  /// mới lặng lẽ biến thành slug khác.
  void _addTyped() {
    final slug = listingTags([_query]).firstOrNull;
    if (slug == null) return;
    _toggle(slug);
    _queryController.clear();
    setState(() => _query = '');
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Đang gõ thì tìm theo tiền tố; chưa gõ gì thì gợi ý theo nghĩa từ những gì
    // đã chọn — hoặc từ danh mục, khi chưa chọn thẻ nào. Hai tham số loại nhau
    // trên route, nên chỗ này cũng chỉ hỏi một trong hai.
    final trimmed = _query.trim();
    final seeds = _selected.isNotEmpty
        ? _selected
        : [?widget.categoryId].where((s) => s.isNotEmpty).toList();

    final results = trimmed.isNotEmpty
        ? ref.watch(tagSuggestionsProvider(trimmed))
        : ref.watch(tagNeighbourSuggestionsProvider(seeds.join(',')));

    final typedSlug = trimmed.isEmpty
        ? null
        : listingTags([trimmed]).firstOrNull;

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.7,
        maxChildSize: 0.95,
        builder: (context, controller) => Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Thẻ (${_selected.length}/$maxListingTags)',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(_selected),
                    child: const Text('Xong'),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                controller: _queryController,
                autofocus: false,
                textInputAction: TextInputAction.done,
                onChanged: (value) => setState(() => _query = value),
                onSubmitted: (_) => _addTyped(),
                decoration: InputDecoration(
                  hintText: 'Tìm thẻ, hoặc tự gõ một thẻ mới',
                  prefixIcon: const Icon(Icons.tag_rounded, size: 20),
                  suffixIcon: trimmed.isEmpty
                      ? null
                      : IconButton(
                          tooltip: 'Thêm thẻ này',
                          icon: const Icon(Icons.add_rounded),
                          onPressed: _isFull ? null : _addTyped,
                        ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            if (_selected.isNotEmpty)
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      for (final slug in _selected)
                        InputChip(
                          label: Text(slug),
                          selected: true,
                          onDeleted: () => _toggle(slug),
                        ),
                    ],
                  ),
                ),
              ),
            if (_isFull)
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Mỗi tin chỉ gắn được tối đa $maxListingTags thẻ.',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: theme.colorScheme.error,
                    ),
                  ),
                ),
              ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView(
                controller: controller,
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                children: [
                  Text(
                    trimmed.isNotEmpty
                        ? 'Thẻ khớp với "$trimmed"'
                        : seeds.isEmpty
                        ? 'Thẻ đang được dùng nhiều'
                        : 'Gợi ý gần với thẻ bạn đã chọn',
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 10),
                  results.when(
                    loading: () => const Center(
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    ),
                    // Từ điển đọc hỏng thì vẫn còn gõ tay: nó là một chỗ để tìm,
                    // không phải cái cửa duy nhất.
                    error: (_, _) => Text(
                      'Không tải được từ điển thẻ. Bạn vẫn có thể tự gõ một thẻ.',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    data: (tags) {
                      final offered = [
                        for (final tag in tags)
                          if (!_selected.contains(tag.slug)) tag,
                      ];
                      if (offered.isEmpty) {
                        return Text(
                          typedSlug != null
                              ? 'Chưa có thẻ nào như vậy. Bấm + để tự thêm "$typedSlug".'
                              : 'Chưa có gợi ý nào.',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        );
                      }
                      return Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          for (final tag in offered)
                            ActionChip(
                              avatar: const Icon(Icons.add, size: 16),
                              label: Text(tag.slug),
                              onPressed: _isFull
                                  ? null
                                  : () => _toggle(tag.slug),
                            ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
