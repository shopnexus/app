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

  void _openOfferDialog({
    double initialPrice = 0.0,
    String? productId,
    String? title,
    String? image,
  }) async {
    final state = ref.read(chatDetailProvider(widget.conversationId)).value;
    final conv = state?.conversation;

    final result = await showDialog<Map<String, dynamic>>(
      context: context,
      builder: (context) => CreateOfferDialog(
        initialPrice: initialPrice,
        productId: productId ?? conv?.productId,
        productTitle: title ?? conv?.productTitle,
        productImage: image ?? conv?.productImage,
      ),
    );

    if (result != null && result['price'] != null) {
      final double offerPrice = result['price'];
      final int quantity = result['quantity'] ?? 1;
      final String? note = result['note'];
      final String selProductId =
          result['productId'] ??
          productId ??
          conv?.productId ??
          'prod_leather_bag';
      final String selProductTitle =
          result['productTitle'] ??
          title ??
          conv?.productTitle ??
          'Vintage Leather Messenger Bag';
      final String? selProductImage =
          result['productImage'] ?? image ?? conv?.productImage;
      final double selProductPrice = result['productPrice'] ?? 420.0;

      await ref
          .read(chatDetailProvider(widget.conversationId).notifier)
          .sendOfferMessage(
            offerPrice: offerPrice,
            quantity: quantity,
            note: note,
            productId: selProductId,
            productTitle: selProductTitle,
            productImage: selProductImage,
            productPrice: selProductPrice,
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

  void _showChatSettingsSheet() {
    final theme = Theme.of(context);
    final state = ref.read(chatDetailProvider(widget.conversationId)).value;
    final conv = state?.conversation;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        bool isMuted = false;
        return StatefulBuilder(
          builder: (context, setSheetState) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Thanh kéo kéo xuống
                    Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.outlineVariant,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Header màn hình Setting Chat
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 22,
                            backgroundColor:
                                theme.colorScheme.surfaceContainerHighest,
                            backgroundImage:
                                conv?.participantAvatar != null &&
                                    conv!.participantAvatar!.isNotEmpty
                                ? CachedNetworkImageProvider(
                                    conv.participantAvatar!,
                                  )
                                : null,
                            child:
                                conv?.participantAvatar == null ||
                                    conv!.participantAvatar!.isEmpty
                                ? Text(
                                    conv?.participantName.isNotEmpty ?? false
                                        ? conv!.participantName[0].toUpperCase()
                                        : '?',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                : null,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  conv?.participantName ?? 'Nexus User',
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Chat Settings',
                                  style: theme.textTheme.labelMedium?.copyWith(
                                    color: theme.colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Divider(height: 1),
                    const SizedBox(height: 8),

                    // Option 1: Make an Offer
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
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      subtitle: const Text('Propose a custom price offer'),
                      onTap: () {
                        Navigator.pop(context);
                        _openOfferDialog(
                          initialPrice: 380.0,
                          title:
                              conv?.productTitle ??
                              'Vintage Leather Messenger Bag',
                        );
                      },
                    ),

                    // Option 2: Toggle Product Context
                    if (conv?.productTitle != null)
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: theme.colorScheme.secondaryContainer,
                          child: Icon(
                            _showProductContext
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: theme.colorScheme.onSecondaryContainer,
                          ),
                        ),
                        title: Text(
                          _showProductContext
                              ? 'Hide Product Context'
                              : 'Show Product Context',
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                        subtitle: Text(
                          _showProductContext
                              ? 'Hide top product bar'
                              : 'Show top product bar',
                        ),
                        onTap: () {
                          Navigator.pop(context);
                          setState(() {
                            _showProductContext = !_showProductContext;
                          });
                        },
                      ),

                    // Option 3: Mute Notifications
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: theme.colorScheme.surfaceContainerHigh,
                        child: Icon(
                          isMuted
                              ? Icons.notifications_off_outlined
                              : Icons.notifications_active_outlined,
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                      title: const Text(
                        'Mute Notifications',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      subtitle: const Text('Silence alerts for this chat'),
                      trailing: Switch(
                        value: isMuted,
                        onChanged: (val) {
                          setSheetState(() {
                            isMuted = val;
                          });
                        },
                      ),
                    ),

                    const Divider(height: 1),
                    const SizedBox(height: 8),

                    // Option 4: Block User
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: theme.colorScheme.errorContainer
                            .withValues(alpha: 0.5),
                        child: Icon(
                          Icons.block_outlined,
                          color: theme.colorScheme.error,
                        ),
                      ),
                      title: Text(
                        'Block ${conv?.participantName ?? 'User'}',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: theme.colorScheme.error,
                        ),
                      ),
                      subtitle: const Text(
                        'Stop receiving messages from this user',
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        _showBlockConfirmDialog(
                          conv?.participantName ?? 'User',
                        );
                      },
                    ),

                    // Option 5: Report Conversation
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: theme.colorScheme.errorContainer
                            .withValues(alpha: 0.5),
                        child: Icon(
                          Icons.flag_outlined,
                          color: theme.colorScheme.error,
                        ),
                      ),
                      title: const Text(
                        'Report Conversation',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      subtitle: const Text(
                        'Report inappropriate behavior or spam',
                      ),
                      onTap: () {
                        Navigator.pop(context);
                        _showReportDialog();
                      },
                    ),

                    // Option 6: Delete Conversation
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: theme.colorScheme.errorContainer,
                        child: Icon(
                          Icons.delete_outline,
                          color: theme.colorScheme.onErrorContainer,
                        ),
                      ),
                      title: Text(
                        'Delete Conversation',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: theme.colorScheme.error,
                        ),
                      ),
                      subtitle: const Text('Remove chat history permanently'),
                      onTap: () {
                        Navigator.pop(context);
                        _showDeleteConfirmDialog();
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _showBlockConfirmDialog(String name) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Block $name?'),
        content: Text(
          'You will no longer receive messages or offers from $name.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Blocked $name successfully.')),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
              foregroundColor: Theme.of(context).colorScheme.onError,
            ),
            child: const Text('Block'),
          ),
        ],
      ),
    );
  }

  void _showReportDialog() {
    String selectedReason = 'Spam or scam';
    final reasons = [
      'Spam or scam',
      'Inappropriate messages',
      'Harassment or abuse',
      'Counterfeit product',
      'Other',
    ];

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: const Text('Report Conversation'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: reasons
                .map(
                  (reason) => ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(
                      selectedReason == reason
                          ? Icons.radio_button_checked
                          : Icons.radio_button_unchecked,
                      color: selectedReason == reason
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                    title: Text(reason),
                    onTap: () {
                      setDialogState(() {
                        selectedReason = reason;
                      });
                    },
                  ),
                )
                .toList(),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Report submitted: $selectedReason')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.error,
                foregroundColor: Theme.of(context).colorScheme.onError,
              ),
              child: const Text('Submit Report'),
            ),
          ],
        ),
      ),
    );
  }

  void _showDeleteConfirmDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Conversation?'),
        content: const Text(
          'This action will permanently delete all messages in this conversation. It cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              context.pop(); // Quay lại trang danh sách chat
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Conversation deleted.')),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
              foregroundColor: Theme.of(context).colorScheme.onError,
            ),
            child: const Text('Delete'),
          ),
        ],
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
              icon: Icon(Icons.more_vert, color: theme.colorScheme.primary),
              onPressed: _showChatSettingsSheet,
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

            // Bottom Floating Input Bar (Unified single pill bar container)
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 6, 16, 10),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surfaceContainerLowest,
                    borderRadius: BorderRadius.circular(28),
                    border: Border.all(
                      color: theme.colorScheme.outlineVariant.withValues(
                        alpha: 0.4,
                      ),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.add_circle_outline,
                          color: theme.colorScheme.onSurfaceVariant,
                          size: 24,
                        ),
                        onPressed: _showAttachmentMenu,
                        padding: const EdgeInsets.all(8),
                        constraints: const BoxConstraints(),
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: TextField(
                          controller: _textController,
                          minLines: 1,
                          maxLines: 4,
                          textAlignVertical: TextAlignVertical.center,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onSurface,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Type a message...',
                            hintStyle: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 10,
                            ),
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            focusedErrorBorder: InputBorder.none,
                            fillColor: Colors.transparent,
                            filled: false,
                          ),
                          onSubmitted: (_) => _onSendMessage(),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Material(
                        color: theme.colorScheme.primary,
                        shape: const CircleBorder(),
                        clipBehavior: Clip.antiAlias,
                        child: IconButton(
                          icon: Icon(
                            Icons.send_rounded,
                            size: 18,
                            color: theme.colorScheme.onPrimary,
                          ),
                          onPressed: _onSendMessage,
                          padding: const EdgeInsets.all(10),
                          constraints: const BoxConstraints(),
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
    );
  }
}
