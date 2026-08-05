import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopnexus_flutter_app/api/generated/model/administrative_area.dart';
import 'package:shopnexus_flutter_app/core/theme/app_colors.dart';
import 'package:shopnexus_flutter_app/shared/widgets/area_picker_sheet.dart';
import 'package:shopnexus_flutter_app/api/generated/model/contact.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/providers/addresses_provider.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/providers/administrative_areas_provider.dart';
import 'package:shopnexus_flutter_app/features/catalog/data/models/catalog_model.dart';
import 'package:shopnexus_flutter_app/features/catalog/presentation/providers/catalog_provider.dart';

const List<double> _radiusChoices = [2, 5, 10, 25, 50];

/// The location half of a filter sheet: which area to look in, and where to
/// measure from. It edits a draft [CatalogSearchFilters] and hands it back — the
/// sheet decides when to apply.
class LocationFilterSection extends ConsumerWidget {
  final CatalogSearchFilters filters;
  final ValueChanged<CatalogSearchFilters> onChanged;

  const LocationFilterSection({
    super.key,
    required this.filters,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final contactsState = ref.watch(buyerContactsProvider);
    final provinceCode = filters.provinceCode;
    final provinceName = _nameOf(ref.watch(provincesProvider), provinceCode);
    // Asked for only once a ward is picked: a province answers all of its wards
    // at once, so this is a page-sized response and not a label lookup.
    final wardName = (provinceCode == null || filters.wardCode == null)
        ? null
        : _nameOf(ref.watch(wardsProvider(provinceCode)), filters.wardCode);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _label(context, 'Khu vực'),
        const SizedBox(height: 8.0),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: [
            _picker(
              context,
              label: provinceName ?? 'Tất cả tỉnh/thành',
              icon: Icons.map_outlined,
              selected: provinceCode != null,
              onPressed: () async {
                final picked = await showAreaPicker(
                  context,
                  title: 'Chọn tỉnh, thành phố',
                  selectedCode: provinceCode,
                );
                // A different province invalidates the ward under it.
                if (picked != null) {
                  onChanged(
                    _withArea(provinceCode: picked.code, label: picked.name),
                  );
                }
              },
            ),
            if (provinceCode != null)
              _picker(
                context,
                label: wardName ?? 'Tất cả phường/xã',
                icon: Icons.location_on_outlined,
                selected: filters.wardCode != null,
                onPressed: () async {
                  final picked = await showAreaPicker(
                    context,
                    title: 'Chọn phường, xã',
                    parent: provinceCode,
                    selectedCode: filters.wardCode,
                  );
                  if (picked != null) {
                    onChanged(
                      _withArea(
                        provinceCode: provinceCode,
                        wardCode: picked.code,
                        label: '${picked.name}, ${provinceName ?? ''}',
                      ),
                    );
                  }
                },
              ),
            if (filters.hasArea)
              _picker(
                context,
                label: 'Bỏ chọn khu vực',
                icon: Icons.close_rounded,
                selected: false,
                onPressed: () => onChanged(_withArea()),
              ),
          ],
        ),
        const SizedBox(height: 12.0),

        // A saved address is one tap to the ward the buyer already lives in.
        if ((contactsState.value ?? const <Contact>[]).isNotEmpty)
          SizedBox(
            height: 40.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                for (final contact in contactsState.value ?? const <Contact>[])
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: _choice(
                      context,
                      label: '${contact.wardName}, ${contact.provinceName}',
                      icon: Icons.home_outlined,
                      selected: filters.wardCode == contact.wardCode,
                      onSelected: (selected) => onChanged(
                        _withArea(
                          provinceCode: selected ? contact.provinceCode : null,
                          wardCode: selected ? contact.wardCode : null,
                          label: selected
                              ? '${contact.wardName}, ${contact.provinceName}'
                              : null,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        const SizedBox(height: 20.0),

        _label(context, 'Gần tôi'),
        const SizedBox(height: 4.0),
        Text(
          'Chọn một địa chỉ đã lưu để đo khoảng cách từ đó tới người bán.',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 12,
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 8.0),
        contactsState.when(
          data: (contacts) {
            // A contact that was never geocoded cannot be measured from: the API
            // answers 422 for one, so it is not offered.
            final positioned = contacts
                .where((c) => c.latitude != null && c.longitude != null)
                .toList();
            if (positioned.isEmpty) {
              return Text(
                'Bạn chưa có địa chỉ nào đã xác định vị trí. Thêm địa chỉ giao hàng để dùng tìm kiếm quanh đây.',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 12,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              );
            }
            return SizedBox(
              height: 40.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  for (final contact in positioned)
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: _choice(
                        context,
                        label: contact.fullName.isNotEmpty
                            ? '${contact.fullName} • ${contact.wardName}'
                            : contact.wardName,
                        icon: Icons.near_me_outlined,
                        selected: filters.nearContactId == contact.id,
                        onSelected: (selected) => onChanged(
                          _withNearby(
                            contactId: selected ? contact.id : null,
                            label: selected
                                ? '${contact.wardName}, ${contact.provinceName}'
                                : null,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            );
          },
          loading: () => const SizedBox(
            height: 40.0,
            child: Center(
              child: SizedBox(
                height: 18,
                width: 18,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
          ),
          error: (err, stack) => Text(
            'Không tải được địa chỉ đã lưu.',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 12,
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ),

        // A radius and a distance sort both need a position, so they only appear
        // once there is one.
        if (filters.hasPosition) ...[
          const SizedBox(height: 16.0),
          _label(context, 'Bán kính'),
          const SizedBox(height: 8.0),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: [
              for (final radius in _radiusChoices)
                _choice(
                  context,
                  label: '${radius.round()} km',
                  selected: filters.radiusKm == radius,
                  onSelected: (selected) => onChanged(
                    filters.copyWith(radiusKm: selected ? radius : null),
                  ),
                ),
              _choice(
                context,
                label: 'Không giới hạn',
                selected: filters.radiusKm == null,
                onSelected: (_) => onChanged(filters.copyWith(radiusKm: null)),
              ),
            ],
          ),
          const SizedBox(height: 4.0),
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            dense: true,
            value: filters.sort == ListingSort.distance,
            onChanged: (on) => onChanged(
              filters.copyWith(sort: on ? ListingSort.distance : null),
            ),
            title: Text(
              'Sắp xếp theo gần nhất',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: theme.colorScheme.onSurface,
              ),
            ),
          ),
        ],
      ],
    );
  }

  /// The whole area is replaced at once, never patched: a ward left standing
  /// under a newly picked province is a filter for somewhere nobody chose.
  CatalogSearchFilters _withArea({
    String? provinceCode,
    String? wardCode,
    String? label,
  }) {
    return filters.copyWith(
      provinceCode: provinceCode,
      wardCode: wardCode,
      areaLabel: label,
    );
  }

  /// The code is the filter; the name is only what the chip reads. So it is
  /// looked up in the list that was served and never stored beside the code.
  String? _nameOf(AsyncValue<List<AdministrativeArea>> areas, String? code) {
    if (code == null) return null;
    for (final area in areas.value ?? const <AdministrativeArea>[]) {
      if (area.code == code) return area.name;
    }
    return null;
  }

  /// Dropping the position also drops what cannot be sent without one.
  CatalogSearchFilters _withNearby({String? contactId, String? label}) {
    final cleared = contactId == null;
    return filters.copyWith(
      nearContactId: contactId,
      nearLabel: label,
      radiusKm: cleared ? null : filters.radiusKm,
      sort: cleared && filters.sort == ListingSort.distance
          ? null
          : filters.sort,
    );
  }

  Widget _label(BuildContext context, String text) {
    final theme = Theme.of(context);
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w600,
        fontSize: 14,
        color: theme.colorScheme.onSurface,
      ),
    );
  }

  /// Opens a level of the area vocabulary. A chip rather than a dropdown because
  /// 63 provinces and up to 549 wards need a search field, not a menu.
  Widget _picker(
    BuildContext context, {
    required String label,
    required IconData icon,
    required bool selected,
    required VoidCallback onPressed,
  }) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return ActionChip(
      label: Text(label),
      avatar: Icon(
        icon,
        size: 14,
        color: selected
            ? theme.colorScheme.onPrimary
            : theme.colorScheme.primary,
      ),
      labelStyle: TextStyle(
        fontFamily: 'Inter',
        color: selected
            ? theme.colorScheme.onPrimary
            : theme.colorScheme.onSurface,
        fontWeight: selected ? FontWeight.bold : FontWeight.normal,
      ),
      backgroundColor: selected
          ? theme.colorScheme.primary
          : (isDarkMode ? AppColors.darkSurface : const Color(0xFFEEEEEB)),
      side: BorderSide.none,
      onPressed: onPressed,
    );
  }

  Widget _choice(
    BuildContext context, {
    required String label,
    required bool selected,
    required ValueChanged<bool> onSelected,
    IconData? icon,
  }) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return ChoiceChip(
      label: Text(label),
      selected: selected,
      avatar: icon == null
          ? null
          : Icon(
              icon,
              size: 14,
              color: selected
                  ? theme.colorScheme.onPrimary
                  : theme.colorScheme.primary,
            ),
      labelStyle: TextStyle(
        fontFamily: 'Inter',
        color: selected
            ? theme.colorScheme.onPrimary
            : theme.colorScheme.onSurface,
        fontWeight: selected ? FontWeight.bold : FontWeight.normal,
      ),
      selectedColor: theme.colorScheme.primary,
      backgroundColor: isDarkMode
          ? AppColors.darkSurface
          : const Color(0xFFEEEEEB),
      onSelected: onSelected,
    );
  }
}
