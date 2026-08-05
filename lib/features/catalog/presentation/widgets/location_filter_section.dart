import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../account/data/models/account_model.dart';
import '../../../account/presentation/providers/addresses_provider.dart';
import '../../data/models/catalog_model.dart';
import '../providers/catalog_provider.dart';

/// A province and its code. Codes are the ones the listing snapshot carries, so
/// they have to be the administrative codes and not names.
class _Province {
  final String code;
  final String name;

  const _Province(this.code, this.name);
}

/// A stopgap: the API has no route that lists administrative areas, so the ones
/// a buyer is most likely to browse are named here. A ward-level filter comes
/// from the buyer's own saved addresses below, where the codes are real data.
const List<_Province> _provinces = [
  _Province('01', 'Hà Nội'),
  _Province('79', 'TP. Hồ Chí Minh'),
  _Province('31', 'Hải Phòng'),
  _Province('48', 'Đà Nẵng'),
  _Province('92', 'Cần Thơ'),
  _Province('46', 'Huế'),
  _Province('22', 'Quảng Ninh'),
  _Province('24', 'Bắc Ninh'),
  _Province('38', 'Thanh Hóa'),
  _Province('40', 'Nghệ An'),
  _Province('56', 'Khánh Hòa'),
  _Province('68', 'Lâm Đồng'),
  _Province('75', 'Đồng Nai'),
];

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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _label(context, 'Khu vực'),
        const SizedBox(height: 8.0),
        SizedBox(
          height: 40.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              for (final province in _provinces)
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: _choice(
                    context,
                    label: province.name,
                    selected:
                        filters.provinceCode == province.code &&
                        filters.wardCode == null,
                    onSelected: (selected) => onChanged(
                      _withArea(
                        provinceCode: selected ? province.code : null,
                        label: selected ? province.name : null,
                      ),
                    ),
                  ),
                ),
              // A saved address pins the ward, which is as narrow as this filter
              // goes.
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
                        districtCode: selected ? contact.districtCode : null,
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

  CatalogSearchFilters _withArea({
    String? provinceCode,
    String? districtCode,
    String? wardCode,
    String? label,
  }) {
    return filters.copyWith(
      provinceCode: provinceCode,
      districtCode: districtCode,
      wardCode: wardCode,
      areaLabel: label,
    );
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
