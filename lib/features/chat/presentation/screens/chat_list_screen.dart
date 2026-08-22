import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopnexus_flutter_app/api/generated/model/ticket.dart';
import 'package:shopnexus_flutter_app/api/generated/model/ticket_status.dart';
import 'package:shopnexus_flutter_app/features/chat/data/models/chat_model.dart';
import 'package:shopnexus_flutter_app/features/chat/presentation/providers/chat_notifier.dart';
import 'package:shopnexus_flutter_app/features/chat/presentation/widgets/chat_item_widget.dart';
import 'package:shopnexus_flutter_app/features/ticket/data/models/ticket_kind_info.dart';
import 'package:shopnexus_flutter_app/features/ticket/presentation/providers/ticket_provider.dart';
import 'package:shopnexus_flutter_app/features/ticket/presentation/ticket_thread.dart';
import 'package:shopnexus_flutter_app/features/ticket/presentation/widgets/raise_ticket_sheet.dart';

/// Hộp thư: mọi thread của tài khoản này, mua bán và hỗ trợ chung một chỗ.
///
/// Hỗ trợ là một *tab*, không phải một màn khác. Một ticket là một cuộc trò
/// chuyện — chữ của người gửi nằm ở đó, nhân viên trả lời cũng ở đó — nên đọc nó
/// ở màn riêng như trước là bắt người ta đi ra khỏi hộp thư rồi lại vào. Cái mà
/// một thread hỗ trợ có thêm là trạng thái và kết quả xử lý, và cả hai nằm trên
/// tấm băng ở đầu thread.
///
/// Hai tab chia nhau trên `ticket_id` của cùng một danh sách, không phải hai lượt
/// đọc: `GET /conversations` trả về cả hai loại.
class ChatListScreen extends ConsumerStatefulWidget {
  const ChatListScreen({super.key, this.initialTab = ChatInboxTab.trade});

  /// Tab mở sẵn. `/chat?tab=support` là đường mà một yêu cầu vừa gửi đi dẫn tới
  /// khi thread của nó còn chưa kịp sinh ra.
  final ChatInboxTab initialTab;

  @override
  ConsumerState<ChatListScreen> createState() => _ChatListScreenState();
}

enum ChatInboxTab {
  trade('Tin nhắn'),
  support('Hỗ trợ');

  const ChatInboxTab(this.label);

  final String label;

  static ChatInboxTab fromQuery(String? value) =>
      value == 'support' ? ChatInboxTab.support : ChatInboxTab.trade;
}

