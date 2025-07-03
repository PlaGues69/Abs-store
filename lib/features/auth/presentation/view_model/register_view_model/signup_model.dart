import 'package:flutter/material.dart';
import '../../../data/service/auth_service.dart';

class SignupModel extends ChangeNotifier {
  bool isLoading = false;
  String? error;
  bool registerSuccess = false;

  Future<void> register(String name, String email, String password) async {
    isLoading = true;
    error = null;
    registerSuccess = false;
    notifyListeners();

    try {
      final result = await AuthService.register(name, email, password);
      print('Registration successful: $result');
      registerSuccess = true;
    } catch (e) {
      error = e.toString();
      print('Register error: $error');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
