// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kyc_api_service.dart';

// dart format off

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter,avoid_unused_constructor_parameters,unreachable_from_main

class _KycApiService implements KycApiService {
  _KycApiService(this._dio, {this.baseUrl, this.errorLogger}) {
    baseUrl ??= 'https://shopnexus.hopto.org/api/v1/';
  }

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<DataResponse<List<IdentityDocument>>> getMyIdentityDocuments() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<DataResponse<List<IdentityDocument>>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'me/identity-documents',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late DataResponse<List<IdentityDocument>> _value;
    try {
      _value = DataResponse<List<IdentityDocument>>.fromJson(
        _result.data!,
        (json) => json is List<dynamic>
            ? json
                  .map<IdentityDocument>(
                    (i) => IdentityDocument.fromJson(i as Map<String, dynamic>),
                  )
                  .toList()
            : List.empty(),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<DataResponse<IdentityVerificationTicket>> startIdentityVerification(
    StartIdentityVerificationRequest request,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = request;
    final _options = _setStreamType<DataResponse<IdentityVerificationTicket>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'identity-documents',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late DataResponse<IdentityVerificationTicket> _value;
    try {
      _value = DataResponse<IdentityVerificationTicket>.fromJson(
        _result.data!,
        (json) =>
            IdentityVerificationTicket.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<DataResponse<UploadSlot>> createUploadSlot(
    AccountCreateUploadRequest request,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = request;
    final _options = _setStreamType<DataResponse<UploadSlot>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'me/uploads',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late DataResponse<UploadSlot> _value;
    try {
      _value = DataResponse<UploadSlot>.fromJson(
        _result.data!,
        (json) => UploadSlot.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(String dioBaseUrl, String? baseUrl) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}

// dart format on

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(kycApiService)
const kycApiServiceProvider = KycApiServiceProvider._();

final class KycApiServiceProvider
    extends $FunctionalProvider<KycApiService, KycApiService, KycApiService>
    with $Provider<KycApiService> {
  const KycApiServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'kycApiServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$kycApiServiceHash();

  @$internal
  @override
  $ProviderElement<KycApiService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  KycApiService create(Ref ref) {
    return kycApiService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(KycApiService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<KycApiService>(value),
    );
  }
}

String _$kycApiServiceHash() => r'4a556daaeb738c858685b9a5a998e43e5e4b4717';
