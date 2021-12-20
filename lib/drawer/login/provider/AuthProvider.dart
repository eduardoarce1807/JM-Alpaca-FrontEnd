import 'dart:convert';

import 'package:jm_alpaca/drawer/login/model/AuthResponse.dart';
import 'package:http/http.dart' as http;

class AuthProvider {
  Future<AuthResponse> obtenerToken(String usuario, String password) async {
    var url = Uri.parse(
        "https://floating-coast-42195.herokuapp.com/api/usuario/login");

    print("Dentro del provider (login).");

    var responseHttp =
        await http.post(url, body: {'usuario': usuario, 'password': password});

    String rawResponse = utf8.decode(responseHttp.bodyBytes);

    var jsonResponse = jsonDecode(rawResponse);

    AuthResponse authResponse = AuthResponse(jsonResponse);

    return authResponse;
  }
}
