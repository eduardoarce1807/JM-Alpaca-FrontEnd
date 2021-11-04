// ignore_for_file: unnecessary_this

import 'dart:convert';

class AuthResponse {
  String message = "";
  String? token = "";

  AuthResponse(Map jsonAuthResponse) {
    this.message = jsonAuthResponse["message"];
    this.token = jsonAuthResponse["token"];
  }
}