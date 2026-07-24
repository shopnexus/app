// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dispute_api_service.dart';

// dart format off

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter,avoid_unused_constructor_parameters,unreachable_from_main

class _DisputeApiService implements DisputeApiService {
  _DisputeApiService(this._dio, {this.baseUrl, this.errorLogger}) {
    baseUrl ??= 'https://shopnexus.hopto.org/api/v1/';
  }

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<DataResponse<RefundModel>> createBuyerRefund(
    BuyerRefundRequest request,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = request;
    final _options = _setStreamType<DataResponse<RefundModel>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'order/buyer/refund',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late DataResponse<RefundModel> _value;
    try {
      _value = DataResponse<RefundModel>.fromJson(
        _result.data!,
        (json) => RefundModel.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<DataResponse<RefundModel>> withdrawBuyerRefund(String refundId) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<DataResponse<RefundModel>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'order/refunds/${refundId}/withdraw',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late DataResponse<RefundModel> _value;
    try {
      _value = DataResponse<RefundModel>.fromJson(
        _result.data!,
        (json) => RefundModel.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<DataResponse<RefundModel>> sellerApproveRefund(String refundId) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<DataResponse<RefundModel>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'order/refunds/${refundId}/approve',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late DataResponse<RefundModel> _value;
    try {
      _value = DataResponse<RefundModel>.fromJson(
        _result.data!,
        (json) => RefundModel.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<DataResponse<RefundDisputeModel>> sellerDisputeRefund(
    String refundId,
    SellerDisputeRequest request,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = request;
    final _options = _setStreamType<DataResponse<RefundDisputeModel>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'order/refunds/${refundId}/dispute',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late DataResponse<RefundDisputeModel> _value;
    try {
      _value = DataResponse<RefundDisputeModel>.fromJson(
        _result.data!,
        (json) => RefundDisputeModel.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<DataResponse<List<RefundModel>>> getSellerRefunds(
    int? page,
    int? limit,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'page': page, r'limit': limit};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<DataResponse<List<RefundModel>>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'order/seller/refund',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late DataResponse<List<RefundModel>> _value;
    try {
      _value = DataResponse<List<RefundModel>>.fromJson(
        _result.data!,
        (json) => json is List<dynamic>
            ? json
                  .map<RefundModel>(
                    (i) => RefundModel.fromJson(i as Map<String, dynamic>),
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
  Future<DataResponse<List<RefundDisputeModel>>> getDisputesByRefund(
    String refundId,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<DataResponse<List<RefundDisputeModel>>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'order/refunds/${refundId}/disputes',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late DataResponse<List<RefundDisputeModel>> _value;
    try {
      _value = DataResponse<List<RefundDisputeModel>>.fromJson(
        _result.data!,
        (json) => json is List<dynamic>
            ? json
                  .map<RefundDisputeModel>(
                    (i) =>
                        RefundDisputeModel.fromJson(i as Map<String, dynamic>),
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
  Future<DataResponse<List<RefundDisputeModel>>> getAdminDisputes(
    int? page,
    int? limit,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'page': page, r'limit': limit};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<DataResponse<List<RefundDisputeModel>>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'order/disputes',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late DataResponse<List<RefundDisputeModel>> _value;
    try {
      _value = DataResponse<List<RefundDisputeModel>>.fromJson(
        _result.data!,
        (json) => json is List<dynamic>
            ? json
                  .map<RefundDisputeModel>(
                    (i) =>
                        RefundDisputeModel.fromJson(i as Map<String, dynamic>),
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
  Future<DataResponse<RefundDisputeModel>> getAdminDisputeDetail(
    String disputeId,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<DataResponse<RefundDisputeModel>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'order/disputes/${disputeId}',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late DataResponse<RefundDisputeModel> _value;
    try {
      _value = DataResponse<RefundDisputeModel>.fromJson(
        _result.data!,
        (json) => RefundDisputeModel.fromJson(json as Map<String, dynamic>),
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

@ProviderFor(disputeApiService)
const disputeApiServiceProvider = DisputeApiServiceProvider._();

final class DisputeApiServiceProvider
    extends
        $FunctionalProvider<
          DisputeApiService,
          DisputeApiService,
          DisputeApiService
        >
    with $Provider<DisputeApiService> {
  const DisputeApiServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'disputeApiServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$disputeApiServiceHash();

  @$internal
  @override
  $ProviderElement<DisputeApiService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DisputeApiService create(Ref ref) {
    return disputeApiService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DisputeApiService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DisputeApiService>(value),
    );
  }
}

String _$disputeApiServiceHash() => r'ed9c5cd87fdc763f01460221885cde985f2a3c34';
