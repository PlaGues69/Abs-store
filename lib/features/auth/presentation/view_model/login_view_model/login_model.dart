import 'package:abs_onlinestore/features/auth/data/service/auth_service.dart';
import 'package:flutter/material.dart';

class Signinmodel extends ChangeNotifier {
  bool isLoading = false;
  String? error;
  bool loginSuccess = false;

  Future<void> login(String email, String password) async {
    isLoading = true;
    error = null;
    loginSuccess = false;
    notifyListeners();

    try {
      final result = await AuthService.login(email, password);
      print('Login successful: $result');
      loginSuccess = true;
    } catch (e) {
      error = e.toString();
      print('Login error: $error');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
