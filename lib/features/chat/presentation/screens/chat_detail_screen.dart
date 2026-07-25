import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/chat_notifier.dart';
import '../widgets/chat_message_bubble.dart';
import '../widgets/create_offer_dialog.dart';

class ChatDetailScreen extends ConsumerStatefulWidget {
  final String conversationId;

  const ChatDetailScreen({super.key, required this.conversationId});

  @override
  ConsumerState<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends ConsumerState<ChatDetailScreen> {
  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool _showProductContext = true;

  @override
  void dispose() {
    _textController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
      );
    }
  }

  void _onSendMessage() async {
    final text = _textController.text;
    if (text.trim().isEmpty) return;

    _textController.clear();
    final success = await ref
        .read(chatDetailProvider(widget.conversationId).notifier)
        .sendTextMessage(text);

    if (success) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollToBottom();
      });
    }
  }

  void _openOfferDialog({double initialPrice = 0.0, String? title}) async {
    final result = await showDialog<Map<String, dynamic>>(
      context: context,
      builder: (context) =>
          CreateOfferDialog(initialPrice: initialPrice, productTitle: title),
    );

    if (result != null && result['price'] != null) {
      final double offerPrice = result['price'];
      final String? note = result['note'];

      final state = ref.read(chatDetailProvider(widget.conversationId)).value;
      final conv = state?.conversation;

      await ref
          .read(chatDetailProvider(widget.conversationId).notifier)
          .sendOfferMessage(
            offerPrice: offerPrice,
            note: note,
            productId: conv?.productId,
            productTitle: conv?.productTitle,
            productImage: conv?.productImage,
            productPrice: 420.0, // Default reference price for demo
          );

      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollToBottom();
      });
    }
  }

  void _showAttachmentMenu() {
    final theme = Theme.of(context);
    final state = ref.read(chatDetailProvider(widget.conversationId)).value;
    final conv = state?.conversation;

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: theme.colorScheme.primaryContainer,
                  child: Icon(
                    Icons.local_offer_outlined,
                    color: theme.colorScheme.onPrimaryContainer,
                  ),
                ),
                title: const Text(
                  'Make an Offer',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text('Propose a custom price to seller'),
                onTap: () {
                  Navigator.pop(context);
                  _openOfferDialog(
                    initialPrice: 380.0,
                    title:
                        conv?.productTitle ?? 'Vintage Leather Messenger Bag',
                  );
                },
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: theme.colorScheme.secondaryContainer,
                  child: Icon(
                    Icons.image_outlined,
                    color: theme.colorScheme.onSecondaryContainer,
                  ),
                ),
                title: const Text(
                  'Send Photo',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text('Share product photos or evidence'),
                onTap: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Image picker triggered')),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final chatDetailAsync = ref.watch(
      chatDetailProvider(widget.conversationId),
    );

    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.pop(),
          ),
          titleSpacing: 0,
          title: chatDetailAsync.when(
            data: (state) {
              final conv = state.conversation;
              return Row(
                children: [
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: theme.colorScheme.surfaceContainerHighest,
                    backgroundImage:
                        conv?.participantAvatar != null &&
                            conv!.participantAvatar!.isNotEmpty
                        ? CachedNetworkImageProvider(conv.participantAvatar!)
                        : null,
                    child:
                        conv?.participantAvatar == null ||
                            conv!.participantAvatar!.isEmpty
                        ? Text(
                            conv?.participantName.isNotEmpty ?? false
                                ? conv!.participantName[0].toUpperCase()
                                : '?',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          )
                        : null,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          conv?.participantName ?? 'Nexus User',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          conv?.isOnline ?? false ? 'Active now' : 'Offline',
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: conv?.isOnline ?? false
                                ? theme.colorScheme.primary
                                : theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
            loading: () => const Text('Loading...'),
            error: (error, stackTrace) => const Text('Chat'),
          ),
          actions: [
            IconButton(
              icon: Icon(
                _showProductContext
                    ? Icons.info_rounded
                    : Icons.info_outline_rounded,
                color: theme.colorScheme.primary,
              ),
              onPressed: () {
                setState(() {
                  _showProductContext = !_showProductContext;
                });
              },
            ),
          ],
        ),
        body: Column(
          children: [
            // Top Product Context Header (if available)
            chatDetailAsync.whenData((state) {
                  final conv = state.conversation;
                  if (_showProductContext && conv?.productTitle != null) {
                    return Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      color: theme.colorScheme.surfaceContainerLow,
                      child: Row(
                        children: [
                          if (conv?.productImage != null)
                            ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                              child: CachedNetworkImage(
                                imageUrl: conv!.productImage!,
                                width: 36,
                                height: 36,
                                fit: BoxFit.cover,
                              ),
                            ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Product in Context',
                                  style: theme.textTheme.labelSmall?.copyWith(
                                    color: theme.colorScheme.onSurfaceVariant,
                                  ),
                                ),
                                Text(
                                  conv!.productTitle!,
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          OutlinedButton(
                            onPressed: () => _openOfferDialog(
                              initialPrice: 380.0,
                              title: conv.productTitle,
                            ),
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                              ),
                              minimumSize: const Size(0, 32),
                            ),
                            child: const Text('Make Offer'),
                          ),
                        ],
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                }).value ??
                const SizedBox.shrink(),

            // Chat Canvas (Messages List)
            Expanded(
              child: chatDetailAsync.when(
                data: (state) {
                  final messages = state.messages;

                  // Trigger auto-scroll on frame build
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    _scrollToBottom();
                  });

                  return ListView.builder(
                    controller: _scrollController,
                    padding: const EdgeInsets.all(16),
                    itemCount: messages.length + 1,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: theme.colorScheme.surfaceContainerHigh,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                'Today, 10:24 AM',
                                style: theme.textTheme.labelSmall?.copyWith(
                                  color: theme.colorScheme.onSurfaceVariant,
                                ),
                              ),
                            ),
                          ),
                        );
                      }

                      final msg = messages[index - 1];
                      return ChatMessageBubble(
                        message: msg,
                        onRespondToOffer: (status) {
                          ref
                              .read(
                                chatDetailProvider(
                                  widget.conversationId,
                                ).notifier,
                              )
                              .respondToOffer(msg.id, status);
                        },
                        onCounterOffer: () {
                          _openOfferDialog(
                            initialPrice: msg.metadata?.offerPrice ?? 380.0,
                            title: msg.metadata?.productTitle,
                          );
                        },
                      );
                    },
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stackTrace) =>
                    Center(child: Text('Lỗi: $error')),
              ),
            ),

            // Bottom Floating Input Bar
            SafeArea(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surface,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 10,
                      offset: const Offset(0, -2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.add_circle_outline,
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                      onPressed: _showAttachmentMenu,
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.surfaceContainerLowest,
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: theme.colorScheme.outlineVariant.withValues(
                              alpha: 0.4,
                            ),
                          ),
                        ),
                        child: TextField(
                          controller: _textController,
                          minLines: 1,
                          maxLines: 4,
                          decoration: const InputDecoration(
                            hintText: 'Type a message...',
                            border: InputBorder.none,
                          ),
                          onSubmitted: (_) => _onSendMessage(),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    CircleAvatar(
                      radius: 22,
                      backgroundColor: theme.colorScheme.primary,
                      child: IconButton(
                        icon: Icon(
                          Icons.send_rounded,
                          size: 20,
                          color: theme.colorScheme.onPrimary,
                        ),
                        onPressed: _onSendMessage,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
