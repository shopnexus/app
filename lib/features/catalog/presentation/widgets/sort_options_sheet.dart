import 'package:flutter/material.dart';
import 'package:shopnexus_flutter_app/core/theme/app_colors.dart';
import 'package:shopnexus_flutter_app/features/catalog/data/models/catalog_model.dart';
import 'package:shopnexus_flutter_app/features/catalog/presentation/providers/catalog_provider.dart';

/// A null sort is the API's default, which is `relevance` when there is a search query.
String sortLabel(String? sort) {
  switch (sort) {
    case ListingSort.recommended:
      return 'Gợi ý cho bạn';
    case ListingSort.relevance:
      return 'Liên quan nhất';
    case ListingSort.newest:
      return 'Mới nhất';
    case ListingSort.bestSelling:
      return 'Bán chạy nhất';
    case ListingSort.priceAsc:
      return 'Giá: Thấp đến Cao';
    case ListingSort.priceDesc:
      return 'Giá: Cao đến Thấp';
    case ListingSort.rating:
      return 'Đánh giá cao';
    case ListingSort.distance:
      return 'Gần tôi nhất';
    default:
      return 'Liên quan nhất';
  }
}

/// The sort choices this browse can legally send: `distance` needs a position,
/// so an unreachable option is not offered rather than offered and refused.
void showSortOptionsSheet(
  BuildContext context, {
  required CatalogSearchFilters filters,
  required ValueChanged<String?> onSelected,
}) {
  final theme = Theme.of(context);
  final isDarkMode = theme.brightness == Brightness.dark;

  final options = <String?>[
    null,
    ListingSort.recommended,
    ListingSort.newest,
    ListingSort.bestSelling,
    ListingSort.priceAsc,
    ListingSort.priceDesc,
    ListingSort.rating,
    if (filters.hasPosition) ListingSort.distance,
  ];

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: isDarkMode ? AppColors.darkSurface : Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24.0)),
    ),
    builder: (sheetContext) {
      final sheetTheme = Theme.of(sheetContext);
      return SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Sắp xếp theo',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: sheetTheme.colorScheme.onSurface,
                  ),
                ),
              ),
              Divider(color: sheetTheme.colorScheme.outlineVariant),
              for (final option in options) ...[
                Builder(
                  builder: (_) {
                    final selected =
                        option == filters.sort ||
                        ((option == null || option == ListingSort.relevance) &&
                            (filters.sort == null ||
                                filters.sort == ListingSort.relevance));

                    return ListTile(
                      title: Text(
                        sortLabel(option),
                        style: TextStyle(
                          fontFamily: 'Inter',
                          color: selected
                              ? sheetTheme.colorScheme.primary
                              : sheetTheme.colorScheme.onSurface,
                          fontWeight: selected
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                      trailing: selected
                          ? Icon(
                              Icons.check_rounded,
                              color: sheetTheme.colorScheme.primary,
                            )
                          : null,
                      onTap: () {
                        Navigator.pop(sheetContext);
                        onSelected(option);
                      },
                    );
                  },
                ),
              ],
              if (!filters.hasPosition)
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 16.0),
                  child: Text(
                    'Chọn một địa chỉ đã lưu trong bộ lọc để sắp xếp theo khoảng cách.',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 12,
                      color: sheetTheme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
            ],
          ),
        ),
      );
    },
  );
}
