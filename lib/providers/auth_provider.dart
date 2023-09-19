import 'package:flutter/cupertino.dart';
import 'package:local_app/models/user_model.dart';
import 'package:local_app/services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  late UserModel _data;

  UserModel get data => _data;

  set data(UserModel data) {
    _data = data;
    notifyListeners();
  }

  Future<bool> register({
    required String username,
    required String email,
    required String password,
    required String jeniskelamin,
  }) async {
    try {
      UserModel data = await AuthService().register(
        username: username,
        email: email,
        password: password,
        jeniskelamin: jeniskelamin,
      );
      _data = data;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      UserModel data = await AuthService().login(
        email: email,
        password: password,
      );
      _data = data;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
