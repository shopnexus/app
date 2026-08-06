import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopnexus_flutter_app/api/generated/model/ticket.dart';
import 'package:shopnexus_flutter_app/api/generated/model/ticket_status.dart';
import 'package:shopnexus_flutter_app/features/ticket/data/repositories/ticket_repository.dart';
import 'package:shopnexus_flutter_app/features/help_center/data/models/help_ticket_model.dart';
import 'package:shopnexus_flutter_app/features/help_center/data/repositories/help_center_repository.dart';

part 'help_center_provider.freezed.dart';

part 'help_center_provider.g.dart';

@freezed
abstract class HelpCenterState with _$HelpCenterState {
  const factory HelpCenterState({
    @Default([]) List<Ticket> tickets,
    @Default([]) List<FaqItem> faqs,
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _HelpCenterState;

  const HelpCenterState._();

  /// Counted from the tickets themselves rather than fetched: `/tickets` has no
  /// summary route, and a count derived from the list cannot disagree with it.
  int get openCount =>
      tickets.where((t) => t.status != TicketStatus.resolved).length;

  int get resolvedCount =>
      tickets.where((t) => t.status == TicketStatus.resolved).length;

  int get totalCount => tickets.length;
}

@riverpod
class HelpCenterNotifier extends _$HelpCenterNotifier {
  @override
  HelpCenterState build() {
    Future.microtask(_loadInitialData);
    return const HelpCenterState(isLoading: true);
  }

  Future<void> _loadInitialData() async {
    try {
      final faqs = await ref.read(helpCenterRepositoryProvider).getFaqs();
      final page = await ref.read(ticketRepositoryProvider).list();

      state = HelpCenterState(
        tickets: page.tickets,
        faqs: faqs,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: 'Không thể tải dữ liệu trợ giúp. Vui lòng thử lại.',
      );
    }
  }

  Future<void> refresh() => _loadInitialData();
}
