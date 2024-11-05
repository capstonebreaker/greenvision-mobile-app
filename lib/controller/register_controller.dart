import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_vision/views/login/login_page.dart';

class RegisterController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
  TextEditingController();

  Future<void> createUser() async {
    final auth = FirebaseAuth.instance;
    try {
      if (passwordController.text == confirmPasswordController.text) {
        await auth.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        Get.back(); // Go back to the previous screen (LoginScreen)
      } else {
        // Show password mismatch notification
        Get.snackbar(
          'Registration Error',
          'Passwords do not match.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          borderRadius: 8,
          margin: EdgeInsets.all(16),
        );
      }
    } catch (e) {
      // Show registration error notification
      Get.snackbar(
        'Registration Error',
        'Failed to register. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        borderRadius: 8,
        margin: EdgeInsets.all(16),
      );
      print("Registration error: $e");
    }
  }

  void navigateToLogin() {
    Get.to(() => LoginPage());
  }
}