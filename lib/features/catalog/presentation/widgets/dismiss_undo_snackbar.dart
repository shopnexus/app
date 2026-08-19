import 'package:flutter/material.dart';

/// How long a dismissed card stays reversible. The interaction itself is not sent to the
/// server until this closes with nobody having undone it — see
/// [showDismissUndoSnackBar]'s `onExpire`.
const dismissUndoWindow = Duration(seconds: 4);

/// The undo window, felt rather than read off a number — the one custom snackbar content
/// this app draws, and the same signature the website's undo toast uses: a thin bar draining
/// left to right over the window. `onExpire` fires once, only when the window closes without
/// [onUndo] having run — a swipe-to-dismiss counts as neither and does not confirm the
/// dismissal, since a swipe is not a considered "no, I meant it".
void showDismissUndoSnackBar(
  BuildContext context, {
  required String message,
  required VoidCallback onUndo,
  required VoidCallback onExpire,
}) {
  final controller = ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: dismissUndoWindow,
      behavior: SnackBarBehavior.floating,
      padding: EdgeInsets.zero,
      content: _DrainingContent(message: message),
      action: SnackBarAction(label: 'HOÀN TÁC', onPressed: onUndo),
    ),
  );
  controller.closed.then((reason) {
    if (reason == SnackBarClosedReason.timeout) onExpire();
  });
}

class _DrainingContent extends StatelessWidget {
  const _DrainingContent({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 10, 4, 10),
          child: Text(
            message,
            style: const TextStyle(fontFamily: 'Inter', fontSize: 13),
          ),
        ),
        TweenAnimationBuilder<double>(
          tween: Tween(begin: 1.0, end: 0.0),
          duration: dismissUndoWindow,
          curve: Curves.linear,
          builder: (context, value, _) => LinearProgressIndicator(
            value: value,
            minHeight: 3,
            backgroundColor: Colors.white.withAlpha(30),
            valueColor: AlwaysStoppedAnimation(
              Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
        ),
      ],
    );
  }
}
