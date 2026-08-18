//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'dart:async';

// ignore: unused_import
import 'dart:convert';
import 'package:shopnexus_flutter_app/api/generated/deserialize.dart';
import 'package:dio/dio.dart';

import 'package:shopnexus_flutter_app/api/generated/model/admin_listings_id_approval_post200_response.dart';
import 'package:shopnexus_flutter_app/api/generated/model/category_list.dart';
import 'package:shopnexus_flutter_app/api/generated/model/conversations_uploads_id_confirmation_post200_response.dart';
import 'package:shopnexus_flutter_app/api/generated/model/conversations_uploads_post201_response.dart';
import 'package:shopnexus_flutter_app/api/generated/model/create_listing_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/create_upload_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/create_variant_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/error.dart';
import 'package:shopnexus_flutter_app/api/generated/model/listing_condition.dart';
import 'package:shopnexus_flutter_app/api/generated/model/listing_page.dart';
import 'package:shopnexus_flutter_app/api/generated/model/listing_status.dart';
import 'package:shopnexus_flutter_app/api/generated/model/listings_suggestions_post200_response.dart';
import 'package:shopnexus_flutter_app/api/generated/model/publish_listing_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/suggest_listing_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/tag_page.dart';
import 'package:shopnexus_flutter_app/api/generated/model/update_listing_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/update_variant_request.dart';

class CatalogApi {
  final Dio _dio;

  const CatalogApi(this._dio);

  /// The category tree, or the categories nearest a set of seeds
  /// Flat list with a parent reference on each row; a client assembles the tree. A category tree is small so this is unpaginated.  &#x60;near&#x60; answers a different question: which categories does this thing belong in. It ranks by cosine distance over &#x60;category_embedding&#x60; and returns a shortlist with a &#x60;score&#x60; instead of the tree, which is what the category field of the listing form needs — a seller who has picked a few tags should not have to walk a tree to find where the item goes.
  ///
  /// Parameters:
  /// * [near] - Rank by closeness to these seeds instead of returning the tree.
  /// * [limit] - Only honoured with `near`; the whole tree is never truncated.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [CategoryList] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<CategoryList>> categoriesGet({
    List<String>? near,
    int? limit = 10,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/categories';
    final _options = Options(
      method: r'GET',
      headers: <String, dynamic>{...?headers},
      extra: <String, dynamic>{'secure': <Map<String, String>>[], ...?extra},
      validateStatus: validateStatus,
    );

    final _queryParameters = <String, dynamic>{
      if (near != null) r'near': near,
      if (limit != null) r'limit': limit,
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    CategoryList? _responseData;

    try {
      final rawData = _response.data;
      _responseData = rawData == null
          ? null
          : deserialize<CategoryList, CategoryList>(
              rawData,
              'CategoryList',
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

    return Response<CategoryList>(
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

  /// Unsave a listing
  /// Idempotent, and deliberately so all the way: unsaving something that was never saved answers 204, and so does a &#x60;listingID&#x60; that names no listing at all. The post-condition — this listing is not on the caller&#39;s wishlist — holds either way, and a 404 here would only tell a stranger which ids exist.
  ///
  /// Parameters:
  /// * [listingID]
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future]
  /// Throws [DioException] if API call or serialization fails
  Future<Response<void>> favoritesListingIDDelete({
    required String listingID,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/favorites/{listingID}'.replaceAll(
      '{'
      r'listingID'
      '}',
      listingID.toString(),
    );
    final _options = Options(
      method: r'DELETE',
      headers: <String, dynamic>{...?headers},
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[
          {'type': 'http', 'scheme': 'bearer', 'name': 'bearerAuth'},
        ],
        ...?extra,
      },
      validateStatus: validateStatus,
    );

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    return _response;
  }

  /// Save a listing
  /// Idempotent — the account and listing pair is the whole row, so saving twice is the same as saving once. Read the wishlist back through &#x60;GET /listings?favorited&#x3D;true&#x60;.
  ///
  /// Parameters:
  /// * [listingID]
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future]
  /// Throws [DioException] if API call or serialization fails
  Future<Response<void>> favoritesListingIDPut({
    required String listingID,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/favorites/{listingID}'.replaceAll(
      '{'
      r'listingID'
      '}',
      listingID.toString(),
    );
    final _options = Options(
      method: r'PUT',
      headers: <String, dynamic>{...?headers},
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[
          {'type': 'http', 'scheme': 'bearer', 'name': 'bearerAuth'},
        ],
        ...?extra,
      },
      validateStatus: validateStatus,
    );

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    return _response;
  }

