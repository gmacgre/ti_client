import 'dart:convert';
import 'package:twilight_imperium/shared/http/login/login_request.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class HTTPConnector {
  static const String _host = 'ws://localhost:3000';
  static WebSocketChannel? _connection;

  static Future<void> login(LoginRequest request) async {
    WebSocketChannel channel = await _getConnection();
    channel.sink.add(jsonEncode(request.toJson()));
  }
  
  static Future<void> createGame() async {

  }

  static Future<WebSocketChannel> _getConnection() async {
    if(_connection == null) {
        _connection = WebSocketChannel.connect(Uri.parse(_host));
        await _connection!.ready;
        _connection!.stream.listen(_handleMessage);
    }
    return _connection!;
  }

  static void _handleMessage(dynamic message) {
    print('\'ello Govnah!');
    print(message.runtimeType);
    print(message);
  }

  static void closeSocket() async {
    WebSocketChannel channel = await _getConnection();
    channel.sink.close();
    _connection = null;
  }
}