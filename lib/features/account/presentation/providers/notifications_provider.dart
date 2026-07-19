import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/models/account_model.dart';
import '../../data/repositories/account_repository.dart';

part 'notifications_provider.g.dart';

@riverpod
Future<List<Notification>> notifications(
  Ref ref, {
  int page = 1,
  int limit = 20,
}) async {
  final repository = ref.watch(accountRepositoryProvider);
  return repository.getNotifications(page: page, limit: limit);
}

@riverpod
Future<int> unreadNotificationsCount(Ref ref) async {
  final repository = ref.watch(accountRepositoryProvider);
  return repository.getUnreadNotificationsCount();
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
