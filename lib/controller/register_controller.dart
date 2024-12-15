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

  bool validateFields() {
    if (usernameController.text.trim().isEmpty ||
        emailController.text.trim().isEmpty ||
        passwordController.text.trim().isEmpty) {
      Get.snackbar(
        'Validation Error',
        'All fields must be filled.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    }
    return true;
  }

  // Proses Register
  Future<void> register() async {
    if (!validateFields()) return;

    isLoading.value = true;
    final url = Uri.parse('https://capstone-be-zeta.vercel.app/api/auth/register');

    final requestBody = jsonEncode({
      'username': usernameController.text.trim(),
      'email': emailController.text.trim(),
      'password': passwordController.text.trim(),
    });
    print("Request body: $requestBody");

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: requestBody,
      );

      if (response.statusCode == 201) {
        userController.setUsername(usernameController.text.trim());

        Get.snackbar(
          'Success',
          'Account created successfully',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        Get.offAll(() => LoginPage());
      } else if (response.statusCode == 409) {
        Get.snackbar(
          'Register Error',
          'User already exists. Please try a different email or username.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      } else {
        Get.snackbar(
          'Register Error',
          'Failed to register. Response: ${response.body}',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      print("Register exception: $e");
      Get.snackbar(
        'Register Error',
        'An unexpected error occurred.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  void navigateToLogin() {
    Get.to(() => const LoginPage());
  }
}
