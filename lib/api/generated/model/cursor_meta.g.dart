// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cursor_meta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CursorMeta _$CursorMetaFromJson(Map<String, dynamic> json) =>
    $checkedCreate('CursorMeta', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['next_cursor']);
      final val = CursorMeta(
        nextCursor: $checkedConvert('next_cursor', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {'nextCursor': 'next_cursor'});

Map<String, dynamic> _$CursorMetaToJson(CursorMeta instance) =>
    <String, dynamic>{'next_cursor': instance.nextCursor};
