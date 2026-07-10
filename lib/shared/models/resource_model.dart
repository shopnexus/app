import 'package:freezed_annotation/freezed_annotation.dart';

part 'resource_model.freezed.dart';

part 'resource_model.g.dart';

@freezed
abstract class ResourceModel with _$ResourceModel {
  const factory ResourceModel({
    required String id,
    required String url,
    required String type, // E.g., 'Image', 'Video'
    String? description,
  }) = _ResourceModel;

  factory ResourceModel.fromJson(Map<String, dynamic> json) =>
      _$ResourceModelFromJson(json);
}
