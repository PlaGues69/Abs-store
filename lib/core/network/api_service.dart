import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://10.0.2.2:5050/api/auth';

  /// Sends a POST request to [endpoint] with [data]
  static Future<http.Response> post(
    String endpoint,
    Map<String, dynamic> data,
  ) async {
    final url = Uri.parse('$baseUrl$endpoint');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data),
      );

      // Optional debug log
      print('[POST] $url');
      print('Request Body: ${jsonEncode(data)}');
      print('Response: ${response.statusCode} ${response.body}');

      return response;
    } catch (e) {
      print('API POST error: $e');
      rethrow;
    }
  }
}
