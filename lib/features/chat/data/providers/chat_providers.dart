/// The chat feature's data surface, in one import.
///
/// There is no per-conversation realtime stream any more: one receive-only
/// socket carries the whole account's facts, so a screen watches
/// `realtimeEventsProvider` and filters, rather than opening a connection.
library;

export '../models/chat_model.dart';
export '../repositories/chat_repository.dart';
