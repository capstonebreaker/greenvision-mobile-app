import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../views/home/home_page.dart';
import '../views/register/register_page.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  var isLoading = false.obs; // Observable boolean for loading state

  Future<void> login() async {
    isLoading.value = true; // Set loading to true
    final auth = FirebaseAuth.instance;
    try {
      await auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Get.offAll(() => HomePage());
    } catch (e) {
      Get.snackbar(
        'Login Error',
        'Failed to login. Please check your credentials.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        borderRadius: 8,
        margin: EdgeInsets.all(16),
      );
      print("Login error: $e");
    } finally {
      isLoading.value =
      false; // Set loading to false regardless of success or failure
    }
  }

  void navigateToRegister() {
    Get.to(() => RegisterPage());
  }
}