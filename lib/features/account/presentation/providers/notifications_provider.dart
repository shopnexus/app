import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/realtime/realtime_client.dart';
import '../../../../core/realtime/realtime_event.dart';
import '../../data/models/account_model.dart';
import '../../data/repositories/account_repository.dart';

part 'notifications_provider.g.dart';

@riverpod
Future<List<Notification>> notifications(
  Ref ref, {
  int page = 1,
  int limit = 20,
}) async {
  // `account.notification_created` carries the whole row, but the feed's own
  // shape is this module's, so the arrival is the trigger and the read is REST's
  // — one round trip against a socket that replays nothing.
  _refetchOnNotification(ref);
  final repository = ref.watch(accountRepositoryProvider);
  return repository.getNotifications(page: page, limit: limit);
}

@riverpod
Future<int> unreadNotificationsCount(Ref ref) async {
  _refetchOnNotification(ref);
  final repository = ref.watch(accountRepositoryProvider);
  return repository.getUnreadNotificationsCount();
}

/// Listening to the event feed is also what makes the socket connect, so the
/// badge being on screen is enough to keep the stream alive.
void _refetchOnNotification(Ref ref) {
  ref.listen<AsyncValue<RealtimeEvent>>(realtimeEventsProvider, (_, next) {
    if (next.value is NotificationCreatedEvent) ref.invalidateSelf();
  });
}

@riverpod
class NotificationsController extends _$NotificationsController {
  @override
  FutureOr<void> build() {}

  Future<void> markAsRead(List<int> ids) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(accountRepositoryProvider);
      await repository.markNotificationsAsRead(ids);
      ref.invalidate(notificationsProvider);
      ref.invalidate(unreadNotificationsCountProvider);
    });
  }

  Future<void> markAllAsRead() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(accountRepositoryProvider);
      await repository.markAllNotificationsAsRead();
      ref.invalidate(notificationsProvider);
      ref.invalidate(unreadNotificationsCountProvider);
    });
  }
}
