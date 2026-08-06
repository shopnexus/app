import 'package:freezed_annotation/freezed_annotation.dart';

part 'help_ticket_model.freezed.dart';

part 'help_ticket_model.g.dart';

/// Help-centre copy, not an entity: the backend has no FAQ surface, so these are
/// shipped with the app. A user's actual tickets are the generated `Ticket`.
@freezed
abstract class FaqItem with _$FaqItem {
  const factory FaqItem({
    required String id,
    required String question,
    required String answer,
  }) = _FaqItem;

  factory FaqItem.fromJson(Map<String, dynamic> json) =>
      _$FaqItemFromJson(json);

  @override
  Map<String, dynamic> toJson();
}
