import 'package:freezed_annotation/freezed_annotation.dart';

part 'help_ticket_model.freezed.dart';

part 'help_ticket_model.g.dart';

@freezed
abstract class HelpTicket with _$HelpTicket {
  const factory HelpTicket({
    required String id,
    required String title,
    required String description,
    required String category,
    required String
    status, // 'open' | 'in_progress' | 'waiting' | 'resolved' | 'closed'
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
    @JsonKey(name: 'last_message') String? lastMessage,
    List<String>? attachments,
  }) = _HelpTicket;

  factory HelpTicket.fromJson(Map<String, dynamic> json) =>
      _$HelpTicketFromJson(json);

  @override
  Map<String, dynamic> toJson();
}

@freezed
abstract class FaqItem with _$FaqItem {
  const factory FaqItem({
    required String id,
    required String question,
    required String answer,
    required String category,
  }) = _FaqItem;

  factory FaqItem.fromJson(Map<String, dynamic> json) =>
      _$FaqItemFromJson(json);

  @override
  Map<String, dynamic> toJson();
}

@freezed
abstract class HelpCenterStats with _$HelpCenterStats {
  const factory HelpCenterStats({
    @JsonKey(name: 'open_count') required int openCount,
    @JsonKey(name: 'resolved_count') required int resolvedCount,
    @JsonKey(name: 'total_count') required int totalCount,
  }) = _HelpCenterStats;

  factory HelpCenterStats.fromJson(Map<String, dynamic> json) =>
      _$HelpCenterStatsFromJson(json);

  @override
  Map<String, dynamic> toJson();
}
