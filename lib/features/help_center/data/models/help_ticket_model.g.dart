// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'help_ticket_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HelpTicket _$HelpTicketFromJson(Map<String, dynamic> json) => _HelpTicket(
  id: json['id'] as String,
  title: json['title'] as String,
  description: json['description'] as String,
  category: json['category'] as String,
  status: json['status'] as String,
  createdAt: json['created_at'] as String,
  updatedAt: json['updated_at'] as String,
  lastMessage: json['last_message'] as String?,
  attachments: (json['attachments'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$HelpTicketToJson(_HelpTicket instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'category': instance.category,
      'status': instance.status,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'last_message': instance.lastMessage,
      'attachments': instance.attachments,
    };

_FaqItem _$FaqItemFromJson(Map<String, dynamic> json) => _FaqItem(
  id: json['id'] as String,
  question: json['question'] as String,
  answer: json['answer'] as String,
  category: json['category'] as String,
);

Map<String, dynamic> _$FaqItemToJson(_FaqItem instance) => <String, dynamic>{
  'id': instance.id,
  'question': instance.question,
  'answer': instance.answer,
  'category': instance.category,
};

_HelpCenterStats _$HelpCenterStatsFromJson(Map<String, dynamic> json) =>
    _HelpCenterStats(
      openCount: (json['open_count'] as num).toInt(),
      resolvedCount: (json['resolved_count'] as num).toInt(),
      totalCount: (json['total_count'] as num).toInt(),
    );

Map<String, dynamic> _$HelpCenterStatsToJson(_HelpCenterStats instance) =>
    <String, dynamic>{
      'open_count': instance.openCount,
      'resolved_count': instance.resolvedCount,
      'total_count': instance.totalCount,
    };
