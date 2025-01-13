import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../controller/user_controller.dart';

class SessionService {

  final UserController userController = UserController();

  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('access_token', token);
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('access_token');
  }

  Future<String?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('user_id');
  }

  Future<void> saveUserId(String userId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_id', userId);
  }

  Future<void> saveUserInfo(Map<String, dynamic> userInfo) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_info', jsonEncode(userInfo));
  }

  Future<Map<String, dynamic>?> getUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    final userInfoString = prefs.getString('user_info');
    if (userInfoString != null) {
      return jsonDecode(userInfoString);
    }
    return null;
  }

  Future<void> saveUserData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('username', userController.username.value);
    prefs.setString('email', userController.email.value);
  }

  Future<void> loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    userController.username.value = prefs.getString('username') ?? 'Guest';
    userController.email.value = prefs.getString('email') ?? 'guest@example.com';
  }

  Future<void> clearSession() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('access_token');
    await prefs.remove('user_info');
  }
}
