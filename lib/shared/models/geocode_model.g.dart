// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geocode_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GeocodeLatLng _$GeocodeLatLngFromJson(Map<String, dynamic> json) =>
    _GeocodeLatLng(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$GeocodeLatLngToJson(_GeocodeLatLng instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

_GeocodeSuggestion _$GeocodeSuggestionFromJson(Map<String, dynamic> json) =>
    _GeocodeSuggestion(
      displayName: json['display_name'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$GeocodeSuggestionToJson(_GeocodeSuggestion instance) =>
    <String, dynamic>{
      'display_name': instance.displayName,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

_ForwardGeocodeRequest _$ForwardGeocodeRequestFromJson(
  Map<String, dynamic> json,
) => _ForwardGeocodeRequest(address: json['address'] as String);

Map<String, dynamic> _$ForwardGeocodeRequestToJson(
  _ForwardGeocodeRequest instance,
) => <String, dynamic>{'address': instance.address};

_ReverseGeocodeRequest _$ReverseGeocodeRequestFromJson(
  Map<String, dynamic> json,
) => _ReverseGeocodeRequest(
  latitude: (json['latitude'] as num).toDouble(),
  longitude: (json['longitude'] as num).toDouble(),
);

Map<String, dynamic> _$ReverseGeocodeRequestToJson(
  _ReverseGeocodeRequest instance,
) => <String, dynamic>{
  'latitude': instance.latitude,
  'longitude': instance.longitude,
};

_FileUploadResponse _$FileUploadResponseFromJson(Map<String, dynamic> json) =>
    _FileUploadResponse(
      rsId: json['rs_id'] as String,
      url: json['url'] as String,
      mimeType: json['mime_type'] as String,
    );

Map<String, dynamic> _$FileUploadResponseToJson(_FileUploadResponse instance) =>
    <String, dynamic>{
      'rs_id': instance.rsId,
      'url': instance.url,
      'mime_type': instance.mimeType,
    };
