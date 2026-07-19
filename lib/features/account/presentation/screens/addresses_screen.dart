import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../shared/models/geocode_model.dart';
import '../../data/models/account_model.dart';
import '../providers/account_provider.dart';
import '../providers/addresses_provider.dart';

class AddressesScreen extends ConsumerWidget {
  const AddressesScreen({super.key});

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
        data: (_) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Cập nhật sổ địa chỉ thành công!'),
              backgroundColor: Color(0xFF10B981),
            ),
          );
        },
      );
    });

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text(
          'Địa chỉ nhận hàng',
          style: TextStyle(
            color: Color(0xFF0F172A),
            fontWeight: FontWeight.bold,
            fontFamily: 'Inter',
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Color(0xFF0F172A),
            size: 20,
          ),
          onPressed: () => context.pop(),
        ),
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
                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: contacts.length,
                  itemBuilder: (context, index) {
                    final contact = contacts[index];
                    final isDefault = contact.id == defaultContactId;
                    return _buildContactCard(context, ref, contact, isDefault);
                  },
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
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Inter',
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
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            height: 48,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => _showAddressFormBottomSheet(context, ref),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0F172A),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Thêm địa chỉ mới',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Inter',
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContactCard(
    BuildContext context,
    WidgetRef ref,
    Contact contact,
    bool isDefault,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24), // Bo góc Card 24px
        border: Border.all(
          color: isDefault ? const Color(0xFF0F172A) : const Color(0xFFF1F5F9),
          width: isDefault ? 1.5 : 1.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      _getAddressTypeIcon(contact.addressType),
                      color: const Color(0xFF64748B),
                      size: 18,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      contact.fullName,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0F172A),
                        fontFamily: 'Inter',
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.edit_outlined,
                        color: Color(0xFF64748B),
                        size: 20,
                      ),
                      onPressed: () => _showAddressFormBottomSheet(
                        context,
                        ref,
                        contact: contact,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.delete_outline_rounded,
                        color: Color(0xFFBA1A1A),
                        size: 20,
                      ),
                      onPressed: () => _confirmDelete(context, ref, contact),
                    ),
                  ],
                ),
              ],
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
            const SizedBox(height: 8),
            Text(
              contact.address,
              style: const TextStyle(
                fontSize: 13,
                height: 1.5,
                color: Color(0xFF334155),
                fontFamily: 'Inter',
              ),
            ),
            if (contact.addressDetail != null &&
                contact.addressDetail!.isNotEmpty) ...[
              const SizedBox(height: 4),
              Text(
                'Chi tiết: ${contact.addressDetail}',
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF64748B),
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Inter',
                ),
              ),
            ],
            const Divider(height: 24, color: Color(0xFFF1F5F9)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF1F5F9),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    contact.addressType == 'Home'
                        ? 'Nhà riêng'
                        : contact.addressType == 'Office'
                        ? 'Văn phòng'
                        : 'Khác',
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF0F172A),
                      fontFamily: 'Inter',
                    ),
                  ),
                ),
                if (isDefault)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF0F172A).withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'Mặc định',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0F172A),
                        fontFamily: 'Inter',
                      ),
                    ),
                  )
                else
                  TextButton(
                    onPressed: () {
                      ref
                          .read(accountControllerProvider.notifier)
                          .updateProfile(
                            UpdateProfileRequest(defaultContactId: contact.id),
                          );
                    },
                    child: const Text(
                      'Đặt làm mặc định',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0F172A),
                        fontFamily: 'Inter',
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  IconData _getAddressTypeIcon(String type) {
    switch (type) {
      case 'Home':
        return Icons.home_work_outlined;
      case 'Office':
        return Icons.business_outlined;
      default:
        return Icons.location_on_outlined;
    }
  }

  void _confirmDelete(BuildContext context, WidgetRef ref, Contact contact) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Xóa địa chỉ',
          style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Inter'),
        ),
        content: Text(
          'Bạn có chắc chắn muốn xóa địa chỉ của "${contact.fullName}" khỏi sổ địa chỉ?',
          style: const TextStyle(fontFamily: 'Inter'),
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
              ref
                  .read(addressesControllerProvider.notifier)
                  .deleteContact(contact.id);
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

  void _showAddressFormBottomSheet(
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

// ======================== BOTTOM SHEET FORM WIDGET ========================
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
  double _latitude = 0.0;
  double _longitude = 0.0;

  List<GeocodeSuggestion> _suggestions = [];
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.contact?.fullName);
    _phoneController = TextEditingController(text: widget.contact?.phone);
    _addressController = TextEditingController(text: widget.contact?.address);
    _detailController = TextEditingController(
      text: widget.contact?.addressDetail,
    );

    if (widget.contact != null) {
      _addressType = widget.contact!.addressType;
      _latitude = widget.contact!.latitude ?? 0.0;
      _longitude = widget.contact!.longitude ?? 0.0;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _detailController.dispose();
    super.dispose();
  }

  void _onAddressChanged(String query) async {
    if (query.length < 3) {
      setState(() {
        _suggestions = [];
      });
      return;
    }

    setState(() {
      _isSearching = true;
    });

    try {
      final results = await ref.read(searchGeocodeProvider(query).future);
      if (mounted) {
        setState(() {
          _suggestions = results;
          _isSearching = false;
        });
      }
    } catch (_) {
      if (mounted) {
        setState(() {
          _isSearching = false;
        });
      }
    }
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    if (widget.contact == null) {
      // Create new
      ref
          .read(addressesControllerProvider.notifier)
          .createContact(
            CreateContactRequest(
              fullName: _nameController.text.trim(),
              phone: _phoneController.text.trim(),
              address: _addressController.text.trim(),
              addressDetail: _detailController.text.trim().isNotEmpty
                  ? _detailController.text.trim()
                  : null,
              addressType: _addressType,
              latitude: _latitude,
              longitude: _longitude,
            ),
          );
    } else {
      // Update existing
      ref
          .read(addressesControllerProvider.notifier)
          .updateContact(
            UpdateContactRequest(
              contactId: widget.contact!.id,
              fullName: _nameController.text.trim(),
              phone: _phoneController.text.trim(),
              address: _addressController.text.trim(),
              addressDetail: _detailController.text.trim().isNotEmpty
                  ? _detailController.text.trim()
                  : null,
              addressType: _addressType,
              latitude: _latitude,
              longitude: _longitude,
            ),
          );
    }

    Navigator.of(context).pop();
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
                    widget.contact == null ? 'Thêm địa chỉ mới' : 'Sửa địa chỉ',
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

              // Full Name Field
              TextFormField(
                controller: _nameController,
                style: const TextStyle(fontFamily: 'Inter', fontSize: 14),
                decoration: InputDecoration(
                  labelText: 'Họ và tên người nhận',
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
                    ? 'Vui lòng điền họ tên'
                    : null,
              ),
              const SizedBox(height: 16),

              // Phone Field
              TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                style: const TextStyle(fontFamily: 'Inter', fontSize: 14),
                decoration: InputDecoration(
                  labelText: 'Số điện thoại',
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
                    ? 'Vui lòng điền số điện thoại'
                    : null,
              ),
              const SizedBox(height: 16),

              // Address Field with Geocoding Auto Suggestions
              TextFormField(
                controller: _addressController,
                style: const TextStyle(fontFamily: 'Inter', fontSize: 14),
                decoration: InputDecoration(
                  labelText: 'Địa chỉ nhận hàng (Tìm kiếm/Nhập địa chỉ)',
                  labelStyle: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 13,
                    color: Color(0xFF64748B),
                  ),
                  suffixIcon: _isSearching
                      ? const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Color(0xFF0F172A),
                            ),
                          ),
                        )
                      : const Icon(
                          Icons.search_rounded,
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
                onChanged: _onAddressChanged,
                validator: (val) => (val == null || val.trim().isEmpty)
                    ? 'Vui lòng nhập hoặc chọn địa chỉ'
                    : null,
              ),

              // Search Suggestions list UI
              if (_suggestions.isNotEmpty) ...[
                const SizedBox(height: 8),
                Container(
                  constraints: const BoxConstraints(maxHeight: 180),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFFE2E8F0)),
                  ),
                  child: ListView.separated(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount: _suggestions.length,
                    separatorBuilder: (context, index) =>
                        const Divider(height: 1, color: Color(0xFFF1F5F9)),
                    itemBuilder: (context, index) {
                      final item = _suggestions[index];
                      return ListTile(
                        leading: const Icon(
                          Icons.location_on_outlined,
                          size: 18,
                          color: Color(0xFF64748B),
                        ),
                        title: Text(
                          item.displayName,
                          style: const TextStyle(
                            fontSize: 13,
                            fontFamily: 'Inter',
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            _addressController.text = item.displayName;
                            _latitude = item.latitude;
                            _longitude = item.longitude;
                            _suggestions = []; // Ẩn gợi ý
                          });
                        },
                      );
                    },
                  ),
                ),
              ],
              const SizedBox(height: 16),

              // Address Detail Field
              TextFormField(
                controller: _detailController,
                style: const TextStyle(fontFamily: 'Inter', fontSize: 14),
                decoration: InputDecoration(
                  labelText: 'Chi tiết căn hộ, số nhà, tầng... (Tùy chọn)',
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
              const SizedBox(height: 20),

              // Address Type Chips Selection
              const Text(
                'Loại địa chỉ',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0F172A),
                  fontFamily: 'Inter',
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  _buildTypeChip('Home', 'Nhà riêng'),
                  const SizedBox(width: 10),
                  _buildTypeChip('Office', 'Văn phòng'),
                  const SizedBox(width: 10),
                  _buildTypeChip('Other', 'Khác'),
                ],
              ),
              const SizedBox(height: 32),

              // Action Buttons
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
                    widget.contact == null ? 'Thêm địa chỉ' : 'Cập nhật',
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