class _ChatListScreenState extends ConsumerState<ChatListScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabs = TabController(
    length: ChatInboxTab.values.length,
    initialIndex: widget.initialTab.index,
    vsync: this,
  );

  @override
  void dispose() {
    _tabs.dispose();
    super.dispose();
  }

  Future<void> _raiseTicket() async {
    final ticket = await RaiseTicketSheet.show(context);
    if (ticket == null || !mounted) return;
    // Yêu cầu mới về đúng chỗ nó sẽ được trả lời.
    ref.invalidate(chatListProvider);
    await openTicketThread(context, ref, ticket);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final chatListAsync = ref.watch(chatListProvider);
    final ticketsByConversation =
        ref.watch(ticketsByConversationProvider).value ??
        const <String, Ticket>{};

    // Đếm từ chính các ticket đã đọc được, và chỉ đếm cái *biết chắc*: một thread
    // mà ticket của nó chưa về thì không tính là chưa xong, thay vì tính vào rồi
    // làm con số trên tab to hơn sự thật.
    final openTickets = ticketsByConversation.values
        .where((ticket) => ticket.status != TicketStatus.resolved)
        .length;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tin nhắn',
          style: theme.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.primary,
          ),
        ),
        elevation: 0,
        bottom: TabBar(
          controller: _tabs,
          labelColor: theme.colorScheme.primary,
          unselectedLabelColor: theme.colorScheme.onSurfaceVariant,
          indicatorColor: theme.colorScheme.primary,
          tabs: [
            for (final tab in ChatInboxTab.values)
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(tab.label),
                    if (tab == ChatInboxTab.support && openTickets > 0) ...[
                      const SizedBox(width: 6),
                      _CountBadge(count: openTickets),
                    ],
                  ],
                ),
              ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              onChanged: (value) {
                ref.read(chatListProvider.notifier).search(value);
              },
              decoration: InputDecoration(
                hintText: 'Tìm cuộc trò chuyện...',
                prefixIcon: const Icon(Icons.search, size: 20),
                filled: true,
                fillColor: theme.colorScheme.surfaceContainerLowest,
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: theme.colorScheme.outline),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: theme.colorScheme.outlineVariant.withValues(
                      alpha: 0.5,
                    ),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: theme.colorScheme.primary),
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),

          Expanded(
            child: TabBarView(
              controller: _tabs,
              children: [
                for (final tab in ChatInboxTab.values)
                  chatListAsync.when(
                    data: (state) => _ConversationList(
                      tab: tab,
                      conversations: state.filtered(
                        support: tab == ChatInboxTab.support,
                        titles: {
                          for (final entry in ticketsByConversation.entries)
                            entry.key: entry.value.subject,
                        },
                      ),
                      tickets: ticketsByConversation,
                      isSearching: state.searchQuery.isNotEmpty,
                      onRefresh: () => ref
                          .read(chatListProvider.notifier)
                          .fetchConversations(),
                      onRaiseTicket: _raiseTicket,
                    ),
                    loading: () => const _InboxShimmer(),
                    error: (err, _) => _InboxError(
                      error: err,
                      onRetry: () => ref
                          .read(chatListProvider.notifier)
                          .fetchConversations(),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ConversationList extends ConsumerWidget {
  const _ConversationList({
    required this.tab,
    required this.conversations,
    required this.tickets,
    required this.isSearching,
    required this.onRefresh,
    required this.onRaiseTicket,
  });

  final ChatInboxTab tab;
  final List<Conversation> conversations;
  final Map<String, Ticket> tickets;
  final bool isSearching;
  final Future<void> Function() onRefresh;
  final VoidCallback onRaiseTicket;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isSupport = tab == ChatInboxTab.support;

    return RefreshIndicator(
      onRefresh: onRefresh,
      child: Column(
        children: [
          // Gửi yêu cầu ở đúng chỗ nó được trả lời.
          if (isSupport)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
              child: SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: onRaiseTicket,
                  icon: const Icon(Icons.add_rounded, size: 18),
                  label: const Text('Gửi yêu cầu mới'),
                ),
              ),
            ),
          Expanded(
            child: conversations.isEmpty
                ? ListView(
                    // Vẫn là ListView để kéo-làm-mới còn hoạt động trên một tab
                    // rỗng.
                    physics: const AlwaysScrollableScrollPhysics(),
                    children: [
                      const SizedBox(height: 80),
                      Icon(
                        isSupport
                            ? Icons.support_agent_rounded
                            : Icons.chat_bubble_outline_rounded,
                        size: 64,
                        color: theme.colorScheme.onSurfaceVariant.withValues(
                          alpha: 0.4,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        isSearching
                            ? 'Không tìm thấy cuộc trò chuyện nào'
                            : isSupport
                            ? 'Bạn chưa gửi yêu cầu hỗ trợ nào'
                            : 'Chưa có tin nhắn nào',
                        textAlign: TextAlign.center,
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  )
                : ListView.separated(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: conversations.length,
                    separatorBuilder: (context, index) => Divider(
                      height: 1,
                      indent: 68,
                      color: theme.colorScheme.outlineVariant.withValues(
                        alpha: 0.2,
                      ),
                    ),
                    itemBuilder: (context, index) {
                      final conversation = conversations[index];
                      final ticket = tickets[conversation.id];
                      return ChatItemWidget(
                        conversation: conversation,
                        // Bên kia của một thread hỗ trợ là cả sàn, nên hàng được
                        // đặt tên bằng thứ đã được nêu ra, không bằng người đang
                        // trực.
                        title: isSupport
                            ? (ticket?.subject ?? 'Yêu cầu hỗ trợ')
                            : null,
                        isSupport: isSupport,
                        badge: ticket == null
                            ? null
                            : ticketStatusLabel(ticket.status),
                        onTap: () {
                          ref
                              .read(chatListProvider.notifier)
                              .markAsRead(conversation.id);
                          context.push('/chat/${conversation.id}');
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class _CountBadge extends StatelessWidget {
  const _CountBadge({required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
      constraints: const BoxConstraints(minWidth: 18),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary,
        borderRadius: BorderRadius.circular(9),
      ),
      child: Text(
        count > 99 ? '99+' : '$count',
        textAlign: TextAlign.center,
        style: theme.textTheme.labelSmall?.copyWith(
          color: theme.colorScheme.onPrimary,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _InboxShimmer extends StatelessWidget {
  const _InboxShimmer();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 5,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Shimmer.fromColors(
          baseColor: theme.colorScheme.surfaceContainerHighest,
          highlightColor: theme.colorScheme.surface,
          child: Row(
            children: [
              const CircleAvatar(radius: 24),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(height: 16, width: 140, color: Colors.white),
                    const SizedBox(height: 8),
                    Container(
                      height: 12,
                      width: double.infinity,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InboxError extends StatelessWidget {
  const _InboxError({required this.error, required this.onRetry});

  final Object error;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Lỗi khi tải tin nhắn: $error'),
          const SizedBox(height: 12),
          ElevatedButton(onPressed: onRetry, child: const Text('Thử lại')),
        ],
      ),
    );
  }
}
