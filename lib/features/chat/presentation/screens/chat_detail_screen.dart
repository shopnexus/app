import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import 'package:shopnexus_flutter_app/api/generated/model/ticket_kind.dart';
import 'package:shopnexus_flutter_app/features/ticket/presentation/widgets/raise_ticket_sheet.dart';
import 'package:shopnexus_flutter_app/features/catalog/data/repositories/catalog_repository.dart';
import 'package:shopnexus_flutter_app/features/chat/data/models/chat_model.dart';
import 'package:shopnexus_flutter_app/features/chat/presentation/providers/chat_notifier.dart';
import 'package:shopnexus_flutter_app/features/chat/presentation/providers/chat_state.dart';
import 'package:shopnexus_flutter_app/features/chat/presentation/widgets/chat_message_bubble.dart';
import 'package:shopnexus_flutter_app/features/chat/presentation/widgets/chat_offer_card.dart';
import 'package:shopnexus_flutter_app/features/chat/presentation/widgets/chat_product_card.dart';
import 'package:shopnexus_flutter_app/features/chat/presentation/widgets/counter_offer_dialog.dart';
import 'package:shopnexus_flutter_app/features/chat/presentation/widgets/share_product_sheet.dart';

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

  /// Chọn xong là gửi luôn, không qua ô soạn: một sản phẩm là cả nội dung của
  /// tin nhắn, khác với ảnh — ảnh thường cần một câu đi kèm.
  Future<void> _sendProduct() async {
    final listing = await ShareProductSheet.show(context);
    if (listing == null) return;
    if (await _notifier.sendListing(listing)) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
    }
  }

  Future<void> _counterOffer(Offer offer) async {
    // Giá niêm yết là trần của mức giá trả lại, và DTO của offer không mang nó —
    // nó chỉ mang `variant_id`. Một lượt đọc để hộp thoại nói được câu "không
    // cao hơn X" ngay lúc gõ; hỏng thì vẫn mở hộp thoại, và server là chỗ giữ
    // luật.
    final askingUnitPrice = await _askingUnitPrice(offer);
    if (!mounted) return;
    final terms = await CounterOfferDialog.show(
      context,
      offer,
      askingUnitPrice: askingUnitPrice,
    );
    if (terms == null) return;
    await _notifier.counterOffer(
      offer.id,
      total: terms.total,
      quantity: terms.quantity,
      reason: terms.reason,
    );
  }

  /// Giá đang niêm yết của đúng biến thể đang thương lượng, hoặc null nếu không
  /// tra được — biến thể bị gỡ, mạng hỏng, hay tin đăng đã xoá.
  Future<int?> _askingUnitPrice(Offer offer) async {
    try {
      final detail = await ref
          .read(catalogRepositoryProvider)
          .listingDetail(offer.listingId);
      for (final variant in detail.variants) {
        if (variant.id == offer.variantId) return variant.price;
      }
    } catch (_) {
      // Nuốt có chủ đích: đây là thứ làm câu báo lỗi đẹp hơn, không phải điều
      // kiện để trả giá. Chặn người ta trả giá vì một lượt đọc phụ hỏng là đổi
      // một bất tiện lấy một chức năng.
    }
    return null;
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
              icon: const Icon(Icons.more_vert_rounded),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              color: theme.colorScheme.surface,
              elevation: 6,
              shadowColor: Colors.black.withValues(alpha: 0.15),
              itemBuilder: (_) => [
                PopupMenuItem(
                  onTap: () => _reportCounterparty(conversation),
                  child: Row(
                    children: [
                      Icon(
                        Icons.flag_outlined,
                        color: theme.colorScheme.error,
                        size: 20,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'Báo cáo người dùng',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: theme.colorScheme.error,
                        ),
                      ),
                    ],
                  ),
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
              onSendProduct: _sendProduct,
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
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold,
                  ),
                )
              : null,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            conversation.participantName,
            style: theme.textTheme.titleMedium?.copyWith(
              fontFamily: 'Inter',
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
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
          final isMine =
              message.isMine || (offer != null && state.viewerIsAuthor(offer));
          return Align(
            alignment: isMine ? Alignment.centerRight : Alignment.centerLeft,
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

        // Sau nhánh offer, vì hai thứ đọc từ hai chỗ khác nhau và một tin
        // không thể vừa là thẻ thương lượng backend viết vừa là cái ai đó trỏ
        // tay vào.
        final listingId = message.listingId;

        if (listingId != null) {
          return Align(
            alignment: message.isMine
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: ChatProductCard(
                listingId: listingId,
                onOpen: () => context.push('/home/product/$listingId'),
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
    required this.onSendProduct,
  });

  final TextEditingController controller;
  final bool isSending;
  final Future<void> Function(String text, List<XFile> images) onSend;
  final Future<void> Function() onSendProduct;

  @override
  State<_Composer> createState() => _ComposerState();
}

class _ComposerState extends State<_Composer> {
  final List<XFile> _selectedImages = [];
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImages() async {
    final theme = Theme.of(context);
    final picked = await showModalBottomSheet<List<XFile>>(
      context: context,
      backgroundColor: theme.colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 36,
                height: 4,
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: theme.colorScheme.onSurfaceVariant.withValues(
                    alpha: 0.4,
                  ),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.photo_library_outlined,
                    color: theme.colorScheme.primary,
                  ),
                ),
                title: Text(
                  'Chọn từ thư viện',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
                onTap: () async {
                  final images = await _picker.pickMultiImage();
                  if (ctx.mounted) Navigator.pop(ctx, images);
                },
              ),
              ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.camera_alt_outlined,
                    color: theme.colorScheme.primary,
                  ),
                ),
                title: Text(
                  'Chụp ảnh mới',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
                onTap: () async {
                  final image = await _picker.pickImage(
                    source: ImageSource.camera,
                  );
                  if (ctx.mounted) {
                    Navigator.pop(ctx, image != null ? [image] : <XFile>[]);
                  }
                },
              ),
            ],
          ),
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
    final isDarkMode = theme.brightness == Brightness.dark;

    return Container(
      padding: EdgeInsets.fromLTRB(
        12,
        8,
        12,
        8 + MediaQuery.of(context).padding.bottom,
      ),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        border: Border(
          top: BorderSide(
            color: theme.colorScheme.outlineVariant.withValues(alpha: 0.25),
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: isDarkMode
                ? Colors.black.withValues(alpha: 0.4)
                : Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
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
                        borderRadius: BorderRadius.circular(12),
                        child: Image.file(
                          File(file.path),
                          width: 64,
                          height: 64,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: -4,
                        right: -4,
                        child: InkWell(
                          onTap: () =>
                              setState(() => _selectedImages.removeAt(index)),
                          child: Container(
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              color: theme.colorScheme.error,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: theme.colorScheme.surface,
                                width: 1.5,
                              ),
                            ),
                            child: const Icon(
                              Icons.close,
                              size: 12,
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
                visualDensity: VisualDensity.compact,
              ),
              IconButton(
                onPressed: widget.isSending
                    ? null
                    : () => widget.onSendProduct(),
                icon: Icon(
                  Icons.storefront_outlined,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                tooltip: 'Gửi sản phẩm',
                visualDensity: VisualDensity.compact,
              ),
              const SizedBox(width: 4),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surfaceContainerHighest.withValues(
                      alpha: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: theme.colorScheme.outlineVariant.withValues(
                        alpha: 0.3,
                      ),
                    ),
                  ),
                  child: TextField(
                    controller: widget.controller,
                    minLines: 1,
                    maxLines: 4,
                    textInputAction: TextInputAction.newline,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      color: theme.colorScheme.onSurface,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Nhập tin nhắn…',
                      hintStyle: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        color: theme.colorScheme.onSurfaceVariant.withValues(
                          alpha: 0.7,
                        ),
                      ),
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(vertical: 10),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              SizedBox(
                width: 40,
                height: 40,
                child: IconButton.filled(
                  onPressed: widget.isSending ? null : _handleSend,
                  style: IconButton.styleFrom(
                    backgroundColor: theme.colorScheme.primary,
                    foregroundColor: theme.colorScheme.onPrimary,
                  ),
                  icon: widget.isSending
                      ? const SizedBox(
                          height: 18,
                          width: 18,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Icon(Icons.send_rounded, size: 18),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
