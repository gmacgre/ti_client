import 'dart:convert';
import 'package:twilight_imperium/shared/http/login/login_request.dart';
import 'package:twilight_imperium/shared/http/login/login_response.dart';
import 'package:uuid/uuid.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class HTTPConnector {
  static const String _host = 'ws://localhost:3000';
  static WebSocketChannel? _connection;
  static final Map<String, Function> _onHoldSuccess = {};
  static final Map<String, Function> _onHoldError = {};
  static const Uuid _uuid = Uuid();

  static Future<void> login(LoginRequest request, Function onSuccess, Function onError) async {
    request.uuid = _uuid.v4();
    _putOnHold(request.uuid, onSuccess, onError);
    WebSocketChannel channel = await _getConnection();
    channel.sink.add(jsonEncode(request.toJson()));
  }
  
  static Future<void> createGame() async {

  }

  static void _putOnHold(String uuid, Function onSuccess, Function onError) {
    _onHoldSuccess[uuid] = onSuccess;
    _onHoldError[uuid] = onError;
  }

  static void _handleMessage(dynamic message) {
    // TODO: Client Response to Server
    Map<String, dynamic> parsed = jsonDecode(message);
    switch(parsed['type']) {
      case 'Login':
        _handleLoginResponse(parsed);
    }
  }

  static void _handleLoginResponse(Map<String, dynamic> content) {
    LoginResponse res = LoginResponse.fromJson(content);
    if (res.isSuccess && _onHoldSuccess.containsKey(res.uuid)) {
      _onHoldSuccess[res.uuid]!(res);
      _onHoldSuccess.remove(res.uuid);
      _onHoldError.remove(res.uuid);
    }
    else if (!res.isSuccess && _onHoldError.containsKey(res.uuid)) {
      _onHoldError[res.uuid]!(res); 
    }
    _onHoldSuccess.remove(res.uuid);
    _onHoldError.remove(res.uuid);
  }

  static Future<WebSocketChannel> _getConnection() async {
    if(_connection == null) {
        _connection = WebSocketChannel.connect(Uri.parse(_host));
        await _connection!.ready;
        _connection!.stream.listen(_handleMessage);
    }
    return _connection!;
  }

  static void closeSocket() async {
    _connection = null;
  }
}