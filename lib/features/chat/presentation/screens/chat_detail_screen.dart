import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import 'package:shopnexus_flutter_app/api/generated/model/ticket_kind.dart';
import 'package:shopnexus_flutter_app/features/ticket/presentation/widgets/raise_ticket_sheet.dart';
import 'package:shopnexus_flutter_app/features/chat/data/models/chat_model.dart';
import 'package:shopnexus_flutter_app/features/chat/presentation/providers/chat_notifier.dart';
import 'package:shopnexus_flutter_app/features/chat/presentation/providers/chat_state.dart';
import 'package:shopnexus_flutter_app/features/chat/presentation/widgets/chat_message_bubble.dart';
import 'package:shopnexus_flutter_app/features/chat/presentation/widgets/chat_offer_card.dart';
import 'package:shopnexus_flutter_app/features/chat/presentation/widgets/counter_offer_dialog.dart';

/// One thread. Chat has one thread per pair of accounts, so there is no product
/// context on a conversation and nothing to pick between: the header is the
/// counterparty, and a negotiation appears as a card the backend wrote.
///
/// This is also the support thread — a ticket's `conversation_id` opens it, and a
/// staff reply carries no sender, which the bubble renders as the platform.
class ChatDetailScreen extends ConsumerStatefulWidget {
  const ChatDetailScreen({super.key, required this.conversationId});

  final String conversationId;

  @override
  ConsumerState<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends ConsumerState<ChatDetailScreen> {
  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _textController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  ChatDetailNotifier get _notifier =>
      ref.read(chatDetailProvider(widget.conversationId).notifier);

  /// The list is reversed, so "scrolled to the end" is the top of the thread.
  void _onScroll() {
    if (!_scrollController.hasClients) return;
    final position = _scrollController.position;
    if (position.pixels >= position.maxScrollExtent - 200) {
      _notifier.loadOlder();
    }
  }

  void _scrollToBottom() {
    if (!_scrollController.hasClients) return;
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
    );
  }

