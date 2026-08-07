import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopnexus_flutter_app/api/generated/model/notification.dart'
    as wire;
import 'package:shopnexus_flutter_app/core/realtime/realtime_client.dart';
import 'package:shopnexus_flutter_app/core/realtime/realtime_event.dart';
import 'package:shopnexus_flutter_app/features/account/data/repositories/account_repository.dart';

part 'notifications_provider.freezed.dart';
part 'notifications_provider.g.dart';

/// The pages read so far. [nextCursor] is null on the last one, so "there is more"
/// is a value rather than a guess from the page being full.
@freezed
abstract class NotificationFeed with _$NotificationFeed {
  const factory NotificationFeed({
    required List<wire.Notification> items,
    String? nextCursor,
    @Default(false) bool loadingMore,
  }) = _NotificationFeed;
}

@riverpod
class NotificationsController extends _$NotificationsController {
  @override
  Future<NotificationFeed> build() async {
    // `account.notification_created` carries the whole row, but the feed's own
    // shape is this module's, so the arrival is the trigger and the read is
    // REST's — one round trip against a socket that replays nothing.
    ref.listen<AsyncValue<RealtimeEvent>>(realtimeEventsProvider, (_, next) {
      if (next.value is NotificationCreatedEvent) ref.invalidateSelf();
    });
    final page = await ref.watch(accountRepositoryProvider).notifications();
    return NotificationFeed(items: page.data, nextCursor: page.meta.nextCursor);
  }

  Future<void> loadMore() async {
    final feed = state.value;
    final cursor = feed?.nextCursor;
    if (feed == null || cursor == null || feed.loadingMore) return;

    state = AsyncValue.data(feed.copyWith(loadingMore: true));
    try {
      final page = await ref
          .read(accountRepositoryProvider)
          .notifications(cursor: cursor);
      // Cuộn tới cuối rồi thoát màn ngay là đủ để notifier bị vứt trước khi
      // trang sau về.
      if (!ref.mounted) return;
      state = AsyncValue.data(
        NotificationFeed(
          items: [...feed.items, ...page.data],
          nextCursor: page.meta.nextCursor,
        ),
      );
    } catch (_) {
      // The pages already read stay on screen; the caller reports the attempt.
      if (ref.mounted) state = AsyncValue.data(feed);
      rethrow;
    }
  }

  /// Marks everything created at or before [upTo] read — the feed has no per-row
  /// id, so a row is its own bound. Omit it to mark the whole feed.
  Future<void> markRead({DateTime? upTo}) async {
    await ref
        .read(accountRepositoryProvider)
        .markNotificationsRead(before: upTo);
    // `ref` sau một `await` cũng là dùng Ref: nếu màn đã đóng, invalidate ở đây
    // ném đúng lỗi "Ref ... after it has been disposed" — và cái đã đọc thì vẫn
    // đã đọc trên server, nên không mất gì khi bỏ qua.
    if (!ref.mounted) return;
    ref.invalidateSelf();
    ref.invalidate(unreadNotificationsCountProvider);
  }
}

@riverpod
Future<int> unreadNotificationsCount(Ref ref) async {
  ref.listen<AsyncValue<RealtimeEvent>>(realtimeEventsProvider, (_, next) {
    if (next.value is NotificationCreatedEvent) ref.invalidateSelf();
  });
  return ref.watch(accountRepositoryProvider).getUnreadNotificationsCount();
}
