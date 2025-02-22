import 'dart:convert';
import 'package:twilight_imperium/shared/http/create_request.dart';
import 'package:twilight_imperium/shared/http/login_request.dart';
import 'package:twilight_imperium/shared/http/request.dart';
import 'package:twilight_imperium/shared/http/response.dart';
import 'package:uuid/uuid.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class HTTPConnector {
  static const String _host = 'ws://localhost:3000';
  static WebSocketChannel? _connection;
  static final Map<String, Function> _onHold = {};
  static const Uuid _uuid = Uuid();


  // Give Type Checking to Message Sending
  static Future<void> login(LoginRequest request, void Function(TIResponse) handler, void Function() onError) async {
    await _sendRequest(request, handler, onError);
  }

  static Future<void> createGame(CreateRequest request, void Function(TIResponse) handler, void Function() onError) async {
    await _sendRequest(request, handler, onError);
  }

  // Send the Request
  static Future<void> _sendRequest(TIRequest req, Function handler, Function onError) async {
    req.uuid = _uuid.v4();
    _onHold[req.uuid] = handler;
    WebSocketChannel channel;
    try {
      channel = await _getConnection();
      channel.sink.add(jsonEncode(req));
    }
    on WebSocketChannelException {
      closeSocket();
      _onHold.remove(req.uuid);
      onError();
    }
  }

  // Start Handle Code for each type
  static void _handleMessage(dynamic message) {
    TIResponse res = TIResponse.fromJson(jsonDecode(message));
    if (_onHold.containsKey(res.uuid)) {
      _onHold[res.uuid]!(res);
    }
    _onHold.remove(res.uuid);
  }

  static Future<WebSocketChannel> _getConnection() async {
    if(_connection == null) {
        _connection = WebSocketChannel.connect(Uri.parse(_host));
        await _connection!.ready;
        _connection!.stream.listen(_handleMessage).onDone(closeSocket);
    }
    return _connection!;
  }

  static void closeSocket() async {
    _connection!.sink.close();
    _connection = null;
  }
}