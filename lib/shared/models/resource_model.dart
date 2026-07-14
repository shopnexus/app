import 'package:freezed_annotation/freezed_annotation.dart';

part 'resource_model.freezed.dart';

part 'resource_model.g.dart';

@freezed
abstract class ResourceModel with _$ResourceModel {
  const factory ResourceModel({
    required String id,
    required String url,
    @Default('Image') String type, // E.g., 'Image', 'Video'
    String? description,
  }) = _ResourceModel;

  factory ResourceModel.fromJson(Map<String, dynamic> json) =>
      _$ResourceModelFromJson(ResourceModel._preprocessJson(json));

  static Map<String, dynamic> _preprocessJson(Map<String, dynamic> json) {
    final modifiedJson = Map<String, dynamic>.from(json);
    if (modifiedJson['type'] == null && modifiedJson['mime'] != null) {
      final mime = modifiedJson['mime'] as String;
      if (mime.startsWith('video/')) {
        modifiedJson['type'] = 'Video';
      } else {
        modifiedJson['type'] = 'Image';
      }
    }
    return modifiedJson;
  }
}
