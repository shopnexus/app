//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'dart:async';

// ignore: unused_import
import 'dart:convert';
import 'package:shopnexus_flutter_app/api/generated/deserialize.dart';
import 'package:dio/dio.dart';

import 'package:shopnexus_flutter_app/api/generated/model/admin_options_get200_response.dart';
import 'package:shopnexus_flutter_app/api/generated/model/admin_options_id_patch200_response.dart';
import 'package:shopnexus_flutter_app/api/generated/model/error.dart';
import 'package:shopnexus_flutter_app/api/generated/model/option_category_name.dart';
import 'package:shopnexus_flutter_app/api/generated/model/save_option_request.dart';

class CommonApi {
  final Dio _dio;

  const CommonApi(this._dio);

  /// List every row of a category, operator view
  /// Every row including the ones switched off — \&quot;why is this carrier missing from checkout\&quot; being the question this answers — each with the &#x60;provider&#x60; serving it, plus the set of providers this deployment has to move a row to. Admin only.
  ///
  /// Parameters:
  /// * [category] - The kind of pluggable choice.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [AdminOptionsGet200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<AdminOptionsGet200Response>> adminOptionsGet({
    required OptionCategoryName category,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/admin/options';
    final _options = Options(
      method: r'GET',
      headers: <String, dynamic>{...?headers},
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[
          {'type': 'http', 'scheme': 'bearer', 'name': 'bearerAuth'},
        ],
        ...?extra,
      },
      validateStatus: validateStatus,
    );

    final _queryParameters = <String, dynamic>{r'category': category};

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    AdminOptionsGet200Response? _responseData;

    try {
      final rawData = _response.data;
      _responseData = rawData == null
          ? null
          : deserialize<AdminOptionsGet200Response, AdminOptionsGet200Response>(
              rawData,
              'AdminOptionsGet200Response',
              growable: true,
            );
    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<AdminOptionsGet200Response>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }

  /// Switch a row off, rename it, or move it to another provider
  /// Absent fields are left alone. The id, the category and the slug do not change: a settled payment and a shipped parcel hold the slug as plain text, so it is permanent, and moving a row between categories would change what those records mean.  &#x60;provider&#x60; is checked against what this deployment actually has — one nobody registered is 422, because the first person to find out otherwise would be a buyer at a checkout. Switching a row off takes it out of &#x60;/options&#x60; without deleting it, which is what keeps every past order that names it resolvable.
  ///
  /// Parameters:
  /// * [id] - The option slug.
  /// * [category] - The kind of pluggable choice.
  /// * [saveOptionRequest]
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [AdminOptionsIdPatch200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<AdminOptionsIdPatch200Response>> adminOptionsIdPatch({
    required String id,
    required OptionCategoryName category,
    required SaveOptionRequest saveOptionRequest,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/admin/options/{id}'.replaceAll(
      '{'
      r'id'
      '}',
      id.toString(),
    );
    final _options = Options(
      method: r'PATCH',
      headers: <String, dynamic>{...?headers},
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[
          {'type': 'http', 'scheme': 'bearer', 'name': 'bearerAuth'},
        ],
        ...?extra,
      },
      contentType: 'application/json',
      validateStatus: validateStatus,
    );

    final _queryParameters = <String, dynamic>{r'category': category};

    dynamic _bodyData;

    try {
      _bodyData = jsonEncode(saveOptionRequest);
    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _options.compose(
          _dio.options,
          _path,
          queryParameters: _queryParameters,
        ),
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    final _response = await _dio.request<Object>(
      _path,
      data: _bodyData,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    AdminOptionsIdPatch200Response? _responseData;

    try {
      final rawData = _response.data;
      _responseData = rawData == null
          ? null
          : deserialize<
              AdminOptionsIdPatch200Response,
              AdminOptionsIdPatch200Response
            >(rawData, 'AdminOptionsIdPatch200Response', growable: true);
    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<AdminOptionsIdPatch200Response>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }

  /// List what may be chosen in one category
  /// Where a valid &#x60;payment_option&#x60; and &#x60;transport_option&#x60; come from. Operator configuration rather than the caller&#39;s data, so it is unpaginated and identical for everybody — but it is not constant: a row an operator disables leaves this list, and a client that hardcoded a slug gets 422 from the route that consumes it instead.  Only the id, the name and the description are published. Which implementation serves a row, and which rows are switched off, is the operator&#39;s view — see &#x60;/admin/options&#x60;.  A category outside the user-visible set answers 404, exactly as one nobody defined does: telling the two apart would let anyone enumerate the platform&#39;s operator surface.
  ///
  /// Parameters:
  /// * [category] - The kind of pluggable choice.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [AdminOptionsGet200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<AdminOptionsGet200Response>> optionsGet({
    required OptionCategoryName category,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/options';
    final _options = Options(
      method: r'GET',
      headers: <String, dynamic>{...?headers},
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[
          {'type': 'http', 'scheme': 'bearer', 'name': 'bearerAuth'},
        ],
        ...?extra,
      },
      validateStatus: validateStatus,
    );

    final _queryParameters = <String, dynamic>{r'category': category};

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    AdminOptionsGet200Response? _responseData;

    try {
      final rawData = _response.data;
      _responseData = rawData == null
          ? null
          : deserialize<AdminOptionsGet200Response, AdminOptionsGet200Response>(
              rawData,
              'AdminOptionsGet200Response',
              growable: true,
            );
    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<AdminOptionsGet200Response>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }
}
