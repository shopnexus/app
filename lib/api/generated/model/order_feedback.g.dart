// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_feedback.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderFeedback _$OrderFeedbackFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'OrderFeedback',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const ['mine', 'reveal_at', 'theirs', 'theirs_submitted'],
    );
    final val = OrderFeedback(
      mine: $checkedConvert(
        'mine',
        (v) => v == null ? null : Feedback.fromJson(v as Map<String, dynamic>),
      ),
      revealAt: $checkedConvert(
        'reveal_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      theirs: $checkedConvert(
        'theirs',
        (v) => v == null ? null : Feedback.fromJson(v as Map<String, dynamic>),
      ),
      theirsSubmitted: $checkedConvert('theirs_submitted', (v) => v as bool),
    );
    return val;
  },
  fieldKeyMap: const {
    'revealAt': 'reveal_at',
    'theirsSubmitted': 'theirs_submitted',
  },
);

Map<String, dynamic> _$OrderFeedbackToJson(OrderFeedback instance) =>
    <String, dynamic>{
      'mine': instance.mine?.toJson(),
      'reveal_at': instance.revealAt?.toIso8601String(),
      'theirs': instance.theirs?.toJson(),
      'theirs_submitted': instance.theirsSubmitted,
    };