  Future<void> _send(String text, List<XFile> images) async {
    if (text.trim().isEmpty && images.isEmpty) return;
    if (await _notifier.sendMessage(text: text, files: images)) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
    }
  }

  Future<void> _counterOffer(Offer offer) async {
    final terms = await CounterOfferDialog.show(context, offer);
    if (terms == null) return;
    await _notifier.counterOffer(
      offer.id,
      total: terms.total,
      quantity: terms.quantity,
      reason: terms.reason,
    );
  }

  Future<void> _reportCounterparty(Conversation conversation) async {
    final ticket = await RaiseTicketSheet.show(
      context,
      kind: TicketKind.reportAccount,
      refId: conversation.counterparty.id,
      subjectHint: 'Báo cáo ${conversation.participantName}',
      refLabel: conversation.participantName,
    );
    if (ticket == null || !mounted) return;
    context.push('/account/help-center/${ticket.id}');
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final async = ref.watch(chatDetailProvider(widget.conversationId));

    // The state carries its own error field, so a failed send surfaces without
    // replacing the thread that is already on screen.
    ref.listen(chatDetailProvider(widget.conversationId), (_, next) {
      final message = next.value?.errorMessage;
      if (message == null) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(message)));
      _notifier.clearError();
    });

    final conversation = async.value?.conversation;

    return Scaffold(
      backgroundColor: theme.colorScheme.surfaceContainerLowest,
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go('/chat');
            }
          },
        ),
        titleSpacing: 0,
        title: conversation == null
            ? const Text('Đang tải…')
            : _Header(conversation: conversation),
        actions: [
          if (conversation != null)
            PopupMenuButton<void>(
              itemBuilder: (_) => [
                PopupMenuItem(
                  onTap: () => _reportCounterparty(conversation),
                  child: const Text('Báo cáo người dùng'),
                ),
              ],
            ),
        ],
      ),
      body: async.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, _) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Không tải được cuộc trò chuyện.'),
              const SizedBox(height: 12),
              OutlinedButton(
                onPressed: () =>
                    ref.invalidate(chatDetailProvider(widget.conversationId)),
                child: const Text('Thử lại'),
              ),
            ],
          ),
        ),
        data: (state) => Column(
          children: [
            Expanded(
              child: _Thread(
                state: state,
                controller: _scrollController,
                onAcceptOffer: _notifier.acceptOffer,
                onCounterOffer: _counterOffer,
                onCancelOffer: _notifier.cancelOffer,
              ),
            ),
            _Composer(
              controller: _textController,
              isSending: state.isSending,
              onSend: _send,
            ),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.conversation});

  final Conversation conversation;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final avatarUrl = conversation.participantAvatar;

    return Row(
      children: [
        CircleAvatar(
          radius: 18,
          backgroundColor: theme.colorScheme.surfaceContainerHighest,
          backgroundImage: (avatarUrl != null && avatarUrl.isNotEmpty)
              ? NetworkImage(avatarUrl)
              : null,
          child: (avatarUrl == null || avatarUrl.isEmpty)
              ? Text(
                  conversation.participantName.isNotEmpty
                      ? conversation.participantName[0].toUpperCase()
                      : '?',
                  style: theme.textTheme.titleSmall,
                )
              : null,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            conversation.participantName,
            style: theme.textTheme.titleMedium,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class _Thread extends StatelessWidget {
  const _Thread({
    required this.state,
    required this.controller,
    required this.onAcceptOffer,
    required this.onCounterOffer,
    required this.onCancelOffer,
  });

  final ChatDetailState state;
  final ScrollController controller;
  final Future<bool> Function(String offerId) onAcceptOffer;
  final Future<void> Function(Offer offer) onCounterOffer;
  final Future<bool> Function(String offerId) onCancelOffer;

  @override
  Widget build(BuildContext context) {
    if (state.messages.isEmpty) {
      return const Center(child: Text('Hãy bắt đầu cuộc trò chuyện.'));
    }

    final conversation = state.conversation;

    // Reversed so the newest is at the bottom without measuring the viewport,
    // and so paging older messages does not move what is on screen.
    final ordered = state.messages.reversed.toList();

    return ListView.builder(
      controller: controller,
      reverse: true,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      itemCount: ordered.length,
      itemBuilder: (context, index) {
        final message = ordered[index];
        final offerId = message.offerId;

        if (offerId != null) {
          final offer = state.offers[offerId];
          return Align(
            alignment: message.isMine
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: ChatOfferCard(
                offer: offer,
                viewerIsBuyer: offer != null && state.viewerIsBuyer(offer),
                viewerIsAuthor: offer != null && state.viewerIsAuthor(offer),
                onAccept: offer == null ? null : () => onAcceptOffer(offer.id),
                onCounter: offer == null ? null : () => onCounterOffer(offer),
                onCancel: offer == null ? null : () => onCancelOffer(offer.id),
                onCheckout: offer == null
                    ? null
                    : () => context.push('/checkout?offer_id=${offer.id}'),
                // Trang tin là nơi `POST /offers` mở ra — một cuộc mặc cả đã
                // đóng không nhận thêm hành động nào.
                onRenegotiate: offer == null
                    ? null
                    : () => context.push('/home/product/${offer.listingId}'),
              ),
            ),
          );
        }

        return ChatMessageBubble(
          message: message,
          counterpartyName: conversation?.participantName,
          counterpartyAvatarUrl: conversation?.participantAvatar,
        );
      },
    );
  }
}

class _Composer extends StatefulWidget {
  const _Composer({
    required this.controller,
    required this.isSending,
    required this.onSend,
  });

  final TextEditingController controller;
  final bool isSending;
  final Future<void> Function(String text, List<XFile> images) onSend;

  @override
  State<_Composer> createState() => _ComposerState();
}

class _ComposerState extends State<_Composer> {
  final List<XFile> _selectedImages = [];
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImages() async {
    final picked = await showModalBottomSheet<List<XFile>>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library_outlined),
              title: const Text('Chọn từ thư viện'),
              onTap: () async {
                final images = await _picker.pickMultiImage();
                if (ctx.mounted) Navigator.pop(ctx, images);
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt_outlined),
              title: const Text('Chụp ảnh mới'),
              onTap: () async {
                final image = await _picker.pickImage(source: ImageSource.camera);
                if (ctx.mounted) Navigator.pop(ctx, image != null ? [image] : <XFile>[]);
              },
            ),
          ],
        ),
      ),
    );

    if (picked != null && picked.isNotEmpty) {
      setState(() {
        _selectedImages.addAll(picked);
      });
    }
  }

  Future<void> _handleSend() async {
    final text = widget.controller.text;
    final images = List<XFile>.from(_selectedImages);
    if (text.trim().isEmpty && images.isEmpty) return;

    widget.controller.clear();
    setState(() {
      _selectedImages.clear();
    });
    await widget.onSend(text, images);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          border: Border(
            top: BorderSide(
              color: theme.colorScheme.outlineVariant.withValues(alpha: 0.4),
            ),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (_selectedImages.isNotEmpty)
              Container(
                height: 72,
                margin: const EdgeInsets.only(bottom: 8),
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: _selectedImages.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 8),
                  itemBuilder: (context, index) {
                    final file = _selectedImages[index];
                    return Stack(
                      clipBehavior: Clip.none,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.file(
                            File(file.path),
                            width: 64,
                            height: 64,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          top: -6,
                          right: -6,
                          child: InkWell(
                            onTap: () => setState(
                              () => _selectedImages.removeAt(index),
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: theme.colorScheme.error,
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
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: widget.isSending ? null : _pickImages,
                  icon: Icon(
                    Icons.photo_library_outlined,
                    color: _selectedImages.isNotEmpty
                        ? theme.colorScheme.primary
                        : theme.colorScheme.onSurfaceVariant,
                  ),
                  tooltip: 'Gửi hình ảnh',
                ),
                const SizedBox(width: 4),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surfaceContainerHighest
                          .withValues(alpha: 0.5),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextField(
                      controller: widget.controller,
                      minLines: 1,
                      maxLines: 4,
                      textInputAction: TextInputAction.newline,
                      decoration: const InputDecoration(
                        hintText: 'Nhập tin nhắn…',
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton.filled(
                  onPressed: widget.isSending ? null : _handleSend,
                  icon: widget.isSending
                      ? const SizedBox(
                          height: 18,
                          width: 18,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Icon(Icons.send_rounded, size: 20),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
