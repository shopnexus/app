import 'package:flutter/material.dart';
import 'package:shopnexus_flutter_app/core/theme/app_colors.dart';

/// The two things a shopper can tell the recommended feed about a card it drew, in the
/// vocabulary `POST /listings/interactions` reads. Both leave the card the same way — this
/// sheet does not promise a difference the platform does not keep yet — so what tells them
/// apart is scope: one dampens a taste, the other names one listing.
enum ListingDismissChoice { notInterested, hidden }

extension ListingDismissChoiceType on ListingDismissChoice {
  /// The interaction `type` this choice sends.
  String get wireType => switch (this) {
    ListingDismissChoice.notInterested => 'not-interested',
    ListingDismissChoice.hidden => 'hidden',
  };
}

/// Same pattern as `showSortOptionsSheet`: a plain bottom sheet, no state of its own — it
/// answers with the choice and closes, and the caller owns what happens next (the card's own
/// collapse, the undo window).
void showListingDismissSheet(
  BuildContext context, {
  required ValueChanged<ListingDismissChoice> onSelected,
}) {
  final theme = Theme.of(context);
  final isDarkMode = theme.brightness == Brightness.dark;

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: isDarkMode ? AppColors.darkSurface : Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24.0)),
    ),
    builder: (sheetContext) {
      final sheetTheme = Theme.of(sheetContext);
      return SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 8),
            Container(
              width: 36,
              height: 4,
              decoration: BoxDecoration(
                color: sheetTheme.colorScheme.outlineVariant,
                borderRadius: BorderRadius.circular(999),
              ),
            ),
            _DismissTile(
              icon: Icons.thumb_down_outlined,
              title: 'Không quan tâm',
              subtitle: 'Ít gợi ý sản phẩm như thế này hơn',
              onTap: () {
                Navigator.pop(sheetContext);
                onSelected(ListingDismissChoice.notInterested);
              },
            ),
            _DismissTile(
              icon: Icons.visibility_off_outlined,
              title: 'Ẩn tin này',
              subtitle: 'Không hiện tin này trong Gợi ý cho bạn nữa',
              onTap: () {
                Navigator.pop(sheetContext);
                onSelected(ListingDismissChoice.hidden);
              },
            ),
            const SizedBox(height: 8),
          ],
        ),
      );
    },
  );
}

class _DismissTile extends StatelessWidget {
  const _DismissTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      leading: Icon(icon, color: theme.colorScheme.onSurfaceVariant),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
          color: theme.colorScheme.onSurface,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          fontFamily: 'Inter',
          fontSize: 12,
          color: theme.colorScheme.onSurfaceVariant,
        ),
      ),
      onTap: onTap,
    );
  }
}
