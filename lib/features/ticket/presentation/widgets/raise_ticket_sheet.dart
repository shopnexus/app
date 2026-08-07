
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopnexus_flutter_app/api/generated/model/ticket.dart';
import 'package:shopnexus_flutter_app/api/generated/model/ticket_kind.dart';
import 'package:shopnexus_flutter_app/api/generated/model/ticket_reason.dart';
import 'package:shopnexus_flutter_app/features/ticket/data/models/ticket_kind_info.dart';
import 'package:shopnexus_flutter_app/features/ticket/data/repositories/ticket_repository.dart';
import 'package:shopnexus_flutter_app/features/ticket/presentation/providers/ticket_provider.dart';
import 'package:shopnexus_flutter_app/core/widgets/attachment_picker.dart';
import 'package:shopnexus_flutter_app/core/utils/error_handler.dart';

/// The one form that raises a ticket, whatever the kind. A report of a listing, a
/// refund the buyer wants staff to decide and a feature request are the same
/// write with a different `kind`, so there is one sheet rather than five dialogs.
///
/// `body` and the attachments are not columns on the ticket: they open the chat
/// thread it carries, and everything said afterwards is ordinary chat.
class RaiseTicketSheet extends ConsumerStatefulWidget {
  const RaiseTicketSheet({
    super.key,
    this.kind,
    this.refId,
    this.subjectHint,
    this.refLabel,
  });

  /// Fixed when the caller already knows what is being raised — a report action
  /// on a listing, an escalation on a refund. Null in the help centre, where the
  /// user picks from the kinds that are about nothing in particular.
  final TicketKind? kind;

  /// The opaque id of what the ticket is about. Required exactly for the kinds
  /// that need one, and its prefix has to agree with the kind.
  final String? refId;

  final String? subjectHint;

  /// What the ref is, for the line that tells the user what they are reporting.
  final String? refLabel;

  static Future<Ticket?> show(
    BuildContext context, {
    TicketKind? kind,
    String? refId,
    String? subjectHint,
    String? refLabel,
  }) {
    return showModalBottomSheet<Ticket>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (_) => RaiseTicketSheet(
        kind: kind,
        refId: refId,
        subjectHint: subjectHint,
        refLabel: refLabel,
      ),
    );
  }

  @override
  ConsumerState<RaiseTicketSheet> createState() => _RaiseTicketSheetState();
}

class _RaiseTicketSheetState extends ConsumerState<RaiseTicketSheet> {
  final _formKey = GlobalKey<FormState>();
  final _subjectController = TextEditingController();
  final _bodyController = TextEditingController();
  List<Attachment> _attachments = const [];

  late TicketKind _kind;
  TicketReason _reason = TicketReason.other;
  bool _submitting = false;

  @override
  void initState() {
    super.initState();
    _kind = widget.kind ?? TicketKindInfo.selfServe.first.kind;
    final hint = widget.subjectHint;
    if (hint != null) _subjectController.text = hint;
  }

  @override
  void dispose() {
    _subjectController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  TicketKindInfo get _info => TicketKindInfo.of(_kind);

  Future<void> _submit() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    setState(() => _submitting = true);

    try {
      final attachments = [
        for (final a in _attachments) a.resourceId,
      ];

      final ticket = await ref
          .read(raiseTicketProvider.notifier)
          .submit(
            kind: _kind,
            subject: _subjectController.text.trim(),
            body: _bodyController.text.trim(),
            attachments: attachments,
            refId: _info.needsRef ? widget.refId : null,
            reason: _info.needsReason ? _reason : null,
          );

      if (!mounted) return;
      if (ticket == null) {
        final error = ref.read(raiseTicketProvider).error;
        _showSnack(
          error?.toString() ?? 'Không gửi được yêu cầu. Vui lòng thử lại.',
        );
        setState(() => _submitting = false);
        return;
      }
      Navigator.of(context).pop(ticket);
    } catch (e) {
      if (!mounted) return;
      // The real message, not a guess: this used to say "không tải được ảnh
      // đính kèm" for *every* failure — including ones with no photo involved —
      // which sent people looking at their photos for a problem elsewhere.
      _showSnack(ErrorHandler.getErrorMessage(e));
      setState(() => _submitting = false);
    }
  }

