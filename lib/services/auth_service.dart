import 'dart:convert';
import 'dart:developer';

import 'package:local_app/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthService {
  String baseUrl = 'http://192.168.1.8:8000/api';

  Future<UserModel> register({
    required String username,
    required String email,
    required String password,
    required String jeniskelamin,
  }) async {
    var url = '$baseUrl/register';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'username': username,
      'email': email,
      'password': password,
      'jeniskelamin': jeniskelamin,
    });

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    log(response.body);

    if (response.statusCode == 200) {
      var res = UserModel.fromJson(jsonDecode(response.body));

      return res;
    } else {
      throw Exception('Gagal register');
    }
  }

  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    var url = '$baseUrl/login';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'email': email,
      'password': password,
    });

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    log(response.body);

    if (response.statusCode == 200) {
      var res = UserModel.fromJson(jsonDecode(response.body));

      return res;
    } else {
      throw Exception('Gagal Login');
    }
  }
}
