import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/money_utils.dart';
import '../providers/ai_wizard_provider.dart';

class AiVideoWizardScreen extends ConsumerStatefulWidget {
  const AiVideoWizardScreen({super.key});

  @override
  ConsumerState<AiVideoWizardScreen> createState() =>
      _AiVideoWizardScreenState();
}

class _AiVideoWizardScreenState extends ConsumerState<AiVideoWizardScreen> {
  final TextEditingController _voiceInputController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  @override
  void dispose() {
    _voiceInputController.dispose();
    _titleController.dispose();
    _descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final state = ref.watch(aiWizardProvider);
    final notifier = ref.read(aiWizardProvider.notifier);

    // Sync controllers when entering step 3
    if (state.step == 3 && _titleController.text != state.suggestedTitle) {
      _titleController.text = state.suggestedTitle;
    }
    if (state.step == 3 && _descController.text != state.refinedDescription) {
      _descController.text = state.refinedDescription ?? '';
    }

    return Scaffold(
      backgroundColor: isDark
          ? const Color(0xFF0F172A)
          : const Color(0xFFF9F9F7),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (state.step > 1) {
              notifier.setStep(state.step - 1);
            } else {
              context.pop();
            }
          },
        ),
        title: Text(
          'AI Product Wizard',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            tooltip: 'Tái tạo lại',
            onPressed: () {
              notifier.reset();
              _voiceInputController.clear();
              _titleController.clear();
              _descController.clear();
            },
          ),
          const SizedBox(width: 4),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // --- Progress Indicator Roadmap ---
            _buildProgressIndicator(context, state.step),
            const SizedBox(height: 12),