  void _showSnack(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Gửi yêu cầu hỗ trợ', style: theme.textTheme.titleLarge),
              const SizedBox(height: 4),
              Text(
                'Đội hỗ trợ sẽ trả lời trong cuộc trò chuyện của yêu cầu này.',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 16),

              if (widget.kind == null)
                DropdownButtonFormField<TicketKind>(
                  initialValue: _kind,
                  decoration: const InputDecoration(labelText: 'Loại yêu cầu'),
                  items: [
                    for (final info in TicketKindInfo.selfServe)
                      DropdownMenuItem(
                        value: info.kind,
                        child: Text(info.label),
                      ),
                  ],
                  onChanged: (value) {
                    if (value != null) setState(() => _kind = value);
                  },
                )
              else
                InputDecorator(
                  decoration: const InputDecoration(labelText: 'Loại yêu cầu'),
                  child: Text(_info.label),
                ),

              if (widget.refLabel != null) ...[
                const SizedBox(height: 8),
                Text(
                  '${_info.needsRef ? ticketRefTypeLabelForKind(_kind) : 'Đối tượng'}: ${widget.refLabel}',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],

              if (_info.needsReason) ...[
                const SizedBox(height: 12),
                DropdownButtonFormField<TicketReason>(
                  initialValue: _reason,
                  decoration: const InputDecoration(labelText: 'Lý do'),
                  items: [
                    for (final reason in TicketReason.values)
                      DropdownMenuItem(
                        value: reason,
                        child: Text(ticketReasonLabel(reason)),
                      ),
                  ],
                  onChanged: (value) {
                    if (value != null) setState(() => _reason = value);
                  },
                ),
              ],

              const SizedBox(height: 12),
              TextFormField(
                controller: _subjectController,
                maxLength: 200,
                decoration: const InputDecoration(
                  labelText: 'Tiêu đề',
                  hintText: 'Ví dụ: Hàng không đúng mô tả',
                ),
                validator: (value) => (value == null || value.trim().isEmpty)
                    ? 'Vui lòng nhập tiêu đề'
                    : null,
              ),

              const SizedBox(height: 4),
              TextFormField(
                controller: _bodyController,
                maxLength: 4000,
                maxLines: 5,
                minLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Mô tả',
                  hintText: 'Kể lại chi tiết sự việc',
                  alignLabelWithHint: true,
                ),
              ),

              const SizedBox(height: 8),
              AttachmentPicker(
                attachments: _attachments,
                enabled: !_submitting,
                onChanged: (next) => setState(() => _attachments = next),
                upload: (file, mime) => ref
                    .read(ticketRepositoryProvider)
                    .uploadAttachment(file, mime: mime),
              ),

              const SizedBox(height: 16),
              FilledButton(
                onPressed: _submitting ? null : _submit,
                child: _submitting
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Gửi yêu cầu'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// `ref_type` follows from the kind, so the form can name what it is about
/// before the backend echoes it back.
String ticketRefTypeLabelForKind(TicketKind kind) => switch (kind) {
  TicketKind.reportListing => 'Tin đăng',
  TicketKind.reportAccount => 'Tài khoản',
  TicketKind.reportMessage => 'Tin nhắn',
  TicketKind.reportReview => 'Đánh giá',
  TicketKind.reportReviewReply => 'Phản hồi đánh giá',
  TicketKind.refundDispute => 'Yêu cầu hoàn tiền',
  TicketKind.orderIssue => 'Đơn hàng',
  _ => 'Đối tượng',
};
