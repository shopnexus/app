import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Khung dùng chung cho mấy trang chữ: điều khoản, bảo mật, giới thiệu.
///
/// Đây là những trang được đọc một lần, trong lúc căng: một người đang quyết có
/// giao tiền cho sàn hay không, hoặc đang tìm cái điều lệ vừa làm họ mất một
/// khoản. Nên khổ chữ hẹp, đầu mục rõ, và không có gì động.
class ContentPage extends StatelessWidget {
  const ContentPage({
    super.key,
    required this.title,
    required this.sections,
    this.intro,
    this.updated,
    this.draft = false,
  });

  final String title;
  final String? intro;

  /// Ngày sửa nội dung lần cuối, dạng ISO.
  final String? updated;

  /// Văn bản mô tả đúng cách hệ thống đang chạy nhưng chưa qua rà soát pháp lý.
  final bool draft;

  final List<Widget> sections;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
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
          onPressed: () =>
              context.canPop() ? context.pop() : context.go('/home'),
        ),
        title: Text(
          title,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            fontFamily: 'Manrope',
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 40),
        children: [
          Text(
            title,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontFamily: 'Manrope',
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onSurface,
            ),
          ),
          if (intro != null) ...[
            const SizedBox(height: 8),
            Text(
              intro!,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
                height: 1.5,
              ),
            ),
          ],
          if (updated != null) ...[
            const SizedBox(height: 6),
            Text(
              'Cập nhật lần cuối: ${_formatDate(updated!)}',
              style: theme.textTheme.labelSmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
          if (draft) ...[
            const SizedBox(height: 16),
            // Nói thẳng, không để ở chân trang. Người đọc có quyền biết thứ họ
            // đang được yêu cầu đồng ý chưa qua tay luật sư.
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: theme.colorScheme.tertiaryContainer.withValues(
                  alpha: 0.4,
                ),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: theme.colorScheme.outlineVariant.withValues(
                    alpha: 0.6,
                  ),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.info_outline_rounded,
                    size: 20,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Bản nháp. Trang này mô tả đúng cách hệ thống ShopNexus '
                      'đang vận hành, nhưng chưa qua rà soát pháp lý và chưa phải '
                      'văn bản có hiệu lực ràng buộc.',
                      style: theme.textTheme.bodySmall?.copyWith(height: 1.45),
                    ),
                  ),
                ],
              ),
            ),
          ],
          const SizedBox(height: 24),
          for (final section in sections) ...[
            section,
            const SizedBox(height: 24),
          ],
        ],
      ),
    );
  }

  static String _formatDate(String iso) {
    final parsed = DateTime.tryParse(iso);
    if (parsed == null) return iso;
    final day = parsed.day.toString().padLeft(2, '0');
    final month = parsed.month.toString().padLeft(2, '0');
    return '$day/$month/${parsed.year}';
  }
}

/// Một mục. Tiêu đề đánh số như bản web, để một điều lệ còn chỉ được ra bằng số.
class ContentSection extends StatelessWidget {
  const ContentSection({super.key, required this.title, required this.blocks});

  final String title;
  final List<Widget> blocks;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.textTheme.titleMedium?.copyWith(
            fontFamily: 'Manrope',
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 10),
        for (final block in blocks) ...[block, const SizedBox(height: 10)],
      ],
    );
  }
}

/// Một đoạn.
class ContentParagraph extends StatelessWidget {
  const ContentParagraph(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      text,
      style: theme.textTheme.bodyMedium?.copyWith(
        color: theme.colorScheme.onSurface,
        height: 1.55,
      ),
    );
  }
}

/// Danh sách gạch đầu dòng.
class ContentBullets extends StatelessWidget {
  const ContentBullets(this.items, {super.key});

  final List<String> items;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final item in items)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 7, right: 10),
                  child: Container(
                    width: 5,
                    height: 5,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    item,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurface,
                      height: 1.55,
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

/// Một dòng dẫn sang chỗ khác trong app — thường là Trung tâm hỗ trợ, vì mọi
/// khiếu nại đều đi qua đó.
class ContentLink extends StatelessWidget {
  const ContentLink({
    super.key,
    required this.label,
    required this.route,
    this.icon = Icons.arrow_forward_rounded,
  });

  final String label;
  final String route;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Align(
      alignment: Alignment.centerLeft,
      child: TextButton.icon(
        onPressed: () => context.push(route),
        icon: Icon(icon, size: 18),
        label: Text(label),
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          foregroundColor: theme.colorScheme.primary,
        ),
      ),
    );
  }
}
