import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../api/generated/model/administrative_area.dart';
import '../../features/account/presentation/providers/administrative_areas_provider.dart';

/// Picks one area from one level of the vocabulary: the provinces, or the wards
/// of the province named by [parent]. Both the address form and the browse filter
/// open this, so a code is only ever taken from the list the backend served and
/// is handed back exactly as it arrived.
Future<AdministrativeArea?> showAreaPicker(
  BuildContext context, {
  required String title,
  String? parent,
  String? selectedCode,
}) {
  return showModalBottomSheet<AdministrativeArea>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    backgroundColor: Theme.of(context).colorScheme.surface,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (_) => _AreaPickerSheet(
      title: title,
      parent: parent,
      selectedCode: selectedCode,
    ),
  );
}

const Map<String, String> _diacriticGroups = {
  'a': 'àáảãạăằắẳẵặâầấẩẫậ',
  'e': 'èéẻẽẹêềếểễệ',
  'i': 'ìíỉĩị',
  'o': 'òóỏõọôồốổỗộơờớởỡợ',
  'u': 'ùúủũụưừứửữự',
  'y': 'ỳýỷỹỵ',
  'd': 'đ',
};

final Map<String, String> _foldTable = {
  for (final group in _diacriticGroups.entries)
    for (final character in group.value.split('')) character: group.key,
};

/// Vietnamese is commonly typed without its diacritics, so a search over 549
/// wards has to match "ben nghe" against "Bến Nghé" or it finds nothing.
String foldDiacritics(String input) {
  final buffer = StringBuffer();
  for (final character in input.toLowerCase().split('')) {
    buffer.write(_foldTable[character] ?? character);
  }
  return buffer.toString();
}

/// The code matches too — somebody who knows their ward's number gets there
/// without spelling its name.
bool areaMatchesQuery(AdministrativeArea area, String query) {
  final needle = foldDiacritics(query.trim());
  if (needle.isEmpty) return true;
  return foldDiacritics(area.name).contains(needle) ||
      area.code.contains(needle);
}

class _AreaPickerSheet extends ConsumerStatefulWidget {
  const _AreaPickerSheet({
    required this.title,
    required this.parent,
    required this.selectedCode,
  });

  final String title;
  final String? parent;
  final String? selectedCode;

  @override
  ConsumerState<_AreaPickerSheet> createState() => _AreaPickerSheetState();
}

class _AreaPickerSheetState extends ConsumerState<_AreaPickerSheet> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final parent = widget.parent;
    final provider = parent == null ? provincesProvider : wardsProvider(parent);
    final areasState = ref.watch(provider);

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      child: Padding(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 12,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          children: [
            Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                color: theme.colorScheme.onSurfaceVariant.withValues(
                  alpha: 0.3,
                ),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    widget.title,
                    style: TextStyle(
                      fontFamily: 'Manrope',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.close_rounded,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            const SizedBox(height: 8),
            TextField(
              autofocus: true,
              onChanged: (value) => setState(() => _query = value),
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 14,
                color: theme.colorScheme.onSurface,
              ),
              decoration: InputDecoration(
                hintText: parent == null
                    ? 'Tìm tỉnh, thành phố'
                    : 'Tìm phường, xã',
                prefixIcon: const Icon(Icons.search_rounded, size: 20),
                filled: true,
                fillColor: theme.colorScheme.surfaceContainerHighest,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: areasState.when(
                data: (areas) {
                  final matches = areas
                      .where((area) => areaMatchesQuery(area, _query))
                      .toList();
                  if (matches.isEmpty) {
                    return Center(
                      child: Text(
                        'Không tìm thấy khu vực nào',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 13,
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    );
                  }
                  return ListView.builder(
                    itemCount: matches.length,
                    itemBuilder: (context, index) {
                      final area = matches[index];
                      final selected = area.code == widget.selectedCode;
                      return ListTile(
                        dense: true,
                        title: Text(
                          area.name,
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            fontWeight: selected
                                ? FontWeight.bold
                                : FontWeight.normal,
                            color: theme.colorScheme.onSurface,
                          ),
                        ),
                        trailing: selected
                            ? Icon(
                                Icons.check_rounded,
                                size: 18,
                                color: theme.colorScheme.primary,
                              )
                            : null,
                        onTap: () => Navigator.of(context).pop(area),
                      );
                    },
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stack) => Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Không tải được danh sách khu vực.',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 13,
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextButton(
                        onPressed: () => ref.invalidate(provider),
                        child: const Text('Thử lại'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
