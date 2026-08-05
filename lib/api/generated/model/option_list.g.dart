// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'option_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OptionList _$OptionListFromJson(Map<String, dynamic> json) =>
    $checkedCreate('OptionList', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['options']);
      final val = OptionList(
        options: $checkedConvert(
          'options',
          (v) => (v as List<dynamic>)
              .map((e) => Option.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        providers: $checkedConvert(
          'providers',
          (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$OptionListToJson(OptionList instance) =>
    <String, dynamic>{
      'options': instance.options.map((e) => e.toJson()).toList(),
      'providers': ?instance.providers,
    };
