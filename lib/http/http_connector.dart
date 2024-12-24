import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:twilight_imperium/shared/http/login/login_request.dart';

class HTTPConnector {
  static const String _host = 'http://localhost:3000';

  static Future<void> login(LoginRequest request) async {
    http.post(Uri.parse('$_host/api/login'), body: jsonEncode(request.toJson()));
  }

  static Future<void> createGame() async {

  }
}