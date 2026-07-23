import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/models/seller_model.dart';
import '../../data/repositories/seller_repository.dart';

part 'seller_dashboard_provider.g.dart';

@riverpod
class SelectedDashboardPeriod extends _$SelectedDashboardPeriod {
  @override
  String build() => '3m';

  void setPeriod(String period) {
    state = period;
  }
}

@riverpod
class SellerDashboardNotifier extends _$SellerDashboardNotifier {
  @override
  FutureOr<SellerStats> build() async {
    final period = ref.watch(selectedDashboardPeriodProvider);
    final repository = ref.watch(sellerRepositoryProvider);
    return repository.getSellerDashboard(period: period);
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final period = ref.read(selectedDashboardPeriodProvider);
      final repository = ref.read(sellerRepositoryProvider);
      return repository.getSellerDashboard(period: period);
    });
  }
}
