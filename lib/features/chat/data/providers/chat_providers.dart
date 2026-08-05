/// The chat feature's data surface, in one import.
///
/// There is no per-conversation realtime stream any more: one receive-only
/// socket carries the whole account's facts, so a screen watches
/// `realtimeEventsProvider` and filters, rather than opening a connection.
library;

export 'package:shopnexus_flutter_app/features/chat/data/models/chat_model.dart';
export 'package:shopnexus_flutter_app/features/chat/data/repositories/chat_repository.dart';
