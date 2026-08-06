import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

import 'package:shopnexus_flutter_app/api/generated/model/category.dart';
import 'package:shopnexus_flutter_app/api/generated/model/contact.dart';
import 'package:shopnexus_flutter_app/api/generated/model/listing_condition.dart';
import 'package:shopnexus_flutter_app/api/generated/model/listing_suggestion.dart';
import 'package:shopnexus_flutter_app/api/generated/model/price_mode.dart';
import 'package:shopnexus_flutter_app/core/theme/app_colors.dart';
import 'package:shopnexus_flutter_app/features/seller/data/models/listing_draft.dart';
import 'package:shopnexus_flutter_app/features/seller/presentation/providers/listing_suggestion_provider.dart';
import 'package:shopnexus_flutter_app/features/seller/presentation/providers/seller_products_provider.dart';
import 'package:shopnexus_flutter_app/features/kyc/presentation/providers/selling_gate_provider.dart';
import 'package:shopnexus_flutter_app/shared/widgets/condition_badge.dart';

/// "Photo in, listing out": the seller snaps the item, says a sentence about it,
/// and gets a filled-in form to correct. The AI only fills the form in —
/// `POST /listings` at the bottom of this screen is what creates the listing.
class ListingSuggestionScreen extends ConsumerStatefulWidget {
  const ListingSuggestionScreen({super.key});

  @override
  ConsumerState<ListingSuggestionScreen> createState() =>
      _ListingSuggestionScreenState();
}

