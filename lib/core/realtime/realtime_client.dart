import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../api/api_providers.dart';
import '../../api/generated/api/account_api.dart';
import '../../features/auth/presentation/providers/auth_provider.dart';
import '../constants/api_endpoints.dart';
import 'realtime_event.dart';

part 'realtime_client.g.dart';

/// The one socket a signed-in account has. Every module's facts arrive on it, so
/// there is nothing to subscribe to and no conversation id in the URL — the
/// ticket establishes the account at handshake time.
///
/// Receive-only, per the contract: the app changes state over REST and learns
/// about other people's changes here. Nothing is replayed either, so a listener
/// that cares about missing a frame re-reads over REST on [reconnected].
class RealtimeClient {
  RealtimeClient(this._accountApi);

  final AccountApi _accountApi;

  final StreamController<RealtimeEvent> _events =
      StreamController<RealtimeEvent>.broadcast();
  final StreamController<void> _reconnected = StreamController<void>.broadcast();

  WebSocketChannel? _channel;
  StreamSubscription<dynamic>? _subscription;
  Timer? _retry;
  int _attempt = 0;
  bool _wanted = false;
  bool _disposed = false;
  bool _hasConnectedOnce = false;

  Stream<RealtimeEvent> get events => _events.stream;

  /// Fires after a re-handshake. Delivery is at-most-once and there is no
  /// cursor, so a screen that was open across the gap has to refetch.
  Stream<void> get reconnected => _reconnected.stream;

  bool get isConnected => _channel != null;

  /// Idempotent: calling it while already connected does nothing, which is what
  /// lets every listener ask for the socket without coordinating.
  void connect() {
    if (_disposed || _wanted) return;
    _wanted = true;
    _open();
  }

  void disconnect() {
    _wanted = false;
    _retry?.cancel();
    _retry = null;
    _attempt = 0;
    _hasConnectedOnce = false;
    _close();
  }

  Future<void> _open() async {
    if (_disposed || !_wanted || _channel != null) return;

    final String ticket;
    try {
      // A ticket is single-use and lives 30 seconds, so it is minted per
      // handshake rather than cached.
      final response = await _accountApi.createWebSocketTicket();
      final issued = response.data?.data.ticket;
      if (issued == null || issued.isEmpty) {
        throw StateError('empty websocket ticket');
      }
      ticket = issued;
    } catch (e) {
      debugPrint('Realtime: could not mint a ticket: $e');
      _scheduleRetry();
      return;
    }
    if (_disposed || !_wanted) return;

    try {
      final channel = WebSocketChannel.connect(
        Uri.parse('${ApiEndpoints.webSocketUrl}?ticket=$ticket'),
      );
      _channel = channel;
      _subscription = channel.stream.listen(
        _onFrame,
        onError: (Object error) {
          debugPrint('Realtime: socket error: $error');
          _close();
          _scheduleRetry();
        },
        onDone: () {
          _close();
          _scheduleRetry();
        },
        cancelOnError: true,
      );
      if (_hasConnectedOnce) _reconnected.add(null);
      _hasConnectedOnce = true;
      _attempt = 0;
    } catch (e) {
      debugPrint('Realtime: could not open the socket: $e');
      _close();
      _scheduleRetry();
    }
  }

  void _onFrame(dynamic frame) {
    if (frame is! String) return;
    try {
      final decoded = jsonDecode(frame);
      if (decoded is! Map<String, dynamic>) return;
      final event = RealtimeEvent.fromJson(decoded);
      // An unmodelled code is not an error: the contract may grow a message
      // before this client knows what to do with it.
      if (event != null) _events.add(event);
    } catch (e) {
      debugPrint('Realtime: unreadable frame: $e');
    }
  }

  void _scheduleRetry() {
    if (_disposed || !_wanted || _retry != null) return;
    _attempt = _attempt >= 6 ? 6 : _attempt + 1;
    final delay = Duration(seconds: 1 << (_attempt - 1));
    _retry = Timer(delay, () {
      _retry = null;
      _open();
    });
  }

  void _close() {
    _subscription?.cancel();
    _subscription = null;
    try {
      _channel?.sink.close();
    } catch (_) {
      // Already gone; there is nothing to recover.
    }
    _channel = null;
  }

  void dispose() {
    _disposed = true;
    _wanted = false;
    _retry?.cancel();
    _close();
    _events.close();
    _reconnected.close();
  }
}

/// Kept alive for the whole session and connected only while signed in — the
/// handshake needs a token, and a revoked session's socket is closed by the
/// backend anyway.
@Riverpod(keepAlive: true)
RealtimeClient realtimeClient(Ref ref) {
  final client = RealtimeClient(ref.watch(accountApiProvider));
  ref.onDispose(client.dispose);

  ref.listen<AuthState>(authProvider, (previous, next) {
    next.maybeWhen(
      authenticated: (_) => client.connect(),
      // `loading` is a sign-in in flight, not a session that ended.
      loading: () {},
      initial: () {},
      orElse: client.disconnect,
    );
  }, fireImmediately: true);

  return client;
}

/// What a screen watches: the raw event feed, filtered by whatever it cares
/// about. Watching this is also what makes the socket connect.
@Riverpod(keepAlive: true)
Stream<RealtimeEvent> realtimeEvents(Ref ref) {
  final client = ref.watch(realtimeClientProvider);
  client.connect();
  return client.events;
}
