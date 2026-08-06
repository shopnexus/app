//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/option.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'option_list.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class OptionList {
  /// Returns a new [OptionList] instance.
  OptionList({required this.options, required this.providers});

  @JsonKey(name: r'options', required: true, includeIfNull: false)
  final List<Option> options;

  /// Staff only. What a row's `provider` may be set to in this deployment, so a switch is a choice from a list rather than a guess.
  @JsonKey(name: r'providers', required: true, includeIfNull: false)
  final List<String> providers;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OptionList &&
          other.options == options &&
          other.providers == providers;

  @override
  int get hashCode => options.hashCode + providers.hashCode;

  factory OptionList.fromJson(Map<String, dynamic> json) =>
      _$OptionListFromJson(json);

  Map<String, dynamic> toJson() => _$OptionListToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