  /// Browse, search and resolve listings
  /// With no parameters, the newest live active listings. The parameters narrow that one query rather than selecting between separate endpoints.  &#x60;q&#x60; makes it a search and moves the default sort to &#x60;relevance&#x60;. &#x60;lexical&#x60; matches the name by trigram and tolerates missing diacritics, &#x60;semantic&#x60; runs an approximate nearest-neighbour search over the dense embedding, and &#x60;hybrid&#x60; combines the dense vector with the sparse lexical one, which is what the embedding model is built for. Each hit then carries &#x60;score&#x60;, always so that higher is better. A listing whose embedding has not been computed yet can only be found lexically.  &#x60;sort&#x3D;recommended&#x60; is the personalised feed. A buyer is credited with up to four interests at once, derived from what they saved and refreshed as they save more; each one searches the catalogue on its own, a further share of the page goes to whatever was posted most recently, and the results are merged in proportion to how much of that buyer&#39;s behaviour each source accounts for. So an occasional taste still reaches the page instead of being crowded out by the dominant one, and something outside every one of them still gets in — a feed that only ever answers its own past has no way to learn it was wrong. The page is *drawn* from a pool several pages deep rather than taken off the top, so two runs differ; &#x60;seed&#x60; is what holds one run still while it is paged through. Their own listings and anything already on their wishlist are left out. It needs a token, and falls back to newest for an account with no interests computed yet.  &#x60;score&#x60; is the similarity to the interest that surfaced a card, and is &#x60;null&#x60; for one drawn for being new — nothing measured it against anything.  &#x60;mine&#x3D;true&#x60; restricts the result to the caller&#39;s own listings, and is the only case in which &#x60;status&#x60; is honoured — a seller has to see what is not public, and nobody else may.  &#x60;favorited&#x3D;true&#x60; is the wishlist page. It is a filter here rather than its own endpoint because a wishlist wants exactly what a feed wants — cards, with prices and stock and every filter available — and a separate endpoint returning saved ids left the client resolving them one by one.  &#x60;ids&#x60; resolves a known set, which is how a cart or an order list renders the listings behind its rows. It ignores every other filter and answers for hidden and soft-deleted listings too, because an order that references one still has to display it; &#x60;deleted_at&#x60; says which. Listings that were never public (&#x60;draft&#x60;, &#x60;pending&#x60;) stay out unless they are the caller&#39;s own.  Location is a C2C buyer&#39;s first filter — collecting in person, or just trusting a seller two districts away over one across the country. It is the seller&#39;s pickup address as the listing snapshotted it when they published, so it is the same address a carrier collects from, and it never moves under a listing that has already sold. &#x60;province_code&#x60;/&#x60;district_code&#x60;/ &#x60;ward_code&#x60; filter on it; &#x60;lat&#x60;+&#x60;lon&#x60; or &#x60;near_contact_id&#x60; measure from where the buyer is, &#x60;radius_km&#x60; bounds the result and &#x60;sort&#x3D;distance&#x60; orders by it.  &#x60;price-asc&#x60; and &#x60;price-desc&#x60; are answered through the SKU price index rather than a value cached on the listing, so &#x60;price&#x60; is the cheapest matching variant&#39;s. &#x60;best-selling&#x60; is the one that cannot work that way — it orders by a sum over the variants, and a sum has no per-SKU index to scan in order — so it reads &#x60;cached_sold&#x60; on the listing, maintained with the sales it counts.
  ///
  /// Parameters:
  /// * [ids] - Resolve exactly these listings, ignoring the other filters.
  /// * [q] - Free-text query. Turns the request into a search.
  /// * [mode] - Search mode. Ignored without a query.
  /// * [mine] - The caller's own listings, in every state.
  /// * [favorited] - The caller's wishlist. This is the wishlist page.
  /// * [status] - Only honoured together with mine=true.
  /// * [categoryId]
  /// * [tag]
  /// * [sellerId]
  /// * [condition]
  /// * [minPrice]
  /// * [maxPrice]
  /// * [provinceCode] - Where to look, matched against the listing's own snapshot of the seller's pickup address. Send the narrowest level you mean — a ward is already inside its province.
  /// * [districtCode]
  /// * [wardCode]
  /// * [lat] - Where the buyer is, for a \"near me\" browse — from the device, and always together with `lon`. With a position every card carries `location.distance_km`.
  /// * [lon]
  /// * [nearContactId] - One of the caller's own saved addresses, as an alternative to `lat`/`lon` — the usual case, since a buyer's address is already on file. 422 if it was never geocoded.
  /// * [radiusKm] - Bound the result to a circle around that position. Without it a position still ranks and reports distance, it just does not exclude anything.
  /// * [sort] - Defaults to `relevance` when a query is given and `newest` otherwise. `distance` needs a position, like `radius_km` does.
  /// * [seed] - Which shuffle of a personalised feed this is; read only by `sort=recommended`, ignored everywhere else. That feed is drawn from a pool several pages deep rather than taken off the top of it, so the ordering is a function of this value: send one seed for a whole run of pages, or the second page will be drawn from a different feed than the first and repeat cards it has already shown. Send a new one to get a new feed. Any string does — it is hashed, never interpreted. Left out, the server rotates it every fifteen minutes.
  /// * [page] - 1-based page number.
  /// * [limit]
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [ListingPage] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<ListingPage>> listingsGet({
    List<String>? ids,
    String? q,
    String? mode = 'hybrid',
    bool? mine = false,
    bool? favorited = false,
    ListingStatus? status,
    String? categoryId,
    String? tag,
    String? sellerId,
    ListingCondition? condition,
    int? minPrice,
    int? maxPrice,
    String? provinceCode,
    String? districtCode,
    String? wardCode,
    double? lat,
    double? lon,
    String? nearContactId,
    double? radiusKm,
    String? sort,
    String? seed,
    int? page = 1,
    int? limit = 20,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/listings';
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

    final _queryParameters = <String, dynamic>{
      if (ids != null) r'ids': ids,
      if (q != null) r'q': q,
      if (mode != null) r'mode': mode,
      if (mine != null) r'mine': mine,
      if (favorited != null) r'favorited': favorited,
      if (status != null) r'status': status,
      if (categoryId != null) r'category_id': categoryId,
      if (tag != null) r'tag': tag,
      if (sellerId != null) r'seller_id': sellerId,
      if (condition != null) r'condition': condition,
      if (minPrice != null) r'min_price': minPrice,
      if (maxPrice != null) r'max_price': maxPrice,
      if (provinceCode != null) r'province_code': provinceCode,
      if (districtCode != null) r'district_code': districtCode,
      if (wardCode != null) r'ward_code': wardCode,
      if (lat != null) r'lat': lat,
      if (lon != null) r'lon': lon,
      if (nearContactId != null) r'near_contact_id': nearContactId,
      if (radiusKm != null) r'radius_km': radiusKm,
      if (sort != null) r'sort': sort,
      if (seed != null) r'seed': seed,
      if (page != null) r'page': page,
      if (limit != null) r'limit': limit,
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    ListingPage? _responseData;

    try {
      final rawData = _response.data;
      _responseData = rawData == null
          ? null
          : deserialize<ListingPage, ListingPage>(
              rawData,
              'ListingPage',
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

    return Response<ListingPage>(
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

  /// Delete a listing
  /// Soft delete, and distinct from hiding it. Order history holds the listing and variant ids without a foreign key, so a past order has to stay resolvable after the seller removes the listing.
  ///
  /// Parameters:
  /// * [id] - The opaque id. A write addresses the listing, never its public slug.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future]
  /// Throws [DioException] if API call or serialization fails
  Future<Response<void>> listingsIdDelete({
    required String id,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/listings/{id}'.replaceAll(
      '{'
      r'id'
      '}',
      id.toString(),
    );
    final _options = Options(
      method: r'DELETE',
      headers: <String, dynamic>{...?headers},
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[
          {'type': 'http', 'scheme': 'bearer', 'name': 'bearerAuth'},
        ],
        ...?extra,
      },
      validateStatus: validateStatus,
    );

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    return _response;
  }

  /// Read a listing
  /// Carries the variants with their prices and stock and the seller summary.  A listing that was never public — &#x60;draft&#x60; or &#x60;pending&#x60; — is readable only by its owner and by staff. One that is &#x60;hidden&#x60; or soft-deleted is readable by anyone, because a cart or an order that references it still has to render; &#x60;status&#x60; and &#x60;deleted_at&#x60; say that it cannot be bought.
  ///
  /// Parameters:
  /// * [id] - The listing's opaque id or the slug a link carries. A slug is lowercase, hyphen-separated and never contains an underscore, so it cannot be mistaken for an id; it resolves without a lookup, because it carries the id on the end.
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [AdminListingsIdApprovalPost200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<AdminListingsIdApprovalPost200Response>> listingsIdGet({
    required String id,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/listings/{id}'.replaceAll(
      '{'
      r'id'
      '}',
      id.toString(),
    );
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

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    AdminListingsIdApprovalPost200Response? _responseData;

    try {
      final rawData = _response.data;
      _responseData = rawData == null
          ? null
          : deserialize<
              AdminListingsIdApprovalPost200Response,
              AdminListingsIdApprovalPost200Response
            >(
              rawData,
              'AdminListingsIdApprovalPost200Response',
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

    return Response<AdminListingsIdApprovalPost200Response>(
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

  /// Edit a listing
  /// An edit to a draft applies immediately. An edit to a live listing that trips the prohibited-goods filter is held as a pending edit and applied only when a moderator approves it, so the version buyers see never changes into unreviewed content.  The slug&#39;s readable half is fixed at creation. Renaming a listing leaves it alone, so a link shared before the rename keeps saying what it said then — and it would resolve either way, since the id it carries is what addresses the listing.
  ///
  /// Parameters:
  /// * [id] - The opaque id. A write addresses the listing, never its public slug.
  /// * [updateListingRequest]
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [AdminListingsIdApprovalPost200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<AdminListingsIdApprovalPost200Response>> listingsIdPatch({
    required String id,
    required UpdateListingRequest updateListingRequest,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/listings/{id}'.replaceAll(
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

    dynamic _bodyData;

    try {
      _bodyData = jsonEncode(updateListingRequest);
    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _options.compose(_dio.options, _path),
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    final _response = await _dio.request<Object>(
      _path,
      data: _bodyData,
      options: _options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    AdminListingsIdApprovalPost200Response? _responseData;

    try {
      final rawData = _response.data;
      _responseData = rawData == null
          ? null
          : deserialize<
              AdminListingsIdApprovalPost200Response,
              AdminListingsIdApprovalPost200Response
            >(
              rawData,
              'AdminListingsIdApprovalPost200Response',
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

    return Response<AdminListingsIdApprovalPost200Response>(
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

  /// Hide a live listing
  /// Takes it out of every feed while leaving it alive — the seller is away, or the item is temporarily out of stock. Not the same as deleting it.
  ///
  /// Parameters:
  /// * [id]
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [AdminListingsIdApprovalPost200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<AdminListingsIdApprovalPost200Response>>
  listingsIdPublicationDelete({
    required String id,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/listings/{id}/publication'.replaceAll(
      '{'
      r'id'
      '}',
      id.toString(),
    );
    final _options = Options(
      method: r'DELETE',
      headers: <String, dynamic>{...?headers},
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[
          {'type': 'http', 'scheme': 'bearer', 'name': 'bearerAuth'},
        ],
        ...?extra,
      },
      validateStatus: validateStatus,
    );

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    AdminListingsIdApprovalPost200Response? _responseData;

    try {
      final rawData = _response.data;
      _responseData = rawData == null
          ? null
          : deserialize<
              AdminListingsIdApprovalPost200Response,
              AdminListingsIdApprovalPost200Response
            >(
              rawData,
              'AdminListingsIdApprovalPost200Response',
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

    return Response<AdminListingsIdApprovalPost200Response>(
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

  /// Submit a listing for publication
  /// Publication always goes through moderation: this queues the listing and it stays invisible until a moderator clears it. There is no path that makes a listing live without a human, which is also why re-publishing something a moderator took down cannot undo the takedown.  An automatic prohibited-goods scan still runs — it orders the queue and flags what to look at first, it does not clear anything.  This is also where the listing gets its location: &#x60;pickup_contact_id&#x60; names which of the seller&#39;s own saved addresses a carrier collects from, and omitting it means their default pickup address. A seller with neither is refused with 422 rather than left with a live listing every checkout fails on — the address is both where a carrier goes and how buyers find the listing, so it is taken now and frozen onto the row.
  ///
  /// Parameters:
  /// * [id]
  /// * [publishListingRequest]
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [AdminListingsIdApprovalPost200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<AdminListingsIdApprovalPost200Response>>
  listingsIdPublicationPost({
    required String id,
    PublishListingRequest? publishListingRequest,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/listings/{id}/publication'.replaceAll(
      '{'
      r'id'
      '}',
      id.toString(),
    );
    final _options = Options(
      method: r'POST',
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

    dynamic _bodyData;

    try {
      _bodyData = jsonEncode(publishListingRequest);
    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _options.compose(_dio.options, _path),
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    final _response = await _dio.request<Object>(
      _path,
      data: _bodyData,
      options: _options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    AdminListingsIdApprovalPost200Response? _responseData;

    try {
      final rawData = _response.data;
      _responseData = rawData == null
          ? null
          : deserialize<
              AdminListingsIdApprovalPost200Response,
              AdminListingsIdApprovalPost200Response
            >(
              rawData,
              'AdminListingsIdApprovalPost200Response',
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

    return Response<AdminListingsIdApprovalPost200Response>(
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

  /// Add a variant to a listing
  /// Answers with the listing. The new variant is the one in &#x60;variants&#x60; that was not there before — there is no separate id in the response, because a variant is not addressable on its own.
  ///
  /// Parameters:
  /// * [id]
  /// * [createVariantRequest]
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [AdminListingsIdApprovalPost200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<AdminListingsIdApprovalPost200Response>>
  listingsIdVariantsPost({
    required String id,
    required CreateVariantRequest createVariantRequest,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/listings/{id}/variants'.replaceAll(
      '{'
      r'id'
      '}',
      id.toString(),
    );
    final _options = Options(
      method: r'POST',
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

    dynamic _bodyData;

    try {
      _bodyData = jsonEncode(createVariantRequest);
    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _options.compose(_dio.options, _path),
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    final _response = await _dio.request<Object>(
      _path,
      data: _bodyData,
      options: _options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    AdminListingsIdApprovalPost200Response? _responseData;

    try {
      final rawData = _response.data;
      _responseData = rawData == null
          ? null
          : deserialize<
              AdminListingsIdApprovalPost200Response,
              AdminListingsIdApprovalPost200Response
            >(
              rawData,
              'AdminListingsIdApprovalPost200Response',
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

    return Response<AdminListingsIdApprovalPost200Response>(
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

  /// Create a listing
  /// Creates the listing and its variants together. At least one variant is required because price and shipping weight live there.  Starts as a draft and is not public until published.
  ///
  /// Parameters:
  /// * [createListingRequest]
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [AdminListingsIdApprovalPost200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<AdminListingsIdApprovalPost200Response>> listingsPost({
    required CreateListingRequest createListingRequest,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/listings';
    final _options = Options(
      method: r'POST',
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

    dynamic _bodyData;

    try {
      _bodyData = jsonEncode(createListingRequest);
    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _options.compose(_dio.options, _path),
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    final _response = await _dio.request<Object>(
      _path,
      data: _bodyData,
      options: _options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    AdminListingsIdApprovalPost200Response? _responseData;

    try {
      final rawData = _response.data;
      _responseData = rawData == null
          ? null
          : deserialize<
              AdminListingsIdApprovalPost200Response,
              AdminListingsIdApprovalPost200Response
            >(
              rawData,
              'AdminListingsIdApprovalPost200Response',
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

    return Response<AdminListingsIdApprovalPost200Response>(
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

  /// Fill in a listing from photos and what the seller said
  /// \&quot;Photo in, listing out\&quot;: the seller snaps the item, says a sentence about it, and gets a filled-in form back. One synchronous call — the client shows the form as a skeleton and fills it from the answer.  Nothing is stored. This route writes no listing and no draft: the answer is a *suggestion*, the seller corrects what they disagree with, and &#x60;POST /listings&#x60; is still how a listing comes into existence. That is deliberate — a route that posted for them would make a model the author of claims about somebody else&#39;s goods, its condition and its price, and there is no version of that a marketplace can stand behind. An abandoned attempt leaves nothing behind either.  Send at least one of &#x60;attachments&#x60;, &#x60;note&#x60; or &#x60;voice_note&#x60;. Photos are ordinary confirmed uploads (&#x60;POST /listings/uploads&#x60;), so the client can be uploading them while the seller is still talking; the first three are what the model reads. The voice note travels inline rather than as an upload because it is input and not content — nothing keeps it. Every field of the answer is optional except &#x60;name&#x60;: one the model could not stand behind comes back empty, and a blank box the seller fills beats a wrong value they have to notice. &#x60;price&#x60; is only ever a number the seller said out loud, never an estimate.
  ///
  /// Parameters:
  /// * [suggestListingRequest]
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [ListingsSuggestionsPost200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<ListingsSuggestionsPost200Response>> listingsSuggestionsPost({
    required SuggestListingRequest suggestListingRequest,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/listings/suggestions';
    final _options = Options(
      method: r'POST',
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

    dynamic _bodyData;

    try {
      _bodyData = jsonEncode(suggestListingRequest);
    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _options.compose(_dio.options, _path),
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    final _response = await _dio.request<Object>(
      _path,
      data: _bodyData,
      options: _options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    ListingsSuggestionsPost200Response? _responseData;

    try {
      final rawData = _response.data;
      _responseData = rawData == null
          ? null
          : deserialize<
              ListingsSuggestionsPost200Response,
              ListingsSuggestionsPost200Response
            >(rawData, 'ListingsSuggestionsPost200Response', growable: true);
    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<ListingsSuggestionsPost200Response>(
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

  /// Confirm the bytes are at the store
  /// Until this lands the resource resolves to nothing, so a half-finished upload cannot be attached to a listing. The recorded size is the store&#39;s, not the one declared when the slot was reserved. The answer carries a signed &#x60;url&#x60; for the bytes just uploaded. That is the only time it is handed over unasked: a second confirmation is refused, and the resource is otherwise only seen through whatever it gets attached to.
  ///
  /// Parameters:
  /// * [id]
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [ConversationsUploadsIdConfirmationPost200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<ConversationsUploadsIdConfirmationPost200Response>>
  listingsUploadsIdConfirmationPost({
    required String id,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/listings/uploads/{id}/confirmation'.replaceAll(
      '{'
      r'id'
      '}',
      id.toString(),
    );
    final _options = Options(
      method: r'POST',
      headers: <String, dynamic>{...?headers},
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[
          {'type': 'http', 'scheme': 'bearer', 'name': 'bearerAuth'},
        ],
        ...?extra,
      },
      validateStatus: validateStatus,
    );

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    ConversationsUploadsIdConfirmationPost200Response? _responseData;

    try {
      final rawData = _response.data;
      _responseData = rawData == null
          ? null
          : deserialize<
              ConversationsUploadsIdConfirmationPost200Response,
              ConversationsUploadsIdConfirmationPost200Response
            >(
              rawData,
              'ConversationsUploadsIdConfirmationPost200Response',
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

    return Response<ConversationsUploadsIdConfirmationPost200Response>(
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

  /// Reserve a slot to upload a listing photo into
  /// The bytes never pass through this API. The answer is a short-lived signed URL to PUT to, and &#x60;POST /listings/uploads/{id}/confirmation&#x60; makes the row real once the object is there — so a listing can never render a photo whose bytes never arrived.  &#x60;mime&#x60; and &#x60;size&#x60; are checked before a byte moves: a slot signed for anything is a slot for anything.
  ///
  /// Parameters:
  /// * [createUploadRequest]
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [ConversationsUploadsPost201Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<ConversationsUploadsPost201Response>> listingsUploadsPost({
    required CreateUploadRequest createUploadRequest,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/listings/uploads';
    final _options = Options(
      method: r'POST',
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

    dynamic _bodyData;

    try {
      _bodyData = jsonEncode(createUploadRequest);
    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _options.compose(_dio.options, _path),
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    final _response = await _dio.request<Object>(
      _path,
      data: _bodyData,
      options: _options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    ConversationsUploadsPost201Response? _responseData;

    try {
      final rawData = _response.data;
      _responseData = rawData == null
          ? null
          : deserialize<
              ConversationsUploadsPost201Response,
              ConversationsUploadsPost201Response
            >(rawData, 'ConversationsUploadsPost201Response', growable: true);
    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<ConversationsUploadsPost201Response>(
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

  /// The tag dictionary
  /// A tag id is its slug and a natural key, so it is readable on the wire rather than encoded.  Paginated, unlike the category tree: categories are a curated tree that stays small, while tags grow with the catalog. &#x60;q&#x60; is a prefix match on the slug, which is what the tag picker types into.  &#x60;near&#x60; is the other half of that picker: it ranks the dictionary by cosine distance over &#x60;tag_embedding&#x60; and returns a &#x60;score&#x60;, so picking &#x60;handmade&#x60; offers back the tags that sit next to it in the vector space. The seeds themselves are never in the result — they are already on the listing — and a tag the embedding cron has not reached yet cannot be suggested at all, because &#x60;tag&#x60; carries no text index to fall back to.  &#x60;q&#x60; and &#x60;near&#x60; are mutually exclusive: one filters the dictionary by what was typed, the other reorders it by meaning, and combining them would rank a set the prefix already decided.
  ///
  /// Parameters:
  /// * [q] - Prefix match on the slug.
  /// * [near] - Rank by closeness to these seeds. Excludes the seeds.
  /// * [page] - 1-based page number.
  /// * [limit]
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [TagPage] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<TagPage>> tagsGet({
    String? q,
    List<String>? near,
    int? page = 1,
    int? limit = 20,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/tags';
    final _options = Options(
      method: r'GET',
      headers: <String, dynamic>{...?headers},
      extra: <String, dynamic>{'secure': <Map<String, String>>[], ...?extra},
      validateStatus: validateStatus,
    );

    final _queryParameters = <String, dynamic>{
      if (q != null) r'q': q,
      if (near != null) r'near': near,
      if (page != null) r'page': page,
      if (limit != null) r'limit': limit,
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    TagPage? _responseData;

    try {
      final rawData = _response.data;
      _responseData = rawData == null
          ? null
          : deserialize<TagPage, TagPage>(rawData, 'TagPage', growable: true);
    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<TagPage>(
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

  /// Delete a variant
  /// Soft delete for the same reason as a listing. Refused for the last remaining variant of a live listing.  Answers with the listing rather than an empty body: deleting the featured variant moves the flag to a surviving one, and the seller has to see which.
  ///
  /// Parameters:
  /// * [id]
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [AdminListingsIdApprovalPost200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<AdminListingsIdApprovalPost200Response>> variantsIdDelete({
    required String id,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/variants/{id}'.replaceAll(
      '{'
      r'id'
      '}',
      id.toString(),
    );
    final _options = Options(
      method: r'DELETE',
      headers: <String, dynamic>{...?headers},
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[
          {'type': 'http', 'scheme': 'bearer', 'name': 'bearerAuth'},
        ],
        ...?extra,
      },
      validateStatus: validateStatus,
    );

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    AdminListingsIdApprovalPost200Response? _responseData;

    try {
      final rawData = _response.data;
      _responseData = rawData == null
          ? null
          : deserialize<
              AdminListingsIdApprovalPost200Response,
              AdminListingsIdApprovalPost200Response
            >(
              rawData,
              'AdminListingsIdApprovalPost200Response',
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

    return Response<AdminListingsIdApprovalPost200Response>(
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

  /// Edit a variant
  /// A price change does not reach a buyer who already opened a purchase session: that session froze the terms it was opened with.  &#x60;quantity&#x60; sets the total on hand. Neither &#x60;reserved&#x60; nor &#x60;sold&#x60; is settable — checkout and cancellation move the first, completing a purchase moves both — and a total below &#x60;reserved + sold&#x60; is refused, because an oversold row must not be representable.
  ///
  /// Parameters:
  /// * [id]
  /// * [updateVariantRequest]
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [AdminListingsIdApprovalPost200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<AdminListingsIdApprovalPost200Response>> variantsIdPatch({
    required String id,
    required UpdateVariantRequest updateVariantRequest,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/variants/{id}'.replaceAll(
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

    dynamic _bodyData;

    try {
      _bodyData = jsonEncode(updateVariantRequest);
    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _options.compose(_dio.options, _path),
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    final _response = await _dio.request<Object>(
      _path,
      data: _bodyData,
      options: _options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    AdminListingsIdApprovalPost200Response? _responseData;

    try {
      final rawData = _response.data;
      _responseData = rawData == null
          ? null
          : deserialize<
              AdminListingsIdApprovalPost200Response,
              AdminListingsIdApprovalPost200Response
            >(
              rawData,
              'AdminListingsIdApprovalPost200Response',
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

    return Response<AdminListingsIdApprovalPost200Response>(
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
