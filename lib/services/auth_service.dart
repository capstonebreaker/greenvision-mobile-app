import 'dart:convert';
import 'package:green_vision/services/session_service.dart';
import 'package:http/http.dart' as http;

const String baseUrl = 'https://capstone-be-zeta.vercel.app/api/auth';

class AuthServices {
  final SessionService _sessionService = SessionService();

  Future<Map<String, dynamic>> register(String username, String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': username,
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 201) {
      final data = jsonDecode(response.body);
      await _sessionService.saveToken(data['access_token']);
      return {'status': true, 'message': data['message'] ?? 'Registration successful'};
    } else {
      final error = jsonDecode(response.body);
      return {'status': false, 'message': error['message'] ?? 'Registration failed'};
    }
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      await _sessionService.saveToken(data['access_token']);

      await _sessionService.saveUserInfo(data['data']);

      return {'status': true, 'message': data['message'] ?? 'Login successful'};
    } else {
      final error = jsonDecode(response.body);
      return {'status': false, 'message': error['message'] ?? 'Invalid credentials'};
    }
  }

  Future<bool> logout() async {
    final token = await _sessionService.getToken();
    final response = await http.post(
      Uri.parse('$baseUrl/logout'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      await _sessionService.clearSession();
      return true;
    } else {
      return false;
    }
  }
}
