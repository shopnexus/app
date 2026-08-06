import 'package:flutter_test/flutter_test.dart';
// The DTOs come through chat_model's re-export, which is what the app itself
// imports — pulling them straight from the generated barrel is a second path to
// the same library.
import 'package:shopnexus_flutter_app/features/chat/data/models/chat_model.dart';
import 'package:shopnexus_flutter_app/features/chat/presentation/providers/chat_state.dart';

/// The contract now says both things outright: `ticket_id` marks a support
/// thread, `from_support` marks a support reply. Both used to be guessed at, and
/// a guess put the desk in the inbox and read every system row as support.
void main() {
  final desk = AccountSummary(
    id: 'acc_desk',
    name: 'Hỗ trợ ShopNexus',
    avatar: null,
  );
  final seller = AccountSummary(
    id: 'acc_seller',
    name: 'Bún Bò Store',
    avatar: null,
  );

  Conversation conversation({
    required String id,
    required AccountSummary counterparty,
    String? ticketId,
  }) {
    return Conversation(
      counterparty: counterparty,
      createdAt: DateTime.utc(2026, 1, 1),
      id: id,
      lastMessage: null,
      lastMessageAt: DateTime.utc(2026, 1, 2),
      readAt: null,
      counterpartyReadAt: null,
      ticketId: ticketId,
      unread: 0,
    );
  }

  Message message({
    String? senderId,
    bool fromSupport = false,
    MessageType type = MessageType.user,
  }) {
    return Message(
      id: 'msg_1',
      conversationId: 'cnv_1',
      senderId: senderId,
      fromSupport: fromSupport,
      type: type,
      body: 'Chúng tôi đang xem xét yêu cầu của bạn.',
      attachments: const [],
      refs: const {},
      card: const {},
      createdAt: DateTime.utc(2026, 1, 2),
      editedAt: null,
      deletedAt: null,
    );
  }

  group('the inbox', () {
    test('leaves a ticket thread out and keeps the ordinary ones', () {
      final state = ChatListState(
        conversations: [
          conversation(id: 'cnv_1', counterparty: seller),
          conversation(id: 'cnv_2', counterparty: desk, ticketId: 'tkt_1'),
        ],
      );

      expect(state.inboxConversations.map((c) => c.id), ['cnv_1']);
      expect(state.filteredConversations.map((c) => c.id), ['cnv_1']);
    });

    test('does not find a ticket thread by searching for the desk', () {
      final state = ChatListState(
        conversations: [
          conversation(id: 'cnv_2', counterparty: desk, ticketId: 'tkt_1'),
        ],
        searchQuery: 'hỗ trợ',
      );

      expect(state.filteredConversations, isEmpty);
    });

    test('a realtime patch keeps the row a ticket thread', () {
      final patched = conversation(
        id: 'cnv_2',
        counterparty: desk,
        ticketId: 'tkt_1',
      ).patch(unread: 3);

      expect(patched.ticketId, 'tkt_1');
      expect(patched.isTicketThread, isTrue);
    });
  });

  group('a support reply', () {
    test('is told by the flag, not by an absent sender', () {
      final reply = ChatMessage(
        message: message(fromSupport: true),
        isMine: false,
      );

      expect(reply.isFromSupport, isTrue);
      expect(reply.isSystem, isFalse);
    });

    test('a system row is not a support reply', () {
      final system = ChatMessage(
        message: message(type: MessageType.system),
        isMine: false,
      );

      expect(system.isSystem, isTrue);
      expect(system.isFromSupport, isFalse);
    });

    test('an ordinary message with a sender is neither', () {
      final ordinary = ChatMessage(
        message: message(senderId: seller.id),
        isMine: false,
      );

      expect(ordinary.isFromSupport, isFalse);
      expect(ordinary.isSystem, isFalse);
    });
  });
}
