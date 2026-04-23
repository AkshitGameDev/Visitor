import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/auth_response.dart';

class ApiService {
  static const String baseUrl = 'https://visitor-api-58oi.onrender.com';

  static Future<AuthResponse> signup({
    required String name,
    required String userName,
    required String email,
    required String password,
  }) async {
    final url = Uri.parse('$baseUrl/api/auth/signup');

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'name': name,
        'userName': userName,
        'email': email,
        'password': password,
      }),
    );

    final data = jsonDecode(response.body);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return AuthResponse.fromJson(data);
    } else {
      return AuthResponse(
        success: false,
        message: data['message'] ?? 'Signup failed',
      );
    }
  }

  static Future<AuthResponse> login({
    required String email,
    required String password,
  }) async {
    final url = Uri.parse('$baseUrl/api/auth/login');

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    final data = jsonDecode(response.body);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return AuthResponse.fromJson(data);
    } else {
      return AuthResponse(
        success: false,
        message: data['message'] ?? 'Login failed',
      );
    }
  }
}