import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:shopnexus_flutter_app/api/generated/model/conversation.dart';
import 'package:shopnexus_flutter_app/api/generated/model/message.dart';

/// Captured verbatim from the live gateway, so these assert the shape the server actually
/// sends rather than one written to match the model.
///
/// The bug this pins: `refs` was `omitempty` on the server DTO while the spec marks it
/// required, so it went missing on every message that references nothing — which is nearly
/// all of them. The generated field is non-nullable `Map<String, Object>`, so `fromJson`
/// threw and the whole thread failed to deserialise. A required property has no empty
/// encoding other than being present and empty.
const messageJson = r'''
{
  "id": "msg_fg24djggt6n4b",
  "conversation_id": "cnv_6hb7nk7qphawd",
  "sender_id": "acc_2erqkwcaxn0x3",
  "from_support": false,
  "type": "user",
  "body": "?",
  "attachments": [],
  "refs": {},
  "card": {},
  "created_at": "2026-08-05T06:11:40.013526Z",
  "edited_at": null,
  "deleted_at": null
}
''';

const conversationJson = r'''
{
  "id": "cnv_6hb7nk7qphawd",
  "ticket_id": null,
  "counterparty": {"id": "acc_2erqkwcaxn0x3", "name": "Bean", "avatar": null},
  "last_message_at": "2026-08-05T06:11:40.013526Z",
  "unread": 0,
  "read_at": "2026-08-05T16:47:31.837519Z",
  "counterparty_read_at": "2026-08-05T06:11:37.747441Z",
  "created_at": "2026-08-05T02:36:19.968745Z"
}
''';

Map<String, dynamic> decode(String source) =>
    jsonDecode(source) as Map<String, dynamic>;

void main() {
  test('a live message parses, empty collections and all', () {
    final message = Message.fromJson(decode(messageJson));

    expect(message.id, 'msg_fg24djggt6n4b');
    expect(message.attachments, isEmpty);
    expect(message.refs, isEmpty);
  });

  test('a message missing refs does not parse — which is why it is always sent', () {
    final withoutRefs = decode(messageJson)..remove('refs');

    expect(() => Message.fromJson(withoutRefs), throwsA(anything));
  });

  test('a live inbox row parses, nested message included', () {
    final row = decode(conversationJson)
      ..['last_message'] = decode(messageJson);

    final conversation = Conversation.fromJson(row);

    expect(conversation.id, 'cnv_6hb7nk7qphawd');
    expect(conversation.lastMessage?.refs, isEmpty);
  });
}
