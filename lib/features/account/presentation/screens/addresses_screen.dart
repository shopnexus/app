import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../shared/data_sources/common_api_service.dart';
import '../../../../shared/models/geocode_model.dart';
import '../../data/models/account_model.dart';
import '../providers/account_provider.dart';
import '../providers/addresses_provider.dart';

class AddressesScreen extends ConsumerWidget {
  const AddressesScreen({super.key});

  void _showAddressFormSheet(
    BuildContext context,
    WidgetRef ref, {
    Contact? contact,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) => _AddressFormSheet(contact: contact),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contactsAsync = ref.watch(buyerContactsProvider);
    final profileAsync = ref.watch(profileProvider);
    final controllerState = ref.watch(addressesControllerProvider);

    ref.listen<AsyncValue<void>>(addressesControllerProvider, (previous, next) {
      next.whenOrNull(
        error: (err, stack) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Thao tác thất bại: $err'),
              backgroundColor: const Color(0xFFBA1A1A),
            ),
          );
        },
      );
    });

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F7), // Stitch Background
      appBar: AppBar(
        title: const Text(
          'Saved Addresses',
          style: TextStyle(
            color: Color(0xFF0F172A),
            fontWeight: FontWeight.bold,
            fontFamily: 'Inter',
            fontSize: 20,
          ),
        ),
        backgroundColor: const Color(0xFFF9F9F7),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Color(0xFF0F172A),
            size: 20,
          ),
          onPressed: () => context.pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert_rounded, color: Color(0xFF64748B)),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(buyerContactsProvider);
              ref.invalidate(profileProvider);
            },
            child: contactsAsync.when(
              data: (contacts) {
                final defaultContactId = profileAsync.value?.defaultContactId;
                if (contacts.isEmpty) {
                  return const _EmptyAddresses();
                }
                return ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(16),
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: contacts.length,
                      itemBuilder: (context, index) {
                        final contact = contacts[index];
                        final isDefault = contact.id == defaultContactId;
                        return _buildContactCard(
                          context,
                          ref,
                          contact,
                          isDefault,
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    // Add New Address Button at the bottom
                    SizedBox(
                      height: 52,
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () => _showAddressFormSheet(context, ref),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF0F172A), // Charcoal
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        icon: const Icon(Icons.add_rounded, size: 20),
                        label: const Text(
                          'Add New Address',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 48),
                  ],
                );
              },
              loading: () => _buildShimmerList(),
              error: (err, stack) => Center(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.error_outline_rounded,
                        size: 48,
                        color: Color(0xFFBA1A1A),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Không thể tải danh sách địa chỉ',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        err.toString(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xFF64748B),
                          fontSize: 13,
                          fontFamily: 'Inter',
                        ),
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        height: 48,
                        width: 140,
                        child: ElevatedButton(
                          onPressed: () => ref.refresh(buyerContactsProvider),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF0F172A),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            'Thử lại',
                            style: TextStyle(
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
            ),
          ),
          if (controllerState.isLoading)
            Container(
              color: Colors.black.withValues(alpha: 0.2),
              child: const Center(
                child: CircularProgressIndicator(color: Color(0xFF0F172A)),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildContactCard(
    BuildContext context,
    WidgetRef ref,
    Contact contact,
    bool isDefault,
  ) {
    IconData typeIcon = Icons.location_on_rounded;
    bool isFillIcon = false;

    if (contact.addressType == 'Home') {
      typeIcon = Icons.home_rounded;
      isFillIcon = true;
    } else if (contact.addressType == 'Office') {
      typeIcon = Icons.work_rounded;
      isFillIcon = false;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24), // Stitch Card Bo góc 24px
        border: Border.all(color: const Color(0xFFEEEEEC)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Stack(
          children: [
            // Default Badge ở góc trên bên phải
            if (isDefault)
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: const BoxDecoration(
                    color: Color(0xFFD0E1FB), // secondary_container
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Default',
                    style: TextStyle(
                      color: Color(0xFF54647A), // on_secondary_container
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Inter',
                    ),
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title Row with Icon
                  Row(
                    children: [
                      Icon(
                        typeIcon,
                        color: isFillIcon
                            ? const Color(0xFF0F172A)
                            : const Color(0xFF64748B),
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        contact.addressType,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1A1C1B),
                          fontFamily: 'Inter',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // Recipient & Address Details
                  Text(
                    contact.fullName,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF45464D),
                      fontFamily: 'Inter',
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${contact.address}${contact.addressDetail != null && contact.addressDetail!.isNotEmpty ? ", ${contact.addressDetail}" : ""}',
                    style: const TextStyle(
                      fontSize: 13,
                      height: 1.4,
                      color: Color(0xFF64748B),
                      fontFamily: 'Inter',
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    contact.phone,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFF64748B),
                      fontFamily: 'Inter',
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Divider
                  const Divider(height: 1, color: Color(0xFFF1F5F9)),
                  const SizedBox(height: 12),
                  // Actions Row
                  Row(
                    children: [
                      // Edit Button
                      InkWell(
                        onTap: () => _showAddressFormSheet(
                          context,
                          ref,
                          contact: contact,
                        ),
                        borderRadius: BorderRadius.circular(6),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.edit_outlined,
                                size: 16,
                                color: Color(0xFF0F172A),
                              ),
                              SizedBox(width: 4),
                              Text(
                                'Edit',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 13,
                                  color: Color(0xFF0F172A),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      // Set Default Button
                      if (!isDefault)
                        InkWell(
                          onTap: () {
                            ref
                                .read(accountControllerProvider.notifier)
                                .updateProfile(
                                  UpdateProfileRequest(
                                    defaultContactId: contact.id,
                                  ),
                                );
                          },
                          borderRadius: BorderRadius.circular(6),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            child: Text(
                              'Set as Default',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 13,
                                color: Color(0xFF64748B),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      const Spacer(),
                      // Delete Button
                      IconButton(
                        icon: const Icon(
                          Icons.delete_outline_rounded,
                          size: 18,
                          color: Color(0xFFBA1A1A),
                        ),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onPressed: () =>
                            _confirmDelete(context, ref, contact.id),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _confirmDelete(BuildContext context, WidgetRef ref, String id) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Xóa địa chỉ',
          style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Inter'),
        ),
        content: const Text(
          'Bạn có chắc muốn xóa địa chỉ nhận hàng này?',
          style: TextStyle(fontFamily: 'Inter'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text(
              'Hủy',
              style: TextStyle(color: Color(0xFF64748B), fontFamily: 'Inter'),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              ref.read(addressesControllerProvider.notifier).deleteContact(id);
            },
            child: const Text(
              'Xóa',
              style: TextStyle(color: Color(0xFFBA1A1A), fontFamily: 'Inter'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShimmerList() {
    return Shimmer.fromColors(
      baseColor: const Color(0xFFF1F5F9),
      highlightColor: const Color(0xFFF8FAFC),
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 3,
        itemBuilder: (context, index) => Container(
          margin: const EdgeInsets.only(bottom: 16),
          height: 180,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),
        ),
      ),
    );
  }
}

// ======================== ADDRESS FORM SHEET WIDGET ========================
class _AddressFormSheet extends ConsumerStatefulWidget {
  final Contact? contact;

  const _AddressFormSheet({this.contact});

  @override
  ConsumerState<_AddressFormSheet> createState() => _AddressFormSheetState();
}

class _AddressFormSheetState extends ConsumerState<_AddressFormSheet> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _addressController;
  late TextEditingController _detailController;

  String _addressType = 'Home'; // 'Home' | 'Office' | 'Other'
  double? _latitude;
  double? _longitude;

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
    _addressType = widget.contact?.addressType ?? 'Home';
    _latitude = widget.contact?.latitude;
    _longitude = widget.contact?.longitude;

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

    final name = _nameController.text.trim();
    final phone = _phoneController.text.trim();
    final address = _addressController.text.trim();
    final detail = _detailController.text.trim();

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
              latitude: _latitude ?? 0.0,
              longitude: _longitude ?? 0.0,
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
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

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
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0F172A),
                      fontFamily: 'Inter',
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.close_rounded,
                      color: Color(0xFF64748B),
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Full Name
              TextFormField(
                controller: _nameController,
                style: const TextStyle(fontFamily: 'Inter', fontSize: 14),
                decoration: InputDecoration(
                  labelText: 'Recipient Full Name',
                  labelStyle: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 13,
                    color: Color(0xFF64748B),
                  ),
                  filled: true,
                  fillColor: const Color(0xFFF8FAFC),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Color(0xFF0F172A),
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
                style: const TextStyle(fontFamily: 'Inter', fontSize: 14),
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  labelStyle: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 13,
                    color: Color(0xFF64748B),
                  ),
                  filled: true,
                  fillColor: const Color(0xFFF8FAFC),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Color(0xFF0F172A),
                      width: 1.5,
                    ),
                  ),
                ),
                validator: (val) => (val == null || val.trim().isEmpty)
                    ? 'Please enter phone number'
                    : null,
              ),
              const SizedBox(height: 16),

              // Address Search Autocomplete Field
              Stack(
                clipBehavior: Clip.none,
                children: [
                  TextFormField(
                    controller: _addressController,
                    focusNode: _addressFocusNode,
                    style: const TextStyle(fontFamily: 'Inter', fontSize: 14),
                    decoration: InputDecoration(
                      labelText: 'Address (Search / Autocomplete)',
                      labelStyle: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 13,
                        color: Color(0xFF64748B),
                      ),
                      filled: true,
                      fillColor: const Color(0xFFF8FAFC),
                      suffixIcon: _isSearching
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: Padding(
                                padding: EdgeInsets.all(12.0),
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Color(0xFF0F172A),
                                ),
                              ),
                            )
                          : const Icon(
                              Icons.map_rounded,
                              color: Color(0xFF64748B),
                            ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color(0xFF0F172A),
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
                        color: Colors.white,
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
                                  style: const TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 13,
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
                style: const TextStyle(fontFamily: 'Inter', fontSize: 14),
                decoration: InputDecoration(
                  labelText: 'Address Details (Apartment, Suite, etc.)',
                  labelStyle: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 13,
                    color: Color(0xFF64748B),
                  ),
                  filled: true,
                  fillColor: const Color(0xFFF8FAFC),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Color(0xFF0F172A),
                      width: 1.5,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Address Type Chips
              const Text(
                'Address Type',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF64748B),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  _buildTypeChip('Home', 'Home'),
                  const SizedBox(width: 8),
                  _buildTypeChip('Office', 'Office'),
                  const SizedBox(width: 8),
                  _buildTypeChip('Other', 'Other'),
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
                    backgroundColor: const Color(0xFF0F172A),
                    foregroundColor: Colors.white,
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

  Widget _buildTypeChip(String type, String label) {
    final isSelected = _addressType == type;
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
        color: isSelected ? Colors.white : const Color(0xFF64748B),
        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        fontFamily: 'Inter',
        fontSize: 13,
      ),
      selectedColor: const Color(0xFF0F172A),
      backgroundColor: const Color(0xFFF1F5F9),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      side: BorderSide.none,
      showCheckmark: false,
    );
  }
}

class _EmptyAddresses extends StatelessWidget {
  const _EmptyAddresses();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.location_off_rounded,
              size: 64,
              color: Color(0xFF94A3B8),
            ),
            const SizedBox(height: 16),
            const Text(
              'Sổ địa chỉ trống',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0F172A),
                fontFamily: 'Inter',
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Bạn chưa thêm địa chỉ nhận hàng nào. Hãy thêm một địa chỉ để bắt đầu mua sắm thuận tiện nhé.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                color: Color(0xFF64748B),
                fontFamily: 'Inter',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
