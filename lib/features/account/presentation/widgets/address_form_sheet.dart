import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../api/generated/model/administrative_area.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../shared/data_sources/common_api_service.dart';
import '../../../../shared/models/geocode_model.dart';
import '../../../../shared/widgets/area_picker_sheet.dart';
import '../../data/models/account_model.dart';
import '../providers/addresses_provider.dart';

class AddressFormSheet extends ConsumerStatefulWidget {
  final Contact? contact;

  const AddressFormSheet({super.key, this.contact});

  @override
  ConsumerState<AddressFormSheet> createState() => _AddressFormSheetState();
}

class _AddressFormSheetState extends ConsumerState<AddressFormSheet> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _addressController;
  late TextEditingController _detailController;

  String _addressType = 'home'; // the contract's enum: 'home' | 'work'
  double? _latitude;
  double? _longitude;

  /// The picked area, code and display name together. A saved contact already
  /// carries both, which is why an edit needs no lookup to show where it is.
  AdministrativeArea? _province;
  AdministrativeArea? _ward;

  /// The pickers are not form fields, so their "required" is reported here rather
  /// than by the validator.
  String? _areaError;

  bool _isSearching = false;
  List<dynamic> _suggestions = [];
  final FocusNode _addressFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.contact?.fullName);
    _phoneController = TextEditingController(text: widget.contact?.phone);
    _addressController = TextEditingController(text: widget.contact?.address);
    _detailController = TextEditingController(
      text: widget.contact?.addressDetail,
    );
    _addressType = widget.contact?.addressType ?? 'home';
    _latitude = widget.contact?.latitude;
    _longitude = widget.contact?.longitude;

    final contact = widget.contact;
    if (contact != null) {
      _province = AdministrativeArea(
        code: contact.provinceCode,
        name: contact.provinceName,
        kind: AdministrativeAreaKindEnum.province,
      );
      _ward = AdministrativeArea(
        code: contact.wardCode,
        name: contact.wardName,
        kind: AdministrativeAreaKindEnum.ward,
      );
    }

    _addressFocusNode.addListener(() {
      if (!_addressFocusNode.hasFocus) {
        Future.delayed(const Duration(milliseconds: 200), () {
          if (mounted) {
            setState(() {
              _suggestions = [];
            });
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _detailController.dispose();
    _addressFocusNode.dispose();
    super.dispose();
  }

  void _onAddressChanged(String query) async {
    if (query.trim().length < 3) {
      setState(() {
        _suggestions = [];
      });
      return;
    }

    setState(() {
      _isSearching = true;
    });

    try {
      final commonApi = ref.read(commonApiServiceProvider);
      final response = await commonApi.searchGeocode(query, 5);
      setState(() {
        _suggestions = response.data;
      });
    } catch (e) {
      // Bỏ qua
    } finally {
      setState(() {
        _isSearching = false;
      });
    }
  }

  void _selectSuggestion(GeocodeSuggestion suggestion) {
    setState(() {
      _addressController.text = suggestion.displayName;
      _latitude = suggestion.latitude;
      _longitude = suggestion.longitude;
      _suggestions = [];
    });
    _addressFocusNode.unfocus();
  }

  void _submit() async {
    if (!_formKey.currentState!.validate()) return;

    // The codes are what a carrier is called with, so an address cannot be saved
    // without them and neither is ever typed — both come from the picker.
    final province = _province;
    final ward = _ward;
    if (province == null || ward == null) {
      setState(() => _areaError = 'Vui lòng chọn tỉnh/thành và phường/xã');
      return;
    }

    final name = _nameController.text.trim();
    final phone = _phoneController.text.trim();
    final address = _addressController.text.trim();
    final detail = _detailController.text.trim();

    // Nothing sends a district: Vietnam goes province to ward and the backend
    // drops the pair, so a code invented here would be silently lost.
    if (widget.contact == null) {
      await ref
          .read(addressesControllerProvider.notifier)
          .createContact(
            CreateContactRequest(
              fullName: name,
              phone: phone,
              address: address,
              addressDetail: detail.isNotEmpty ? detail : null,
              addressType: _addressType,
              country: 'VN',
              provinceCode: province.code,
              provinceName: province.name,
              wardCode: ward.code,
              wardName: ward.name,
              latitude: _latitude,
              longitude: _longitude,
            ),
          );
    } else {
      await ref
          .read(addressesControllerProvider.notifier)
          .updateContact(
            UpdateContactRequest(
              contactId: widget.contact!.id,
              fullName: name,
              phone: phone,
              address: address,
              addressDetail: detail.isNotEmpty ? detail : null,
              addressType: _addressType,
              provinceCode: province.code,
              provinceName: province.name,
              wardCode: ward.code,
              wardName: ward.name,
              latitude: _latitude,
              longitude: _longitude,
            ),
          );
    }

    if (mounted && !ref.read(addressesControllerProvider).hasError) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    final inputFillColor = isDarkMode
        ? theme.colorScheme.surfaceContainerHighest
        : const Color(0xFFF4F4F1);

    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 24,
        bottom: 24 + bottomInset,
      ),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.contact == null ? 'Add New Address' : 'Edit Address',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onSurface,
                      fontFamily: 'Manrope',
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
              const SizedBox(height: 16),

              // Full Name
              TextFormField(
                controller: _nameController,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  color: theme.colorScheme.onSurface,
                ),
                decoration: InputDecoration(
                  labelText: 'Recipient Full Name',
                  labelStyle: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 13,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  filled: true,
                  fillColor: inputFillColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: theme.colorScheme.primary,
                      width: 1.5,
                    ),
                  ),
                ),
                validator: (val) => (val == null || val.trim().isEmpty)
                    ? 'Please enter recipient name'
                    : null,
              ),
              const SizedBox(height: 16),

              // Phone Number
              TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  color: theme.colorScheme.onSurface,
                ),
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  labelStyle: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 13,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  filled: true,
                  fillColor: inputFillColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: theme.colorScheme.primary,
                      width: 1.5,
                    ),
                  ),
                ),
                validator: (val) => (val == null || val.trim().isEmpty)
                    ? 'Please enter phone number'
                    : null,
              ),
              const SizedBox(height: 16),

              // Province and ward, from the backend's own list. The codes are
              // what a carrier is routed by, so they are chosen and never typed.
              _areaField(
                label: 'Tỉnh/Thành phố',
                value: _province?.name,
                fillColor: inputFillColor,
                onTap: () async {
                  final picked = await showAreaPicker(
                    context,
                    title: 'Chọn tỉnh, thành phố',
                    selectedCode: _province?.code,
                  );
                  if (picked == null) return;
                  // The ward belonged to the old province, so it cannot stand.
                  setState(() {
                    _province = picked;
                    _ward = null;
                    _areaError = null;
                  });
                },
              ),
              const SizedBox(height: 16),
              _areaField(
                label: 'Phường/Xã',
                value: _ward?.name,
                fillColor: inputFillColor,
                enabled: _province != null,
                onTap: () async {
                  final province = _province;
                  if (province == null) return;
                  final picked = await showAreaPicker(
                    context,
                    title: 'Chọn phường, xã',
                    parent: province.code,
                    selectedCode: _ward?.code,
                  );
                  if (picked == null) return;
                  setState(() {
                    _ward = picked;
                    _areaError = null;
                  });
                },
              ),
              if (_areaError != null) ...[
                const SizedBox(height: 6),
                Text(
                  _areaError!,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12,
                    color: theme.colorScheme.error,
                  ),
                ),
              ],
              const SizedBox(height: 16),

              // Address Search Autocomplete Field
              Stack(
                clipBehavior: Clip.none,
                children: [
                  TextFormField(
                    controller: _addressController,
                    focusNode: _addressFocusNode,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      color: theme.colorScheme.onSurface,
                    ),
                    decoration: InputDecoration(
                      labelText: 'Address (Search / Autocomplete)',
                      labelStyle: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 13,
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                      filled: true,
                      fillColor: inputFillColor,
                      suffixIcon: _isSearching
                          ? SizedBox(
                              width: 20,
                              height: 20,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: theme.colorScheme.primary,
                                ),
                              ),
                            )
                          : Icon(
                              Icons.map_rounded,
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: theme.colorScheme.primary,
                          width: 1.5,
                        ),
                      ),
                    ),
                    onChanged: _onAddressChanged,
                    validator: (val) => (val == null || val.trim().isEmpty)
                        ? 'Please enter address'
                        : null,
                  ),

                  // Suggestions list overlay
                  if (_suggestions.isNotEmpty)
                    Positioned(
                      top: 60,
                      left: 0,
                      right: 0,
                      child: Material(
                        elevation: 4,
                        borderRadius: BorderRadius.circular(12),
                        color: isDarkMode
                            ? AppColors.darkSurface
                            : Colors.white,
                        child: Container(
                          constraints: const BoxConstraints(maxHeight: 200),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: _suggestions.length,
                            itemBuilder: (context, idx) {
                              final GeocodeSuggestion sug = _suggestions[idx];
                              return ListTile(
                                dense: true,
                                title: Text(
                                  sug.displayName,
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 13,
                                    color: theme.colorScheme.onSurface,
                                  ),
                                ),
                                onTap: () => _selectSuggestion(sug),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 16),

              // Detail Address
              TextFormField(
                controller: _detailController,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  color: theme.colorScheme.onSurface,
                ),
                decoration: InputDecoration(
                  labelText: 'Address Details (Apartment, Suite, etc.)',
                  labelStyle: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 13,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  filled: true,
                  fillColor: inputFillColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: theme.colorScheme.primary,
                      width: 1.5,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Address Type Chips
              Text(
                'Address Type',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 8),
              // The contract has two kinds and no more, so there is no 'Other'
              // chip to send a value the route answers 422 to.
              Row(
                children: [
                  _buildTypeChip('home', 'Nhà riêng'),
                  const SizedBox(width: 8),
                  _buildTypeChip('work', 'Công ty'),
                ],
              ),

              const SizedBox(height: 32),

              // Action button
              SizedBox(
                height: 48,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _submit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.primary,
                    foregroundColor: theme.colorScheme.onPrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    widget.contact == null ? 'Save Address' : 'Update Address',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Inter',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Looks like the text fields around it but opens the area picker; a free-text
  /// area would produce a name with no code behind it.
  Widget _areaField({
    required String label,
    required String? value,
    required Color fillColor,
    required VoidCallback onTap,
    bool enabled = true,
  }) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: enabled ? onTap : null,
      borderRadius: BorderRadius.circular(12),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            fontFamily: 'Inter',
            fontSize: 13,
            color: theme.colorScheme.onSurfaceVariant,
          ),
          filled: true,
          fillColor: fillColor,
          enabled: enabled,
          suffixIcon: Icon(
            Icons.expand_more_rounded,
            color: theme.colorScheme.onSurfaceVariant,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
        isEmpty: value == null,
        child: Text(
          value ?? '',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            color: enabled
                ? theme.colorScheme.onSurface
                : theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ),
    );
  }

  Widget _buildTypeChip(String type, String label) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final isSelected = _addressType == type;

    final unselectedBg = isDarkMode
        ? theme.colorScheme.surfaceContainerHighest
        : const Color(0xFFF1F5F9);

    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (selected) {
        if (selected) {
          setState(() {
            _addressType = type;
          });
        }
      },
      labelStyle: TextStyle(
        color: isSelected
            ? theme.colorScheme.onPrimary
            : theme.colorScheme.onSurfaceVariant,
        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        fontFamily: 'Inter',
        fontSize: 13,
      ),
      selectedColor: theme.colorScheme.primary,
      backgroundColor: unselectedBg,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      side: BorderSide.none,
      showCheckmark: false,
    );
  }
}
