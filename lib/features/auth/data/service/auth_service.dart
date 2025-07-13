import 'dart:convert';
import '../../../../core/network/api_service.dart';

class AuthService {
  // 👇 Private override for testing only
  static Future<Map<String, dynamic>> Function(String, String)? _loginOverride;

  /// 👇 Used in test to inject mock login
  static void setLoginOverride(
    Future<Map<String, dynamic>> Function(String, String)? override,
  ) {
    _loginOverride = override;
  }

  static Future<Map<String, dynamic>> login(
    String email,
    String password,
  ) async {
    // ✅ Use override (mock) in tests
    if (_loginOverride != null) {
      return await _loginOverride!(email, password);
    }

    final response = await ApiService.post('/login', {
      'email': email,
      'password': password,
    });

    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return data;
    } else {
      throw Exception(data['message'] ?? 'Login failed');
    }
  }

  static Future<Map<String, dynamic>> register(
    String name,
    String email,
    String password,
  ) async {
    final parts = name.trim().split(' ');
    final firstName = parts.isNotEmpty ? parts[0] : '';
    final lastName = parts.length > 1 ? parts.sublist(1).join(' ') : '';

    final response = await ApiService.post('/register', {
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'password': password,
    });

    final data = jsonDecode(response.body);

    if (response.statusCode == 201) {
      return data;
    } else {
      throw Exception(data['message'] ?? 'Registration failed');
    }
  }
}
