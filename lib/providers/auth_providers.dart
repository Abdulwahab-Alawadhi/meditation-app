import 'package:flutter/material.dart';
import 'package:meditation_app/models/user.dart';
import 'package:meditation_app/services/auth_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  final authService = AuthServices();
  String token = "";

  Future<String> register({required User user}) async {
    token = await authService.register(user: user);

    /// token to be saved in local storage
    notifyListeners();
    return token;
  }

  Future<String> signin({required User user}) async {
    token = await authService.login(user: user);
    saveTokenInStorage(token);

    /// token to be saved in local storage
    notifyListeners();
    return token;
  }

  // saveTokenInStorage
  Future<void> saveTokenInStorage(String token) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    shared.setString('token', token);
  }

  //readTokenFromStorage

  readFromStorage() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    token = shared.getString('token') ?? "";

    /// ??  null check operator
    notifyListeners();
  }

  // register({required User user}) {}
}
