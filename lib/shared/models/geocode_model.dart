import 'package:freezed_annotation/freezed_annotation.dart';

part 'geocode_model.freezed.dart';

part 'geocode_model.g.dart';

@freezed
abstract class GeocodeLatLng with _$GeocodeLatLng {
  const factory GeocodeLatLng({
    required double latitude,
    required double longitude,
  }) = _GeocodeLatLng;

  factory GeocodeLatLng.fromJson(Map<String, dynamic> json) =>
      _$GeocodeLatLngFromJson(json);
}

@freezed
abstract class GeocodeSuggestion with _$GeocodeSuggestion {
  const factory GeocodeSuggestion({
    @JsonKey(name: 'display_name') required String displayName,
    required double latitude,
    required double longitude,
  }) = _GeocodeSuggestion;

  factory GeocodeSuggestion.fromJson(Map<String, dynamic> json) =>
      _$GeocodeSuggestionFromJson(json);
}

@freezed
abstract class ForwardGeocodeRequest with _$ForwardGeocodeRequest {
  const factory ForwardGeocodeRequest({required String address}) =
      _ForwardGeocodeRequest;

  factory ForwardGeocodeRequest.fromJson(Map<String, dynamic> json) =>
      _$ForwardGeocodeRequestFromJson(json);
}

@freezed
abstract class ReverseGeocodeRequest with _$ReverseGeocodeRequest {
  const factory ReverseGeocodeRequest({
    required double latitude,
    required double longitude,
  }) = _ReverseGeocodeRequest;

  factory ReverseGeocodeRequest.fromJson(Map<String, dynamic> json) =>
      _$ReverseGeocodeRequestFromJson(json);
}

@freezed
abstract class FileUploadResponse with _$FileUploadResponse {
  const factory FileUploadResponse({
    @JsonKey(name: 'rs_id') required String rsId,
    required String url,
    @JsonKey(name: 'mime_type') required String mimeType,
  }) = _FileUploadResponse;

  factory FileUploadResponse.fromJson(Map<String, dynamic> json) =>
      _$FileUploadResponseFromJson(json);
}