class _ListingSuggestionScreenState
    extends ConsumerState<ListingSuggestionScreen> {
  /// Every price on this marketplace is in the smallest unit of one currency,
  /// and the app renders VND everywhere (see MoneyUtils).
  static const _currency = 'VND';

  final _noteController = TextEditingController();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();
  final _weightController = TextEditingController();
  final _quantityController = TextEditingController(text: '1');

  String? _categoryId;
  ListingCondition? _condition;
  PriceMode _priceMode = PriceMode.fixed;
  List<String> _tags = [];
  List<MapEntry<String, String>> _specs = [];

  @override
  void dispose() {
    _noteController.dispose();
    _nameController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    _weightController.dispose();
    _quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final state = ref.watch(listingSuggestionProvider);
    final notifier = ref.read(listingSuggestionProvider.notifier);

    // A fresh answer refills the boxes the seller has not been editing yet.
    ref.listen(listingSuggestionProvider.select((s) => s.suggestion), (
      previous,
      next,
    ) {
      if (next != null && next != previous) _applySuggestion(next);
    });

    // Bước 0: server chặn `POST /listings` nếu chưa định danh, nên form chỉ mở
    // khi đã qua. Đọc lỗi thì *cho qua* — server vẫn là cái chặn thật, và một
    // lần mất mạng không được biến người bán đã định danh thành người không.
    final eligibility = ref.watch(sellingEligibilityProvider);
    if (eligibility.isLoading) return _gateShell(const _GateLoading());
    final gate = eligibility.value;
    if (gate != null && !gate.allowed) {
      return _gateShell(_IdentityGate(eligibility: gate));
    }

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.surface,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text(
          'Đăng sản phẩm',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.primary,
          ),
        ),
        actions: [
          IconButton(
            tooltip: 'Làm lại từ đầu',
            icon: Icon(
              Icons.refresh_rounded,
              color: theme.colorScheme.onSurface,
            ),
            onPressed: () {
              notifier.reset();
              _clearForm();
            },
          ),
          const SizedBox(width: 4),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
          children: [
            if (state.errorMessage != null) ...[
              _errorBanner(state.errorMessage!),
              const SizedBox(height: 12),
            ],
            _photoSection(state, notifier),
            const SizedBox(height: 20),
            _noteSection(),
            const SizedBox(height: 12),
            _suggestButton(state, notifier),
            const SizedBox(height: 20),
            if (state.suggesting)
              _formSkeleton()
            else ...[
              if (state.suggestion?.transcript.isNotEmpty ?? false) ...[
                _transcriptCard(state.suggestion!.transcript),
                const SizedBox(height: 16),
              ],
              _listingForm(state),
            ],
          ],
        ),
      ),
      bottomNavigationBar: _bottomBar(state, notifier),
    );
  }

  /// Bước 0 dùng chung khung của luồng đăng bán — cùng AppBar, cùng tiêu đề —
  /// vì định danh *là* một bước của việc đăng tin, không phải một đích khác mà
  /// người bán bị đá sang.
  Widget _gateShell(Widget body) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.surface,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text(
          'Đăng sản phẩm',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.primary,
          ),
        ),
      ),
      body: SafeArea(child: body),
    );
  }

  // --- PHOTOS ---

  Widget _photoSection(
    ListingSuggestionState state,
    ListingSuggestionNotifier notifier,
  ) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle('Ảnh sản phẩm (${state.photos.length})'),
        const SizedBox(height: 4),
        Text(
          'AI đọc ba ảnh đầu tiên. Ảnh đầu cũng là ảnh bìa của tin.',
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 104,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _addPhotoTile(
                icon: Icons.photo_camera_outlined,
                label: 'Chụp ảnh',
                onTap: notifier.addPhotoFromCamera,
              ),
              _addPhotoTile(
                icon: Icons.photo_library_outlined,
                label: 'Thư viện',
                onTap: notifier.addPhotosFromGallery,
              ),
              ...state.photos.map(
                (photo) => _photoTile(photo, notifier.removePhoto),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _addPhotoTile({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 92,
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          color: _cardColor,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: _borderColor),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: theme.colorScheme.primary),
            const SizedBox(height: 6),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: theme.colorScheme.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _photoTile(ListingPhoto photo, void Function(String) onRemove) {
    return Container(
      width: 92,
      margin: const EdgeInsets.only(right: 8),
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.file(File(photo.path), fit: BoxFit.cover),
          ),
          if (photo.uploading)
            Container(
              decoration: BoxDecoration(
                color: Colors.black45,
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Center(
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          if (photo.errorMessage != null)
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Center(
                child: Text(
                  photo.errorMessage!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white, fontSize: 10),
                ),
              ),
            ),
          Positioned(
            top: 4,
            right: 4,
            child: GestureDetector(
              onTap: () => onRemove(photo.path),
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                  color: Colors.black54,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.close, size: 14, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- WHAT THE SELLER SAID ---

  Widget _noteSection() {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle('Bạn muốn nói gì về sản phẩm?'),
        const SizedBox(height: 4),
        // No audio recorder in the app, and none is needed here: the phone's own
        // dictation key on the keyboard fills this box by voice just as well,
        // and the data layer still accepts a recording if one ever arrives.
        Text(
          'Gõ vài dòng, hoặc bấm phím micro trên bàn phím để nói.',
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: _noteController,
          maxLines: 4,
          maxLength: 2000,
          style: TextStyle(color: theme.colorScheme.onSurface),
          decoration: _inputDecoration(
            hint:
                'Ví dụ: bán iPhone 12 64GB pin 89%, còn bảo hành, 5 triệu, có vài vết xước ở viền',
          ),
        ),
      ],
    );
  }

  Widget _suggestButton(
    ListingSuggestionState state,
    ListingSuggestionNotifier notifier,
  ) {
    final theme = Theme.of(context);

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: state.suggesting
            ? null
            : () {
                FocusScope.of(context).unfocus();
                notifier.requestSuggestion(note: _noteController.text);
              },
        icon: state.suggesting
            ? SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: theme.colorScheme.onPrimary,
                ),
              )
            : const Icon(Icons.auto_awesome, size: 18),
        label: Text(
          state.suggesting ? 'AI đang xem...' : 'Để AI điền giúp',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 14),
          backgroundColor: theme.colorScheme.primary,
          foregroundColor: theme.colorScheme.onPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  Widget _transcriptCard(String transcript) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'AI nghe được:',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            transcript,
            style: TextStyle(
              fontSize: 13,
              fontStyle: FontStyle.italic,
              color: theme.colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }

  // --- THE FORM ---

  Widget _listingForm(ListingSuggestionState state) {
    final theme = Theme.of(context);
    final categoryValue = state.categories.any((c) => c.id == _categoryId)
        ? _categoryId
        : null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle('Thông tin tin đăng'),
        const SizedBox(height: 4),
        Text(
          'Sửa lại bất cứ ô nào. Ô trống là ô AI không dám đoán.',
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 14),

        _fieldLabel('Tên sản phẩm *'),
        TextField(
          controller: _nameController,
          maxLength: 200,
          style: TextStyle(color: theme.colorScheme.onSurface),
          decoration: _inputDecoration(hint: 'Ví dụ: iPhone 12 64GB xanh'),
        ),
        const SizedBox(height: 12),

        _fieldLabel('Mô tả'),
        TextField(
          controller: _descriptionController,
          maxLines: 5,
          style: TextStyle(color: theme.colorScheme.onSurface),
          decoration: _inputDecoration(
            hint:
                'Tình trạng thật của sản phẩm, khuyết điểm, phụ kiện kèm theo',
          ),
        ),
        const SizedBox(height: 16),

        Row(
          children: [
            _fieldLabel('Danh mục *'),
            const Spacer(),
            if (state.categories.isEmpty)
              TextButton(
                onPressed: ref
                    .read(listingSuggestionProvider.notifier)
                    .reloadPickers,
                child: const Text('Tải lại'),
              ),
          ],
        ),
        DropdownButtonFormField<String>(
          initialValue: categoryValue,
          isExpanded: true,
          decoration: _inputDecoration(),
          hint: Text(
            state.categories.isEmpty
                ? 'Chưa tải được danh mục'
                : 'Chọn danh mục',
            style: TextStyle(color: theme.colorScheme.onSurfaceVariant),
          ),
          items: state.categories
              .map(
                (category) => DropdownMenuItem<String>(
                  value: category.id,
                  child: Text(
                    _categoryLabel(category, state.categories),
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: theme.colorScheme.onSurface),
                  ),
                ),
              )
              .toList(),
          onChanged: (value) => setState(() => _categoryId = value),
        ),
        const SizedBox(height: 16),

        _fieldLabel('Tình trạng *'),
        Wrap(
          spacing: 8,
          children: ListingCondition.values
              .map(
                (condition) => ChoiceChip(
                  label: Text(condition.label),
                  selected: _condition == condition,
                  selectedColor: theme.colorScheme.primary,
                  backgroundColor: theme.colorScheme.surfaceContainerHighest,
                  labelStyle: TextStyle(
                    fontSize: 12,
                    fontWeight: _condition == condition
                        ? FontWeight.bold
                        : FontWeight.normal,
                    color: _condition == condition
                        ? theme.colorScheme.onPrimary
                        : theme.colorScheme.onSurfaceVariant,
                  ),
                  onSelected: (_) => setState(() => _condition = condition),
                ),
              )
              .toList(),
        ),
        const SizedBox(height: 16),

        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _fieldLabel('Giá bán (đ) *'),
                  TextField(
                    controller: _priceController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    style: TextStyle(color: theme.colorScheme.onSurface),
                    decoration: _inputDecoration(hint: '5000000'),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _fieldLabel('Khối lượng (g) *'),
                  TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    style: TextStyle(color: theme.colorScheme.onSurface),
                    decoration: _inputDecoration(hint: '350'),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          'Khối lượng là cơ sở để hãng vận chuyển báo giá cho người mua.',
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 16),

        _fieldLabel('Số lượng'),
        TextField(
          controller: _quantityController,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          style: TextStyle(color: theme.colorScheme.onSurface),
          decoration: _inputDecoration(hint: '1'),
        ),
        const SizedBox(height: 16),

        _fieldLabel('Cách bán'),
        Wrap(
          spacing: 8,
          children: PriceMode.values
              .map(
                (mode) => ChoiceChip(
                  label: Text(
                    mode == PriceMode.fixed
                        ? 'Giá cố định'
                        : 'Cho phép thương lượng',
                  ),
                  selected: _priceMode == mode,
                  selectedColor: theme.colorScheme.primary,
                  backgroundColor: theme.colorScheme.surfaceContainerHighest,
                  labelStyle: TextStyle(
                    fontSize: 12,
                    fontWeight: _priceMode == mode
                        ? FontWeight.bold
                        : FontWeight.normal,
                    color: _priceMode == mode
                        ? theme.colorScheme.onPrimary
                        : theme.colorScheme.onSurfaceVariant,
                  ),
                  onSelected: (_) => setState(() => _priceMode = mode),
                ),
              )
              .toList(),
        ),
        const SizedBox(height: 16),

        _fieldLabel('Thẻ (${_tags.length}/$maxListingTags)'),
        _tagEditor(),
        const SizedBox(height: 16),

        _fieldLabel('Thông số'),
        _specEditor(),
      ],
    );
  }

  Widget _tagEditor() {
    final theme = Theme.of(context);

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        ..._tags.map(
          (tag) => Chip(
            label: Text(tag),
            backgroundColor: theme.colorScheme.primary.withAlpha(30),
            labelStyle: TextStyle(
              color: theme.colorScheme.primary,
              fontSize: 12,
            ),
            deleteIcon: const Icon(Icons.close, size: 14),
            onDeleted: () => setState(() => _tags.remove(tag)),
          ),
        ),
        ActionChip(
          avatar: const Icon(Icons.add, size: 16),
          label: const Text('Thêm thẻ'),
          onPressed: _addTag,
        ),
      ],
    );
  }

  /// A spec is deleted and re-added rather than edited in place: two text fields
  /// per row on a phone is a form nobody fills in, and the pairs are short.
  Widget _specEditor() {
    final theme = Theme.of(context);

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        ..._specs.map(
          (spec) => Chip(
            label: Text('${spec.key}: ${spec.value}'),
            backgroundColor: theme.colorScheme.surfaceContainerHighest,
            labelStyle: TextStyle(
              color: theme.colorScheme.onSurface,
              fontSize: 12,
            ),
            deleteIcon: const Icon(Icons.close, size: 14),
            onDeleted: () => setState(() => _specs.remove(spec)),
          ),
        ),
        ActionChip(
          avatar: const Icon(Icons.add, size: 16),
          label: const Text('Thêm thông số'),
          onPressed: _addSpec,
        ),
      ],
    );
  }

  // --- BOTTOM BAR ---

  Widget _bottomBar(
    ListingSuggestionState state,
    ListingSuggestionNotifier notifier,
  ) {
    final theme = Theme.of(context);
    final busy = state.submitting;

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
      decoration: BoxDecoration(
        color: _cardColor,
        border: Border(top: BorderSide(color: _borderColor)),
      ),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: busy ? null : () => _submit(publish: false),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                foregroundColor: theme.colorScheme.primary,
                side: BorderSide(color: theme.colorScheme.primary),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text('Lưu nháp'),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: ElevatedButton(
              onPressed: busy ? null : () => _submit(publish: true),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                backgroundColor: theme.colorScheme.primary,
                foregroundColor: theme.colorScheme.onPrimary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: busy
                  ? SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: theme.colorScheme.onPrimary,
                      ),
                    )
                  : const Text(
                      'Đăng bán',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  // --- ACTIONS ---

  Future<void> _submit({required bool publish}) async {
    FocusScope.of(context).unfocus();
    final state = ref.read(listingSuggestionProvider);
    final notifier = ref.read(listingSuggestionProvider.notifier);

    final name = _nameController.text.trim();
    final price = int.tryParse(_priceController.text.trim()) ?? 0;
    final weight = int.tryParse(_weightController.text.trim()) ?? 0;
    final quantity = int.tryParse(_quantityController.text.trim()) ?? 0;

    final complaint = name.isEmpty
        ? 'Nhập tên sản phẩm.'
        : _categoryId == null
        ? 'Chọn danh mục cho sản phẩm.'
        : _condition == null
        ? 'Chọn tình trạng sản phẩm.'
        : price <= 0
        ? 'Nhập giá bán.'
        : weight <= 0
        ? 'Nhập khối lượng (gam) để hãng vận chuyển báo giá được.'
        : quantity <= 0
        ? 'Nhập số lượng, ít nhất 1.'
        : null;
    if (complaint != null) {
      _snack(complaint, error: true);
      return;
    }

    // Publication is what takes the pickup address, so it is asked for here and
    // only here — a draft has no location to freeze yet.
    String? pickupContactId;
    if (publish) {
      final choice = await _pickPickupContact(state.contacts);
      if (choice == null) return;
      pickupContactId = choice.contactId;
    }

    final attachments = state.photos
        .map((photo) => photo.resourceId)
        .whereType<String>()
        .toList();

    final request = listingDraftRequest(
      name: name,
      description: _descriptionController.text.trim(),
      categoryId: _categoryId!,
      condition: _condition!,
      currency: _currency,
      priceMode: _priceMode,
      price: price,
      weightG: weight,
      quantity: quantity,
      attachments: attachments,
      tags: _tags,
      specifications: <String, Object>{
        for (final spec in _specs) spec.key: spec.value,
      },
    );

    final ok = await notifier.submit(
      request: request,
      publish: publish,
      pickupContactId: pickupContactId,
    );
    if (!mounted) return;

    if (!ok) {
      _snack(
        ref.read(listingSuggestionProvider).errorMessage ??
            'Không lưu được sản phẩm.',
        error: true,
      );
      return;
    }

    ref.invalidate(sellerProductsProvider);
    _snack(
      publish
          ? 'Đã gửi sản phẩm đi duyệt. Tin sẽ lên sàn sau khi được kiểm duyệt.'
          : 'Đã lưu nháp. Bạn có thể gửi duyệt sau.',
    );
    context.pop();
  }

  Future<_PickupChoice?> _pickPickupContact(List<Contact> contacts) {
    final theme = Theme.of(context);

    return showModalBottomSheet<_PickupChoice>(
      context: context,
      backgroundColor: _cardColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (sheetContext) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Lấy hàng ở địa chỉ nào?',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Đây cũng là vị trí người mua thấy và dùng để lọc tin.',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.home_outlined,
                color: theme.colorScheme.primary,
              ),
              title: Text(
                'Địa chỉ lấy hàng mặc định',
                style: TextStyle(color: theme.colorScheme.onSurface),
              ),
              onTap: () =>
                  Navigator.pop(sheetContext, const _PickupChoice(null)),
            ),
            ...contacts.map(
              (contact) => ListTile(
                leading: Icon(
                  contact.isDefaultPickup
                      ? Icons.star_rounded
                      : Icons.location_on_outlined,
                  color: theme.colorScheme.primary,
                ),
                title: Text(
                  contact.fullName,
                  style: TextStyle(color: theme.colorScheme.onSurface),
                ),
                subtitle: Text(
                  contact.address,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: theme.colorScheme.onSurfaceVariant),
                ),
                onTap: () =>
                    Navigator.pop(sheetContext, _PickupChoice(contact.id)),
              ),
            ),
            if (contacts.isEmpty)
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  'Bạn chưa lưu địa chỉ nào. Hãy thêm địa chỉ trong phần Tài khoản trước khi đăng bán.',
                  style: TextStyle(color: theme.colorScheme.onSurfaceVariant),
                ),
              ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Future<void> _addTag() async {
    // Said before the dialog opens, not after it is filled in: the route counts
    // the tags and refuses the whole listing over ten, and typing an eleventh
    // only to lose it at "Đăng bán" is the worst place to learn that.
    if (_tags.length >= maxListingTags) {
      _snack('Mỗi tin chỉ gắn được tối đa $maxListingTags thẻ.', error: true);
      return;
    }

    final controller = TextEditingController();
    final raw = await _promptText(
      title: 'Thêm thẻ',
      hint: 'handmade',
      controller: controller,
    );
    controller.dispose();
    setState(() => _tags = listingTags([..._tags, raw ?? '']));
  }

  Future<void> _addSpec() async {
    final keyController = TextEditingController();
    final valueController = TextEditingController();
    final theme = Theme.of(context);

    final added = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: _cardColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(
          'Thêm thông số',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.onSurface,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: keyController,
              autofocus: true,
              style: TextStyle(color: theme.colorScheme.onSurface),
              decoration: _inputDecoration(
                hint: 'Tên thông số, ví dụ: Dung lượng',
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: valueController,
              style: TextStyle(color: theme.colorScheme.onSurface),
              decoration: _inputDecoration(hint: 'Giá trị, ví dụ: 64GB'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: Text(
              'Hủy',
              style: TextStyle(color: theme.colorScheme.onSurfaceVariant),
            ),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(dialogContext, true),
            style: ElevatedButton.styleFrom(
              backgroundColor: theme.colorScheme.primary,
              foregroundColor: theme.colorScheme.onPrimary,
            ),
            child: const Text('Thêm'),
          ),
        ],
      ),
    );

    final key = keyController.text.trim();
    final value = valueController.text.trim();
    keyController.dispose();
    valueController.dispose();
    if (added != true || key.isEmpty || value.isEmpty) return;
    setState(() {
      _specs.removeWhere((spec) => spec.key == key);
      _specs.add(MapEntry(key, value));
    });
  }

  Future<String?> _promptText({
    required String title,
    required String hint,
    required TextEditingController controller,
  }) {
    final theme = Theme.of(context);

    return showDialog<String>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: _cardColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.onSurface,
          ),
        ),
        content: TextField(
          controller: controller,
          autofocus: true,
          style: TextStyle(color: theme.colorScheme.onSurface),
          decoration: _inputDecoration(hint: hint),
          onSubmitted: (value) => Navigator.pop(dialogContext, value),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: Text(
              'Hủy',
              style: TextStyle(color: theme.colorScheme.onSurfaceVariant),
            ),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(dialogContext, controller.text),
            style: ElevatedButton.styleFrom(
              backgroundColor: theme.colorScheme.primary,
              foregroundColor: theme.colorScheme.onPrimary,
            ),
            child: const Text('Thêm'),
          ),
        ],
      ),
    );
  }

  void _applySuggestion(ListingSuggestion suggestion) {
    _nameController.text = suggestion.name;
    _descriptionController.text = suggestion.description;
    // A value the model could not stand behind comes back null or empty and
    // stays a blank box — a wrong number the seller has to notice is worse.
    _priceController.text = suggestion.price?.toString() ?? '';
    _weightController.text = suggestion.weightG?.toString() ?? '';
    setState(() {
      _categoryId = suggestion.categoryId;
      _condition = _conditionOf(suggestion.condition);
      // The model answers with a list of its own, and a generous one would
      // otherwise put the seller over the count with nothing they typed.
      _tags = listingTags(suggestion.tags);
      _specs = suggestion.specifications.entries
          .map((entry) => MapEntry(entry.key, entry.value.toString()))
          .toList();
    });
  }

  void _clearForm() {
    _noteController.clear();
    _nameController.clear();
    _descriptionController.clear();
    _priceController.clear();
    _weightController.clear();
    _quantityController.text = '1';
    setState(() {
      _categoryId = null;
      _condition = null;
      _priceMode = PriceMode.fixed;
      _tags = [];
      _specs = [];
    });
  }

  // --- SMALL HELPERS ---

  Color get _cardColor => Theme.of(context).brightness == Brightness.dark
      ? AppColors.darkSurface
      : Colors.white;

  Color get _borderColor => Theme.of(context).brightness == Brightness.dark
      ? AppColors.darkPrimary.withAlpha(40)
      : const Color(0xFFE2E8F0);

  InputDecoration _inputDecoration({String? hint}) {
    final theme = Theme.of(context);

    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(color: theme.colorScheme.onSurfaceVariant),
      filled: true,
      fillColor: _cardColor,
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: _borderColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: _borderColor),
      ),
    );
  }

  Widget _sectionTitle(String text) {
    final theme = Theme.of(context);

    return Text(
      text,
      style: theme.textTheme.titleSmall?.copyWith(
        fontWeight: FontWeight.bold,
        color: theme.colorScheme.onSurface,
      ),
    );
  }

  Widget _fieldLabel(String text) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        text,
        style: theme.textTheme.bodySmall?.copyWith(
          fontWeight: FontWeight.w600,
          color: theme.colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }

  Widget _errorBanner(String message) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isDark
            ? const Color(0xFF991B1B).withAlpha(40)
            : const Color(0xFFFEF2F2),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark ? const Color(0xFF7F1D1D) : const Color(0xFFFCA5A5),
        ),
      ),
      child: Row(
        children: [
          const Icon(Icons.error_outline, color: Color(0xFFEF4444)),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              message,
              style: TextStyle(
                fontSize: 13,
                color: isDark
                    ? const Color(0xFFF87171)
                    : const Color(0xFF991B1B),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _formSkeleton() {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Shimmer.fromColors(
      baseColor: isDark ? Colors.grey[800]! : const Color(0xFFE2E8F0),
      highlightColor: isDark ? Colors.grey[700]! : const Color(0xFFF1F5F9),
      child: Column(
        children: List.generate(
          5,
          (index) => Container(
            height: index == 1 ? 96 : 52,
            margin: const EdgeInsets.only(bottom: 14),
            decoration: BoxDecoration(
              color: _cardColor,
              borderRadius: BorderRadius.circular(14),
            ),
          ),
        ),
      ),
    );
  }

  void _snack(String message, {bool error = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: error
            ? const Color(0xFFEF4444)
            : Theme.of(context).colorScheme.primary,
      ),
    );
  }

  /// The tree is flattened into one dropdown: a single choice does not need a
  /// walk, and the parent name is what disambiguates two leaves called the same.
  String _categoryLabel(Category category, List<Category> all) {
    final parents = all.where((c) => c.id == category.parentId);
    return parents.isEmpty
        ? category.name
        : '${parents.first.name} › ${category.name}';
  }

  /// The suggestion enum carries an extra empty member for "could not tell",
  /// which maps to no selection rather than to a guess.
  ListingCondition? _conditionOf(ListingSuggestionConditionEnum value) {
    switch (value) {
      case ListingSuggestionConditionEnum.new_:
        return ListingCondition.new_;
      case ListingSuggestionConditionEnum.used:
        return ListingCondition.used;
      case ListingSuggestionConditionEnum.damaged:
        return ListingCondition.damaged;
      case ListingSuggestionConditionEnum.empty:
        return null;
    }
  }
}

/// Null means "the seller's default pickup address", which is what omitting
/// `pickup_contact_id` means to the API — distinct from cancelling the sheet.
class _PickupChoice {
  const _PickupChoice(this.contactId);

  final String? contactId;
}

class _GateLoading extends StatelessWidget {
  const _GateLoading();

  @override
  Widget build(BuildContext context) =>
      const Center(child: CircularProgressIndicator());
}

/// Bước 0 của việc đăng tin: định danh.
///
/// Cùng một cái chặn, hai cảm giác trái ngược — "Bạn chưa được phép đăng tin"
/// đọc là bị loại, "Bước 1/2 của việc đăng tin" đọc là còn một việc phải làm.
/// Chỉ khác cách nói, nên chọn cách nói đúng là miễn phí.
class _IdentityGate extends StatelessWidget {
  const _IdentityGate({required this.eligibility});

  final SellingEligibility eligibility;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final (icon, title, body) = switch (eligibility.gate) {
      SellingGate.pending => (
        Icons.hourglass_top_rounded,
        'Hồ sơ định danh đang được duyệt',
        'Chúng tôi đang xem hồ sơ của bạn. Xong là bạn đăng tin được ngay, '
            'không cần nộp lại gì.',
      ),
      SellingGate.rejected => (
        Icons.error_outline_rounded,
        'Hồ sơ định danh chưa được chấp nhận',
        eligibility.rejectionReason?.isNotEmpty ?? false
            ? '${eligibility.rejectionReason}\n\nBạn nộp lại được ngay bây giờ.'
            : 'Bạn nộp lại được ngay bây giờ.',
      ),
      // notStarted, và cả `allowed` cho đủ nhánh — widget này không được dựng
      // cho người đã qua cửa.
      _ => (
        Icons.badge_outlined,
        'Bước 1/2 của việc đăng tin',
        'Mọi người bán trên ShopNexus đều đã định danh — đó là lý do người mua '
            'dám mua. Mất khoảng hai phút: ảnh giấy tờ và một ảnh chân dung.',
      ),
    };

    final action = switch (eligibility.gate) {
      SellingGate.pending => null,
      SellingGate.rejected => 'Nộp lại hồ sơ',
      _ => 'Định danh ngay',
    };

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: theme.colorScheme.primary.withAlpha(25),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 40, color: theme.colorScheme.primary),
            ),
            const SizedBox(height: 20),
            Text(
              title,
              textAlign: TextAlign.center,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              body,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                height: 1.5,
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 24),
            if (action != null)
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  // Định danh xong quay lại đúng đây, nên `push` chứ không `go`.
                  onPressed: () => context.push('/account/kyc'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.primary,
                    foregroundColor: theme.colorScheme.onPrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    action,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
