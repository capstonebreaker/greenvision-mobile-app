import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class UserController extends GetxController {
  var username = 'Guest'.obs;
  var email = 'guest@example.com'.obs;
  var userImage = ''.obs;
  var password = '********'.obs;
  var userId = ''.obs; // Menyimpan userId

  void setUsername(String? newUsername) {
    username.value = newUsername ?? 'Guest';
  }

  void setPassword(String? newPassword) {
    password.value = newPassword ?? '********';
  }

  void setEmail(String? newEmail) {
    email.value = newEmail ?? 'guest@example.com';
  }

  void setUserImage(String? newImageUrl) {
    userImage.value = newImageUrl ?? '';
  }

  void setUserId(String newUserId) {
    userId.value = newUserId;
  }


  // UserController
  Future<void> updateProfile(String userId, String username, String email, String? password) async {
    final url = Uri.parse('https://capstone-be-zeta.vercel.app/api/userid/update');

    try {
      final response = await http.patch(
        url,
        headers: {
          'Content-Type': 'application/json',
          // 'Authorization': 'Bearer ${userController.accessToken.value}', // Pastikan token ada
        },
        body: jsonEncode({
          'id': userId,
          'username': username,
          'email': email,
          'password': password ?? '', // Jika password null, kirimkan string kosong
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['status'] == 'success') {
          print('Profile updated successfully');
        } else {
          print('Failed to update profile: ${data['message']}');
        }
      } else if (response.statusCode == 301 || response.statusCode == 302) {
        // Handle redirects
        print('Redirecting... Status code: ${response.statusCode}');
      } else {
        print('Failed to update profile: ${response.statusCode}');
      }
    } catch (error) {
      print('Error during update: $error');
    }
  }

}
