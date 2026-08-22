import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

import 'package:shopnexus_flutter_app/api/generated/model/category.dart';
import 'package:shopnexus_flutter_app/api/generated/model/contact.dart';
import 'package:shopnexus_flutter_app/api/generated/model/create_variant_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/listing_condition.dart';
import 'package:shopnexus_flutter_app/api/generated/model/listing_suggestion.dart';
import 'package:shopnexus_flutter_app/api/generated/model/price_mode.dart';
import 'package:shopnexus_flutter_app/core/theme/app_colors.dart';
import 'package:shopnexus_flutter_app/core/upload/upload_media.dart';
import 'package:shopnexus_flutter_app/core/utils/money_utils.dart';
import 'package:shopnexus_flutter_app/features/seller/data/models/listing_draft.dart';
import 'package:shopnexus_flutter_app/features/seller/presentation/providers/listing_suggestion_provider.dart';
import 'package:shopnexus_flutter_app/features/seller/presentation/providers/seller_products_provider.dart';
import 'package:shopnexus_flutter_app/features/kyc/presentation/providers/selling_gate_provider.dart';
import 'package:shopnexus_flutter_app/features/seller/presentation/widgets/tag_picker_sheet.dart';
import 'package:shopnexus_flutter_app/shared/widgets/condition_badge.dart';
import 'package:shopnexus_flutter_app/shared/widgets/upload_preview.dart';
import 'package:shopnexus_flutter_app/shared/widgets/video_preview.dart';

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

  List<_VariantFormItem> _variants = [_VariantFormItem()];

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
    for (final v in _variants) {
      v.dispose();
    }
    super.dispose();
  }

  void _handleBack() {
    if (context.canPop()) {
      context.pop();
    } else {
      context.go('/home');
    }
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

    return BackButtonListener(
      onBackButtonPressed: () async {
        _handleBack();
        return true;
      },
      child: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) return;
          _handleBack();
        },
        child: Scaffold(
          backgroundColor: theme.scaffoldBackgroundColor,
          appBar: AppBar(
            backgroundColor: theme.colorScheme.surface,
            elevation: 0,
            scrolledUnderElevation: 0,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_rounded,
                color: theme.colorScheme.onSurface,
              ),
              onPressed: _handleBack,
            ),
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
                  const SizedBox(height: 24),
                  _previewSection(state),
                ],
              ],
            ),
          ),
          bottomNavigationBar: _bottomBar(state, notifier),
        ),
      ),
    );
  }

  /// Bước 0 dùng chung khung của luồng đăng bán — cùng AppBar, cùng tiêu đề —
  /// vì định danh *là* một bước của việc đăng tin, không phải một đích khác mà
  /// người bán bị đá sang.
  Widget _gateShell(Widget body) {
    final theme = Theme.of(context);

    return BackButtonListener(
      onBackButtonPressed: () async {
        _handleBack();
        return true;
      },
      child: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) return;
          _handleBack();
        },
        child: Scaffold(
          backgroundColor: theme.scaffoldBackgroundColor,
          appBar: AppBar(
            backgroundColor: theme.colorScheme.surface,
            elevation: 0,
            scrolledUnderElevation: 0,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_rounded,
                color: theme.colorScheme.onSurface,
              ),
              onPressed: _handleBack,
            ),
            title: Text(
              'Đăng sản phẩm',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.primary,
              ),
            ),
          ),
          body: SafeArea(child: body),
        ),
      ),
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
        _sectionTitle('Ảnh & video sản phẩm (${state.photos.length})'),
        const SizedBox(height: 4),
        Text(
          'AI đọc ba tệp đầu tiên, nên hãy để ảnh lên trước. '
          'Ảnh đầu cũng là ảnh bìa của tin.',
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
                icon: Icons.videocam_outlined,
                label: 'Quay video',
                onTap: notifier.addVideoFromCamera,
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

  bool _isVideo(ListingPhoto photo) {
    final mime = photo.mime;
    return mime != null && UploadMedia.isVideo(mime);
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
            child: GestureDetector(
              // Ô 92px không xem video được; chạm vào mở trình phát đầy đủ.
              onTap: photo.previewUrl != null && _isVideo(photo)
                  ? () => VideoPlayerDialog.show(context, photo.previewUrl!)
                  : null,
              child: UploadPreview(
                bytes: photo.bytes,
                url: photo.previewUrl,
                mime: photo.mime,
              ),
            ),
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
          // Thẻ xem trước cắt tên ở hai dòng, nên nó phải chạy theo từng chữ —
          // biết tên bị cắt ở đâu *sau khi* đăng thì đã muộn.
          onChanged: (_) => setState(() {}),
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
        _buildCategorySelector(context, state),
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
        const SizedBox(height: 24),

        _variantsSection(),
      ],
    );
  }

  Widget _variantsSection() {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'BƯỚC 3 · PHIÊN BẢN',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.8,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Giá, tồn kho và kiện hàng',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onSurface,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Mỗi phiên bản là một lựa chọn người mua có thể đặt. Phiên bản đầu tiên sẽ làm giá đại diện.',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            OutlinedButton.icon(
              onPressed: () {
                setState(() {
                  _variants.add(
                    _VariantFormItem(
                      weight: _variants.isNotEmpty
                          ? _variants.first.weightController.text
                          : '',
                      attributes: [_AttributePair()],
                    ),
                  );
                });
              },
              icon: const Icon(Icons.add, size: 16),
              label: const Text('Thêm phiên bản'),
              style: OutlinedButton.styleFrom(
                foregroundColor: theme.colorScheme.onSurface,
                side: BorderSide(color: _borderColor),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        ..._variants.asMap().entries.map((entry) {
          final index = entry.key;
          final variant = entry.value;
          return _buildVariantCard(variant, index);
        }),
      ],
    );
  }

  Widget _buildVariantCard(_VariantFormItem variant, int index) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final priceVal = int.tryParse(variant.priceController.text.trim()) ?? 0;
    final priceSubtitle = priceVal > 0
        ? '${MoneyUtils.format(priceVal, currency: _currency)}${index == 0 ? ' · Giá đại diện' : ''}'
        : (index == 0 ? 'Chưa nhập giá · Giá đại diện' : 'Chưa nhập giá');

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: _cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: isDark
                  ? theme.colorScheme.surfaceContainerHighest.withAlpha(50)
                  : const Color(0xFFF8FAFC),
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
              border: Border(bottom: BorderSide(color: _borderColor)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'PHIÊN BẢN ${index + 1}',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                          color: theme.colorScheme.primary,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        priceSubtitle,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),
                ),
                if (_variants.length > 1)
                  IconButton(
                    icon: Icon(
                      Icons.delete_outline,
                      size: 20,
                      color: isDark ? const Color(0xFFEF4444) : Colors.red[700],
                    ),
                    tooltip: 'Xóa phiên bản',
                    onPressed: () {
                      setState(() {
                        variant.dispose();
                        _variants.removeAt(index);
                      });
                    },
                  ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Thuộc tính phân biệt
                Text(
                  'Thuộc tính phân biệt',
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onSurface,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Ví dụ Màu sắc · Đen, Dung lượng · 256 GB. Server dùng bộ này để ngăn phiên bản trùng nhau.',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                    fontSize: 12,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 10),

                // Attribute Rows
                ...variant.attributes.asMap().entries.map((attrEntry) {
                  final attrIndex = attrEntry.key;
                  final attr = attrEntry.value;

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: TextField(
                            controller: attr.keyController,
                            style: TextStyle(
                              color: theme.colorScheme.onSurface,
                              fontSize: 14,
                            ),
                            decoration: _inputDecoration(
                              hint: 'Thuộc tính (ví dụ: Màu sắc)',
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            controller: attr.valueController,
                            style: TextStyle(
                              color: theme.colorScheme.onSurface,
                              fontSize: 14,
                            ),
                            decoration: _inputDecoration(
                              hint: 'Giá trị (ví dụ: Đen)',
                            ),
                          ),
                        ),
                        if (variant.attributes.length > 1) ...[
                          const SizedBox(width: 4),
                          IconButton(
                            icon: Icon(
                              Icons.delete_outline,
                              size: 20,
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                            tooltip: 'Xóa thuộc tính',
                            onPressed: () {
                              setState(() {
                                attr.dispose();
                                variant.attributes.removeAt(attrIndex);
                              });
                            },
                          ),
                        ],
                      ],
                    ),
                  );
                }),

                const SizedBox(height: 4),
                OutlinedButton.icon(
                  onPressed: () {
                    setState(() {
                      variant.attributes.add(_AttributePair());
                    });
                  },
                  icon: const Icon(Icons.add, size: 16),
                  label: const Text('Thêm thuộc tính'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: theme.colorScheme.onSurface,
                    side: BorderSide(color: _borderColor),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Fields: Giá bán, Tồn kho, Khối lượng
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _fieldLabel('Giá bán (đ) *'),
                          TextField(
                            controller: variant.priceController,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            style: TextStyle(
                              color: theme.colorScheme.onSurface,
                              fontSize: 14,
                            ),
                            decoration: _inputDecoration(hint: '2.990.000'),
                            onChanged: (_) => setState(() {}),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _fieldLabel('Tồn kho *'),
                          TextField(
                            controller: variant.quantityController,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            style: TextStyle(
                              color: theme.colorScheme.onSurface,
                              fontSize: 14,
                            ),
                            decoration: _inputDecoration(hint: '1'),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _fieldLabel('Khối lượng (g)'),
                          TextField(
                            controller: variant.weightController,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            style: TextStyle(
                              color: theme.colorScheme.onSurface,
                              fontSize: 14,
                            ),
                            decoration: _inputDecoration(hint: '500'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
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
          avatar: const Icon(Icons.local_offer_outlined, size: 16),
          label: Text(_tags.isEmpty ? 'Chọn thẻ' : 'Sửa thẻ'),
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

    if (name.isEmpty) {
      _snack('Nhập tên sản phẩm.', error: true);
      return;
    }
    if (_categoryId == null) {
      _snack('Chọn danh mục cho sản phẩm.', error: true);
      return;
    }
    if (_condition == null) {
      _snack('Chọn tình trạng sản phẩm.', error: true);
      return;
    }
    if (_variants.isEmpty) {
      _snack('Cần có ít nhất 1 phiên bản sản phẩm.', error: true);
      return;
    }

    final variantRequests = <CreateVariantRequest>[];
    final seenAttributeSets = <String>{};

    for (int i = 0; i < _variants.length; i++) {
      final v = _variants[i];
      final rawPrice = v.priceController.text.trim();
      final rawQuantity = v.quantityController.text.trim();
      final rawWeight = v.weightController.text.trim();

      final price = int.tryParse(rawPrice) ?? 0;
      final quantity = rawQuantity.isEmpty
          ? 1
          : (int.tryParse(rawQuantity) ?? 0);
      final weight = rawWeight.isEmpty ? 500 : (int.tryParse(rawWeight) ?? 0);

      if (rawPrice.isEmpty || price <= 0) {
        _snack('Nhập giá bán hợp lệ cho Phiên bản ${i + 1}.', error: true);
        return;
      }
      if (quantity <= 0) {
        _snack(
          'Tồn kho phải ít nhất là 1 cho Phiên bản ${i + 1}.',
          error: true,
        );
        return;
      }
      if (weight <= 0) {
        _snack(
          'Khối lượng phải lớn hơn 0g cho Phiên bản ${i + 1}.',
          error: true,
        );
        return;
      }

      final attrs = <String, Object>{};
      for (final a in v.attributes) {
        final k = a.keyController.text.trim();
        final val = a.valueController.text.trim();
        if (k.isNotEmpty && val.isNotEmpty) {
          attrs[k] = val;
        } else if (k.isNotEmpty || val.isNotEmpty) {
          _snack(
            'Vui lòng điền đủ Tên và Giá trị thuộc tính cho Phiên bản ${i + 1}.',
            error: true,
          );
          return;
        }
      }

      if (attrs.isEmpty) {
        attrs['Phiên bản'] = _variants.length == 1
            ? 'Mặc định'
            : 'Phiên bản ${i + 1}';
      }

      final attrKey = attrs.entries.map((e) => '${e.key}:${e.value}').toList()
        ..sort();
      final attrSig = attrKey.join('|');
      if (seenAttributeSets.contains(attrSig)) {
        _snack(
          'Phiên bản ${i + 1} có bộ thuộc tính phân biệt trùng với phiên bản khác. Vui lòng thay đổi giá trị thuộc tính.',
          error: true,
        );
        return;
      }
      seenAttributeSets.add(attrSig);

      variantRequests.add(
        CreateVariantRequest(
          price: price,
          quantity: quantity,
          attributes: attrs,
          packageDetails: <String, Object>{'weight_g': weight},
        ),
      );
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
      variants: variantRequests,
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
                    'Hãng vận chuyển sẽ tới địa chỉ này để nhận kiện hàng khi có đơn mới.',
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

  /// Bộ chọn thẻ, không còn là một ô trống.
  ///
  /// Gõ tay vẫn còn — route chỉ soi hình dạng slug — nhưng nó không còn là *cách
  /// duy nhất*: người bán không thể biết sàn đang dùng `do-choi-go` hay
  /// `do-choi-bang-go`, và một thẻ chỉ mình mình dùng là một thẻ không ai bấm.
  /// Sheet hỏi `?q=` cho cái đang gõ và `?near=` cho những gì đã chọn (hoặc cho
  /// danh mục, khi chưa chọn gì) — xem [TagPickerSheet].
  Future<void> _addTag() async {
    final picked = await TagPickerSheet.show(
      context,
      selected: _tags,
      categoryId: _categoryId,
    );
    if (!mounted || picked == null) return;
    setState(() => _tags = listingTags(picked));
  }

  Future<void> _addSpec() async {
    final pair = await showDialog<MapEntry<String, String>>(
      context: context,
      builder: (dialogContext) => _AddSpecDialog(
        cardColor: _cardColor,
        inputDecoration: _inputDecoration,
      ),
    );
    if (!mounted || pair == null) return;
    setState(() {
      _specs.removeWhere((spec) => spec.key == pair.key);
      _specs.add(pair);
    });
  }

  void _applySuggestion(ListingSuggestion suggestion) {
    _nameController.text = suggestion.name;
    _descriptionController.text = suggestion.description;
    if (_variants.isNotEmpty) {
      if (suggestion.price != null && suggestion.price! > 0) {
        _variants.first.priceController.text = suggestion.price.toString();
      }
      if (suggestion.weightG != null && suggestion.weightG! > 0) {
        _variants.first.weightController.text = suggestion.weightG.toString();
      }
    }
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
    for (final v in _variants) {
      v.dispose();
    }
    _variants = [_VariantFormItem()];
    setState(() {
      _categoryId = null;
      _condition = null;
      _priceMode = PriceMode.fixed;
      _tags = [];
      _specs = [];
    });
  }

  /// Thẻ sản phẩm, đúng như người mua sẽ thấy nó.
  ///
  /// Người bán đang điền một cái form dài, mà thứ quyết định có ai bấm vào tin
  /// hay không lại là một cái thẻ nhỏ trong lưới: ảnh bìa, tên bị cắt ở hai dòng,
  /// và một con giá. Không thấy nó lúc điền thì chỉ biết sau khi đăng — nên chỗ
  /// này vẽ luôn, từ cùng dữ liệu form đang giữ.
  ///
  /// Giá lấy trên phiên bản *đầu*, vì đó là con số lưới hiển thị.
  Widget _previewSection(ListingSuggestionState state) {
    final theme = Theme.of(context);

    final cover = state.photos.isEmpty ? null : state.photos.first;
    final coverUrl = cover?.previewUrl;
    final name = _nameController.text.trim();
    final selectedCategory = state.categories
        .where((c) => c.id == _categoryId)
        .firstOrNull;
    final categoryLabel = selectedCategory == null
        ? 'Chưa chọn danh mục'
        : _categoryLabel(selectedCategory, state.categories);
    final price =
        int.tryParse(_variants.first.priceController.text.trim()) ?? 0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _fieldLabel('Xem trước'),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: _cardColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: _borderColor),
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 4 / 3,
                child: coverUrl == null
                    ? ColoredBox(
                        color: theme.colorScheme.surfaceContainerHighest,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.image_outlined,
                                size: 36,
                                color: theme.colorScheme.onSurfaceVariant,
                              ),
                              const SizedBox(height: 6),
                              Text(
                                'Ảnh bìa sẽ hiện ở đây',
                                style: theme.textTheme.labelSmall?.copyWith(
                                  color: theme.colorScheme.onSurfaceVariant,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : UploadPreview(bytes: cover?.bytes, url: coverUrl),
              ),
              Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      categoryLabel,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: theme.colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      name.isEmpty ? 'Tên sản phẩm của bạn' : name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: name.isEmpty
                            ? theme.colorScheme.onSurfaceVariant
                            : theme.colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      price > 0
                          ? MoneyUtils.format(price, currency: _currency)
                          : 'Chưa có giá',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: price > 0
                            ? theme.colorScheme.primary
                            : theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: [
                        if (_condition != null) _previewChip(_condition!.label),
                        _previewChip(
                          _priceMode == PriceMode.fixed
                              ? 'Giá cố định'
                              : 'Cho phép thương lượng',
                        ),
                        _previewChip('${_variants.length} phiên bản'),
                      ],
                    ),
                    if (_tags.isNotEmpty) ...[
                      const SizedBox(height: 10),
                      Text(
                        _tags.take(5).map((tag) => '#$tag').join('  '),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: theme.colorScheme.primary,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _previewChip(String label) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: theme.textTheme.labelSmall?.copyWith(
          color: theme.colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }

  Widget _buildCategorySelector(
    BuildContext context,
    ListingSuggestionState state,
  ) {
    final theme = Theme.of(context);
    final selectedCategory = state.categories
        .where((c) => c.id == _categoryId)
        .firstOrNull;
    final label = selectedCategory != null
        ? _categoryLabel(selectedCategory, state.categories)
        : null;

    return InkWell(
      onTap: state.categories.isEmpty
          ? null
          : () => _openCategorySearchSheet(context, state.categories),
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        decoration: BoxDecoration(
          color: _cardColor,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: _borderColor),
        ),
        child: Row(
          children: [
            Icon(
              Icons.category_outlined,
              size: 20,
              color: label != null
                  ? theme.colorScheme.primary
                  : theme.colorScheme.onSurfaceVariant,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                label ??
                    (state.categories.isEmpty
                        ? 'Chưa tải được danh mục'
                        : 'Chọn danh mục sản phẩm...'),
                style: TextStyle(
                  fontSize: 14,
                  color: label != null
                      ? theme.colorScheme.onSurface
                      : theme.colorScheme.onSurfaceVariant,
                  fontWeight: label != null
                      ? FontWeight.w500
                      : FontWeight.normal,
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
    );
  }

  void _openCategorySearchSheet(
    BuildContext context,
    List<Category> categories,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: _cardColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (sheetContext) {
        return _CategorySearchBottomSheet(
          categories: categories,
          selectedCategoryId: _categoryId,
          categoryLabel: (cat) => _categoryLabel(cat, categories),
          onSelect: (selectedId) {
            setState(() => _categoryId = selectedId);
            Navigator.pop(sheetContext);
          },
        );
      },
    );
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

class _AddSpecDialog extends StatefulWidget {
  final Color cardColor;
  final InputDecoration Function({required String hint}) inputDecoration;

  const _AddSpecDialog({
    required this.cardColor,
    required this.inputDecoration,
  });

  @override
  State<_AddSpecDialog> createState() => _AddSpecDialogState();
}

class _AddSpecDialogState extends State<_AddSpecDialog> {
  late final TextEditingController _keyController;
  late final TextEditingController _valueController;

  @override
  void initState() {
    super.initState();
    _keyController = TextEditingController();
    _valueController = TextEditingController();
  }

  @override
  void dispose() {
    _keyController.dispose();
    _valueController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AlertDialog(
      backgroundColor: widget.cardColor,
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
            controller: _keyController,
            autofocus: true,
            style: TextStyle(color: theme.colorScheme.onSurface),
            decoration: widget.inputDecoration(
              hint: 'Tên thông số, ví dụ: Dung lượng',
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: _valueController,
            style: TextStyle(color: theme.colorScheme.onSurface),
            decoration: widget.inputDecoration(hint: 'Giá trị, ví dụ: 64GB'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            'Hủy',
            style: TextStyle(color: theme.colorScheme.onSurfaceVariant),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            final key = _keyController.text.trim();
            final value = _valueController.text.trim();
            if (key.isNotEmpty && value.isNotEmpty) {
              Navigator.pop(context, MapEntry(key, value));
            } else {
              Navigator.pop(context);
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: theme.colorScheme.primary,
            foregroundColor: theme.colorScheme.onPrimary,
          ),
          child: const Text('Thêm'),
        ),
      ],
    );
  }
}

class _VariantFormItem {
  final TextEditingController priceController;
  final TextEditingController quantityController;
  final TextEditingController weightController;
  final List<_AttributePair> attributes;

  _VariantFormItem({
    String price = '',
    String quantity = '',
    String weight = '',
    List<_AttributePair>? attributes,
  }) : priceController = TextEditingController(text: price),
       quantityController = TextEditingController(text: quantity),
       weightController = TextEditingController(text: weight),
       attributes = attributes ?? [_AttributePair()];

  void dispose() {
    priceController.dispose();
    quantityController.dispose();
    weightController.dispose();
    for (final attr in attributes) {
      attr.dispose();
    }
  }
}

class _AttributePair {
  final TextEditingController keyController;
  final TextEditingController valueController;

  _AttributePair({String key = '', String value = ''})
    : keyController = TextEditingController(text: key),
      valueController = TextEditingController(text: value);

  void dispose() {
    keyController.dispose();
    valueController.dispose();
  }
}

class _CategorySearchBottomSheet extends StatefulWidget {
  final List<Category> categories;
  final String? selectedCategoryId;
  final String Function(Category) categoryLabel;
  final ValueChanged<String> onSelect;

  const _CategorySearchBottomSheet({
    required this.categories,
    required this.selectedCategoryId,
    required this.categoryLabel,
    required this.onSelect,
  });

  @override
  State<_CategorySearchBottomSheet> createState() =>
      _CategorySearchBottomSheetState();
}

class _CategorySearchBottomSheetState
    extends State<_CategorySearchBottomSheet> {
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
      final labelMatch = widget
          .categoryLabel(cat)
          .toLowerCase()
          .contains(query);
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
                  hintText: 'Tìm kiếm danh mục (ví dụ: Điện thoại, Áo...)',
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.search_off_outlined,
                            size: 48,
                            color: theme.colorScheme.onSurfaceVariant.withAlpha(
                              100,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Không tìm thấy danh mục "$_query"',
                            style: TextStyle(
                              color: theme.colorScheme.onSurfaceVariant,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.separated(
                      controller: scrollController,
                      itemCount: filtered.length,
                      separatorBuilder: (_, __) =>
                          const Divider(height: 1, indent: 16, endIndent: 16),
                      itemBuilder: (context, index) {
                        final cat = filtered[index];
                        final isSelected = cat.id == widget.selectedCategoryId;
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
