import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:green_vision/controller/user_controller.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import '../views/login/login_page.dart';

class RegisterController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final UserController userController = Get.find();

  var isLoading = false.obs;

  Future<void> register() async {
    if (!validateFields()) return;

    isLoading.value = true;
    final url = Uri.parse('https://capstone-be-zeta.vercel.app/api/auth/register');

    final requestBody = jsonEncode({
      'username': usernameController.text.trim(),
      'email': emailController.text.trim(),
      'password': passwordController.text.trim(),
    });

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: requestBody,
      );

      final data = jsonDecode(response.body);
      if (response.statusCode == 201) {
        userController.setUsername(usernameController.text.trim());
        showSuccessSnackbar('Account created successfully.');
        Get.offAll(() => LoginPage());
      } else if (response.statusCode == 409) {
        showErrorSnackbar('User already exists. Please try a different email or username.');
      } else {
        showErrorSnackbar(data['message'] ?? 'Failed to register.');
      }
    } catch (e) {
      logError(e);
      showErrorSnackbar('An unexpected error occurred.');
    } finally {
      isLoading.value = false;
    }
  }

  bool validateFields() {
    final username = usernameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (username.isEmpty || email.isEmpty || password.isEmpty) {
      showErrorSnackbar('All fields must be filled.');
      return false;
    }
    if (!GetUtils.isEmail(email)) {
      showErrorSnackbar('Invalid email format.');
      return false;
    }
    if (password.length < 6) {
      showErrorSnackbar('Password must be at least 6 characters long.');
      return false;
    }
    return true;
  }

  void showErrorSnackbar(String message) {
    Get.snackbar(
      'Error',
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }

  void showSuccessSnackbar(String message) {
    Get.snackbar(
      'Success',
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }

  void logError(dynamic error) {
    // Implement centralized logging for better debugging.
    print("Error: $error");
  }

  void navigateToLogin() {
    Get.to(() => const LoginPage());
  }
}