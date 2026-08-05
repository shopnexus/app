import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:shopnexus_flutter_app/core/network/api_interceptors.dart';
import 'package:shopnexus_flutter_app/core/storage/hive_storage.dart';
import 'package:shopnexus_flutter_app/features/auth/presentation/providers/auth_provider.dart';

/// A screen fires several requests at once, so the ordinary 15-minute access
/// token expiry produces several 401s together. One refresh has to serve them
/// all — the refresh token is rotated on every exchange, so a second exchange
/// presents a token the server has retired — and only a *failed* refresh may end
/// the session.
void main() {
  late Directory hiveDir;
  late HiveService hiveService;
  late ProviderContainer container;

  setUp(() async {
    hiveDir = await Directory.systemTemp.createTemp('auth_interceptor_test');
    Hive.init(hiveDir.path);
    hiveService = HiveService();
    await hiveService.initBoxes();
    await hiveService.authBox.put('token', 'expired-access');
    await hiveService.authBox.put('refresh_token', 'stored-refresh');

    container = ProviderContainer.test(
      overrides: [hiveServiceProvider.overrideWithValue(hiveService)],
    );
  });

  tearDown(() async {
    await Hive.deleteFromDisk();
    await Hive.close();
    await hiveDir.delete(recursive: true);
  });

  /// The app's Dio plus the interceptor under test, wired through a real `Ref`.
  ({Dio dio, _FakeAdapter refresh}) harness({
    required Future<ResponseBody> Function(RequestOptions) refreshResponder,
  }) {
    final dio = Dio(BaseOptions(baseUrl: 'http://test.local/api/v1/'));
    dio.httpClientAdapter = _FakeAdapter((options) async {
      // Only the token the refresh handed out is accepted.
      return options.headers['Authorization'] == 'Bearer fresh-access'
          ? _json(200, {'data': options.path})
          : _json(401, {
              'error': {'code': 'unauthorized', 'message': 'expired'},
            });
    });

    final refreshAdapter = _FakeAdapter(refreshResponder);
    final refreshClient = Dio(BaseOptions(baseUrl: 'http://test.local/api/v1/'))
      ..httpClientAdapter = refreshAdapter;

    final interceptor = container.read(
      Provider(
        (ref) => AuthInterceptor(ref, dio, refreshClient: refreshClient),
      ),
    );
    dio.interceptors.add(interceptor);
    return (dio: dio, refresh: refreshAdapter);
  }

  test('two concurrent 401s share one refresh and both retry', () async {
    final h = harness(
      refreshResponder: (_) async => _json(200, {
        'data': {
          'access_token': 'fresh-access',
          'refresh_token': 'rotated-refresh',
        },
      }),
    );

    final responses = await Future.wait([
      h.dio.get('/cart-items'),
      h.dio.get('/notifications'),
    ]);

    expect(responses.map((r) => r.statusCode), everyElement(200));
    expect(responses.map((r) => r.data['data']), [
      '/cart-items',
      '/notifications',
    ]);
    expect(h.refresh.calls, 1, reason: 'the rotated token allows one exchange');

    // The session survived and now holds the rotated pair.
    expect(hiveService.authBox.get('token'), 'fresh-access');
    expect(hiveService.authBox.get('refresh_token'), 'rotated-refresh');
    expect(
      container.read(authProvider),
      const AuthState.authenticated(
        accessToken: 'fresh-access',
        refreshToken: 'rotated-refresh',
      ),
    );
  });

  test('a failed refresh ends the session, and only once', () async {
    final h = harness(
      refreshResponder: (_) async => _json(401, {
        'error': {'code': 'invalid_token', 'message': 'revoked'},
      }),
    );

    await expectLater(
      Future.wait([h.dio.get('/cart-items'), h.dio.get('/notifications')]),
      throwsA(isA<DioException>()),
    );

    expect(h.refresh.calls, 1);
    expect(hiveService.authBox.get('token'), isNull);
    expect(hiveService.authBox.get('refresh_token'), isNull);
    expect(container.read(authProvider), const AuthState.unauthenticated());
  });

  test(
    'a 401 with no refresh token ends the session without an exchange',
    () async {
      await hiveService.authBox.delete('refresh_token');
      final h = harness(
        refreshResponder: (_) async => fail('no exchange may be attempted'),
      );

      await expectLater(h.dio.get('/cart-items'), throwsA(isA<DioException>()));

      expect(h.refresh.calls, 0);
      expect(hiveService.authBox.get('token'), isNull);
    },
  );
}

class _FakeAdapter implements HttpClientAdapter {
  _FakeAdapter(this._responder);

  final Future<ResponseBody> Function(RequestOptions) _responder;
  int calls = 0;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) {
    calls++;
    return _responder(options);
  }

  @override
  void close({bool force = false}) {}
}

ResponseBody _json(int status, Map<String, dynamic> body) =>
    ResponseBody.fromString(
      jsonEncode(body),
      status,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );
