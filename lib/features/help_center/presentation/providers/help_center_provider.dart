import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopnexus_flutter_app/api/generated/model/ticket.dart';
import 'package:shopnexus_flutter_app/api/generated/model/ticket_status.dart';
import 'package:shopnexus_flutter_app/features/ticket/data/models/ticket_kind_info.dart';
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
    @Default('Tất cả') String selectedCategory,
    @Default('') String searchQuery,
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _HelpCenterState;

  const HelpCenterState._();

  /// Danh sách FAQ đã được lọc theo danh mục và từ khóa tìm kiếm
  List<FaqItem> get filteredFaqs {
    return faqs.where((faq) {
      final matchesCat =
          selectedCategory == 'Tất cả' ||
          faq.category.toLowerCase() == selectedCategory.toLowerCase();
      final matchesQuery =
          searchQuery.isEmpty ||
          faq.question.toLowerCase().contains(searchQuery.toLowerCase()) ||
          faq.answer.toLowerCase().contains(searchQuery.toLowerCase());
      return matchesCat && matchesQuery;
    }).toList();
  }

  /// Danh sách yêu cầu đã được lọc theo từ khóa tìm kiếm (nếu có)
  List<Ticket> get filteredTickets {
    if (searchQuery.isEmpty) return tickets;
    final query = searchQuery.toLowerCase();
    return tickets.where((ticket) {
      return ticket.id.toLowerCase().contains(query) ||
          ticket.subject.toLowerCase().contains(query) ||
          TicketKindInfo.of(ticket.kind).label.toLowerCase().contains(query);
    }).toList();
  }

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

  void setSelectedCategory(String category) {
    state = state.copyWith(selectedCategory: category);
  }

  void setSearchQuery(String query) {
    state = state.copyWith(searchQuery: query);
  }

  Future<void> refresh() => _loadInitialData();
}
