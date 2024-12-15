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

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        String username = data['data']['username'] ?? 'Guest';
        userController.setUsername(username);
        userController.setEmail(data['data']['email']);
        print("Login Response: $data");

        if (data['access_token'] != null) {
          Get.offAll(() => HomePage());
        } else {
          Get.snackbar(
            'Login Error',
            'Unexpected response from server',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
      } else {
        Get.snackbar(
          'Login Error',
          'Failed to login. Please check your credentials.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      print("Login exception: $e");
      Get.snackbar(
        'Login Error',
        'An unexpected error occurred.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  void navigateToRegister() {
    Get.to(() => RegisterPage());
  }

  Future<void> logout() async {
    try {
      Get.offAllNamed(AppRoutesNamed.pageLogin);
    } catch (e) {
      Get.snackbar(
        'Logout Error',
        'Failed to logout. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
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
