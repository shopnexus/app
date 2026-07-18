// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_api_service.dart';

// dart format off

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter,avoid_unused_constructor_parameters,unreachable_from_main

class _CommonApiService implements CommonApiService {
  _CommonApiService(this._dio, {this.baseUrl, this.errorLogger}) {
    baseUrl ??= 'https://shopnexus.hopto.org/api/v1/';
  }

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<DataResponse<ExchangeRatesResponse>> getExchangeRates() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<DataResponse<ExchangeRatesResponse>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'common/currencies/rates',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late DataResponse<ExchangeRatesResponse> _value;
    try {
      _value = DataResponse<ExchangeRatesResponse>.fromJson(
        _result.data!,
        (json) => ExchangeRatesResponse.fromJson(json as Map<String, dynamic>),
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

@ProviderFor(commonApiService)
const commonApiServiceProvider = CommonApiServiceProvider._();

final class CommonApiServiceProvider
    extends
        $FunctionalProvider<
          CommonApiService,
          CommonApiService,
          CommonApiService
        >
    with $Provider<CommonApiService> {
  const CommonApiServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'commonApiServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$commonApiServiceHash();

  @$internal
  @override
  $ProviderElement<CommonApiService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  CommonApiService create(Ref ref) {
    return commonApiService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CommonApiService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CommonApiService>(value),
    );
  }
}

String _$commonApiServiceHash() => r'e31771ef89115d9c5a4c0fbed7cad8dde7e1231d';
