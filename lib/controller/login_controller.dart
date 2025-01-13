import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_vision/controller/user_controller.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../routes/app_routes_named.dart';
import '../views/home/home_page.dart';
import '../views/register/register_page.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final UserController userController = Get.find();

  var isLoading = false.obs;

  Future<void> login() async {
    if (!validateFields()) return;

    isLoading.value = true;
    final url = Uri.parse('https://capstone-be-zeta.vercel.app/api/auth/login');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': emailController.text.trim(),
          'password': passwordController.text.trim(),
        }),
      );

      final data = jsonDecode(response.body);
      if (response.statusCode == 200 && data['access_token'] != null) {
        String username = data['data']['username']?.trim() ?? 'Guest';
        String email = data['data']['email'];
        String? imgUrl = data['data']['img'];
        String userId = data['data']['id'];  // Ambil userId dari response

        // Menyimpan data pengguna di UserController
        userController.setUsername(username);
        userController.setEmail(email);
        userController.setUserImage(imgUrl ?? '');
        userController.setUserId(userId); // Menyimpan userId

        // Navigasi ke HomePage setelah login berhasil
        Get.offAll(() => HomePage());
      } else {
        showErrorSnackbar(data['message'] ?? 'Failed to login. Please check your credentials.');
      }
    } catch (e) {
      logError(e);
      showErrorSnackbar('An unexpected error occurred.');
    } finally {
      isLoading.value = false;
    }
  }

  bool validateFields() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      showErrorSnackbar('Email and password must be filled.');
      return false;
    }
    if (!GetUtils.isEmail(email)) {
      showErrorSnackbar('Invalid email format.');
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

  void logError(dynamic error) {
    print("Error: $error");
  }

  void navigateToRegister() {
    Get.to(() => RegisterPage());
  }

  Future<void> logout() async {
    try {
      Get.offAllNamed(AppRoutesNamed.pageLogin);
    } catch (e) {
      logError(e);
      showErrorSnackbar('Failed to logout. Please try again.');
    }
  }

  void showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text('Confirm Logout'),
          content: Text('Are you sure you want to log out?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Log Out'),
              onPressed: () async {
                Navigator.of(context).pop();
                await logout();
              },
            ),
          ],
        );
      },
    );
  }
}
