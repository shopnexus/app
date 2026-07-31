import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/models/help_ticket_model.dart';
import '../../data/repositories/help_center_repository.dart';

part 'help_center_provider.freezed.dart';

part 'help_center_provider.g.dart';

@freezed
abstract class HelpCenterState with _$HelpCenterState {
  const factory HelpCenterState({
    HelpCenterStats? stats,
    @Default([]) List<HelpTicket> tickets,
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

  /// Danh sách Ticket đã được lọc theo từ khóa tìm kiếm (nếu có)
  List<HelpTicket> get filteredTickets {
    if (searchQuery.isEmpty) return tickets;
    final query = searchQuery.toLowerCase();
    return tickets.where((t) {
      return t.id.toLowerCase().contains(query) ||
          t.title.toLowerCase().contains(query) ||
          t.category.toLowerCase().contains(query);
    }).toList();
  }
}

@riverpod
class HelpCenterNotifier extends _$HelpCenterNotifier {
  @override
  HelpCenterState build() {
    Future.microtask(() => _loadInitialData());
    return const HelpCenterState(isLoading: true);
  }

  Future<void> _loadInitialData() async {
    try {
      final repo = ref.read(helpCenterRepositoryProvider);
      final stats = await repo.getStats();
      final tickets = await repo.getTickets();
      final faqs = await repo.getFaqs();

      state = HelpCenterState(
        stats: stats,
        tickets: tickets,
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

  Future<bool> createTicket({
    required String title,
    required String category,
    required String description,
    List<String>? attachments,
  }) async {
    try {
      final repo = ref.read(helpCenterRepositoryProvider);
      await repo.createTicket(
        title: title,
        category: category,
        description: description,
        attachments: attachments,
      );
      final updatedStats = await repo.getStats();
      final updatedTickets = await repo.getTickets();

      state = state.copyWith(stats: updatedStats, tickets: updatedTickets);
      return true;
    } catch (e) {
      state = state.copyWith(
        errorMessage: 'Tạo Ticket không thành công: ${e.toString()}',
      );
      return false;
    }
  }

  Future<void> refresh() async {
    await _loadInitialData();
  }
}