            // --- Error Alert Banner if any ---
            if (state.errorMessage != null)
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFFEF2F2),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFFCA5A5)),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.error_outline, color: Color(0xFFEF4444)),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        state.errorMessage!,
                        style: const TextStyle(
                          color: Color(0xFF991B1B),
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            // --- Main Content Canvas ---
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: _buildCurrentStepView(context, state, notifier),
              ),
            ),

            // --- Bottom Navigation Action Bar ---
            _buildBottomActionBar(context, state, notifier),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressIndicator(BuildContext context, int step) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    double percent = step == 1 ? 0.33 : (step == 2 ? 0.66 : 1.0);
    String stepLabel = step == 1
        ? 'Step 1 of 3: Select Media'
        : (step == 2
              ? 'Step 2 of 3: AI Processing'
              : 'Step 3 of 3: Review SPU');

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                stepLabel,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: AppColors.primary,
                ),
              ),
              Text(
                '${(percent * 100).toInt()}%',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: isDark
                      ? const Color(0xFF94A3B8)
                      : const Color(0xFF64748B),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: percent,
              minHeight: 6,
              backgroundColor: isDark
                  ? const Color(0xFF1E293B)
                  : const Color(0xFFE2E8F0),
              valueColor: const AlwaysStoppedAnimation<Color>(
                AppColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCurrentStepView(
    BuildContext context,
    AiWizardState state,
    AiWizardNotifier notifier,
  ) {
    switch (state.step) {
      case 1:
        return _buildStep1MediaSelection(context, state, notifier);
      case 2:
        return _buildStep2ProcessingView(context, state);
      case 3:
        return _buildStep3ReviewAndEdit(context, state, notifier);
      default:
        return _buildStep1MediaSelection(context, state, notifier);
    }
  }

  // --- STEP 1: MEDIA SELECTION VIEW ---
  Widget _buildStep1MediaSelection(
    BuildContext context,
    AiWizardState state,
    AiWizardNotifier notifier,
  ) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Mode Selector Tabs (Image + Audio vs Image + Raw Text)
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF1E293B) : const Color(0xFFECEEED),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => notifier.setInputMode('image_audio'),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: state.inputMode == 'image_audio'
                            ? AppColors.primary
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.mic_none_outlined,
                            size: 18,
                            color: state.inputMode == 'image_audio'
                                ? Colors.white
                                : (isDark
                                      ? const Color(0xFF94A3B8)
                                      : const Color(0xFF64748B)),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            'Image + Audio 🎙️',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: state.inputMode == 'image_audio'
                                  ? Colors.white
                                  : (isDark
                                        ? const Color(0xFF94A3B8)
                                        : const Color(0xFF64748B)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => notifier.setInputMode('image_text'),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: state.inputMode == 'image_text'
                            ? AppColors.primary
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.edit_note_outlined,
                            size: 18,
                            color: state.inputMode == 'image_text'
                                ? Colors.white
                                : (isDark
                                      ? const Color(0xFF94A3B8)
                                      : const Color(0xFF64748B)),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            'Image + Raw Text 📝',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: state.inputMode == 'image_text'
                                  ? Colors.white
                                  : (isDark
                                        ? const Color(0xFF94A3B8)
                                        : const Color(0xFF64748B)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Image Picker Grid
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Hình ảnh sản phẩm (${state.selectedImagePaths.length})',
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton.icon(
                onPressed: notifier.pickImages,
                icon: const Icon(Icons.add_photo_alternate_outlined, size: 18),
                label: const Text('Thêm ảnh'),
              ),
            ],
          ),
          const SizedBox(height: 8),
          if (state.selectedImagePaths.isEmpty)
            GestureDetector(
              onTap: notifier.pickImages,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF1E293B) : Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: isDark
                        ? Colors.white.withValues(alpha: 0.1)
                        : const Color(0xFFE2E8F0),
                  ),
                ),
                child: Column(
                  children: const [
                    Icon(
                      Icons.photo_library_outlined,
                      size: 32,
                      color: Color(0xFF94A3B8),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Chưa chọn ảnh nào. Bấm để tải ảnh sản phẩm',
                      style: TextStyle(fontSize: 13, color: Color(0xFF94A3B8)),
                    ),
                  ],
                ),
              ),
            )
          else
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.selectedImagePaths.length + 1,
                itemBuilder: (context, index) {
                  if (index == state.selectedImagePaths.length) {
                    return GestureDetector(
                      onTap: notifier.pickImages,
                      child: Container(
                        width: 90,
                        margin: const EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          color: isDark
                              ? const Color(0xFF1E293B)
                              : const Color(0xFFF1F5F9),
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: const Color(0xFFCBD5E1)),
                        ),
                        child: const Icon(Icons.add, color: Color(0xFF64748B)),
                      ),
                    );
                  }
                  final path = state.selectedImagePaths[index];
                  return Stack(
                    children: [
                      Container(
                        width: 90,
                        margin: const EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: isDark
                              ? const Color(0xFF1E293B)
                              : const Color(0xFFF1F5F9),
                          image: DecorationImage(
                            image: NetworkImage(path),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 4,
                        right: 12,
                        child: GestureDetector(
                          onTap: () => notifier.removeImage(index),
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            decoration: const BoxDecoration(
                              color: Colors.black54,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.close,
                              size: 14,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),

          const SizedBox(height: 20),

          // Audio / Raw Text Input Section based on mode
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                state.inputMode == 'image_audio'
                    ? 'Nội dung Audio / Giọng nói thô 🎙️'
                    : 'Văn bản thô / Ghi chú sản phẩm 📝',
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton.icon(
                onPressed: () {
                  if (state.inputMode == 'image_audio') {
                    _voiceInputController.text =
                        'Ly sứ cao cấp màu trắng kem 350ml, chất liệu gốm nung cao cấp giữ nhiệt tốt, dùng cho cà phê trà bánh.';
                  } else {
                    _voiceInputController.text =
                        'Khay đựng mút trang điểm bằng silicone nguyên khối, chống bẩn, lỗ thoáng khí sấy khô chống mốc.';
                  }
                },
                icon: Icon(
                  state.inputMode == 'image_audio'
                      ? Icons.record_voice_over_outlined
                      : Icons.edit_note_outlined,
                  size: 16,
                ),
                label: const Text('Điền mẫu'),
              ),
            ],
          ),
          const SizedBox(height: 6),
          TextField(
            controller: _voiceInputController,
            maxLines: 4,
            decoration: InputDecoration(
              hintText: state.inputMode == 'image_audio'
                  ? 'Bấm biểu tượng micro hoặc dán nội dung từ ghi âm sản phẩm (Ví dụ: "Sản phẩm này làm từ gốm sứ thủ công nung 1300 độ C...")'
                  : 'Nhập các ý tưởng, thông số thô hoặc ghi chú nháp sản phẩm (Ví dụ: "Ví da bò sáp, 6 ngăn thẻ, khâu tay patina...")',
              filled: true,
              fillColor: isDark ? const Color(0xFF1E293B) : Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: isDark
                      ? Colors.white.withValues(alpha: 0.1)
                      : const Color(0xFFE2E8F0),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // AI Tone Selection Chips
          Text(
            'Chọn phong cách tinh chỉnh AI (Tone)',
            style: theme.textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w600,
              color: isDark ? const Color(0xFF94A3B8) : const Color(0xFF64748B),
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: [
              _buildToneChip(
                context,
                'professional',
                'Chuyên nghiệp 💼',
                state,
                notifier,
              ),
              _buildToneChip(
                context,
                'persuasive',
                'Thuyết phục 🔥',
                state,
                notifier,
              ),
              _buildToneChip(
                context,
                'minimalist',
                'Tối giản ✨',
                state,
                notifier,
              ),
              _buildToneChip(
                context,
                'enthusiastic',
                'Sôi nổi 🎉',
                state,
                notifier,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildToneChip(
    BuildContext context,
    String toneKey,
    String label,
    AiWizardState state,
    AiWizardNotifier notifier,
  ) {
    final isSelected = state.selectedTone == toneKey;
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      selectedColor: AppColors.primary,
      labelStyle: TextStyle(
        color: isSelected ? Colors.white : null,
        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        fontSize: 12,
      ),
      onSelected: (_) => notifier.setTone(toneKey),
    );
  }

  // --- STEP 2: PROCESSING & UPLOAD VIEW ---
  Widget _buildStep2ProcessingView(BuildContext context, AiWizardState state) {
    final theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.auto_awesome,
                size: 56,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'AI đang phân tích Hình ảnh & Tinh chỉnh Audio...',
              textAlign: TextAlign.center,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Tiến độ xử lý: ${(state.uploadProgress * 100).toInt()}%',
              style: const TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 240,
              child: LinearProgressIndicator(
                value: state.uploadProgress,
                minHeight: 8,
                borderRadius: BorderRadius.circular(10),
                backgroundColor: const Color(0xFFE2E8F0),
                valueColor: const AlwaysStoppedAnimation<Color>(
                  AppColors.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- STEP 3: REVIEW & EDIT SPU VIEW ---
  Widget _buildStep3ReviewAndEdit(
    BuildContext context,
    AiWizardState state,
    AiWizardNotifier notifier,
  ) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Confidence Badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFFECFDF5),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFA7F3D0)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.verified, size: 18, color: Color(0xFF10B981)),
                const SizedBox(width: 8),
                Text(
                  'Độ tin cậy AI: ${(state.confidence * 100).toInt()}%',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF065F46),
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Title Input
          Text(
            'Tiêu đề sản phẩm SPU',
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          TextField(
            controller: _titleController,
            onChanged: notifier.updateTitle,
            decoration: InputDecoration(
              filled: true,
              fillColor: isDark ? const Color(0xFF1E293B) : Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Raw vs Refined Description Toggle Box
          if (state.rawAudioText != null && state.rawAudioText!.isNotEmpty) ...[
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isDark
                    ? const Color(0xFF0F172A)
                    : const Color(0xFFF1F5F9),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '🎤 Audio Raw Text (Gốc):',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Color(0xFF64748B),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    state.rawAudioText!,
                    style: const TextStyle(
                      fontSize: 13,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
          ],

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Mô tả tinh chỉnh (AI Refined Description)',
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.auto_awesome, color: AppColors.primary),
                tooltip: 'Tái tinh chỉnh theo Tone',
                onPressed: () {
                  if (state.rawAudioText != null) {
                    notifier.refineRawText(state.rawAudioText!);
                  }
                },
              ),
            ],
          ),
          const SizedBox(height: 6),
          TextField(
            controller: _descController,
            maxLines: 5,
            onChanged: notifier.updateDescription,
            decoration: InputDecoration(
              filled: true,
              fillColor: isDark ? const Color(0xFF1E293B) : Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Category Badge
          Row(
            children: [
              const Text(
                'Danh mục gợi ý: ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Chip(
                label: Text(state.suggestedCategoryName),
                backgroundColor: AppColors.primary.withValues(alpha: 0.1),
                labelStyle: const TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Specifications Table
          if (state.specifications.isNotEmpty) ...[
            Text(
              'Thông số kỹ thuật đề xuất (${state.specifications.length})',
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF1E293B) : Colors.white,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: isDark
                      ? Colors.white.withValues(alpha: 0.1)
                      : const Color(0xFFE2E8F0),
                ),
              ),
              child: Column(
                children: state.specifications.map((spec) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          spec.key,
                          style: const TextStyle(
                            color: Color(0xFF64748B),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          spec.value,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 16),
          ],

          // Suggested SKUs
          if (state.suggestedSkus.isNotEmpty) ...[
            Text(
              'Các biến thể SKU gợi ý (${state.suggestedSkus.length})',
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Column(
              children: state.suggestedSkus.map((sku) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: isDark ? const Color(0xFF1E293B) : Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: isDark
                          ? Colors.white.withValues(alpha: 0.1)
                          : const Color(0xFFE2E8F0),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            sku.name ?? 'Biến thể SKU',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'Tồn kho: ${sku.stock} | Trọng lượng: ${sku.effectiveWeight}g',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color(0xFF64748B),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        MoneyUtils.format(sku.price),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ],
      ),
    );
  }

  // --- BOTTOM ACTION BAR ---
  Widget _buildBottomActionBar(
    BuildContext context,
    AiWizardState state,
    AiWizardNotifier notifier,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E293B) : Colors.white,
        border: Border(
          top: BorderSide(
            color: isDark
                ? Colors.white.withValues(alpha: 0.1)
                : const Color(0xFFE2E8F0),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () {
              if (state.step > 1) {
                notifier.setStep(state.step - 1);
              } else {
                context.pop();
              }
            },
            child: const Text('Hủy'),
          ),
          if (state.step == 1)
            ElevatedButton.icon(
              onPressed: () {
                if (state.inputMode == 'video') {
                  notifier.processVideo();
                } else {
                  notifier.processVoiceAndRefine(_voiceInputController.text);
                }
              },
              icon: const Icon(Icons.arrow_forward, size: 18),
              label: const Text('Tiếp theo'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            )
          else if (state.step == 3)
            ElevatedButton.icon(
              onPressed: state.isSaving
                  ? null
                  : () async {
                      await notifier.saveSpuProduct();
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Đã lưu thành công sản phẩm SPU từ AI Wizard!',
                            ),
                            backgroundColor: Color(0xFF10B981),
                          ),
                        );
                        context.pop();
                      }
                    },
              icon: state.isSaving
                  ? const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : const Icon(Icons.check, size: 18),
              label: Text(state.isSaving ? 'Đang lưu...' : 'Lưu sản phẩm SPU'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
