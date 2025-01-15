import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import '../routes/app_routes_named.dart';
import '../services/session_service.dart';

class UserController extends GetxController {
  late TextEditingController newusernameController = TextEditingController();
  late TextEditingController newemailController = TextEditingController();
  late TextEditingController newpasswordController = TextEditingController();

  final Rx<File?> selectedImage = Rx<File?>(null);
  final RxBool isLoading = false.obs;


  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedImage =
    await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      selectedImage.value = File(pickedImage.path);
      update();
    }
  }

  var username = 'Guest'.obs;
  var email = 'guest@example.com'.obs;
  var userImage = ''.obs;
  var password = '********'.obs;
  var id = ''.obs;

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

  void setUserId(String newId) {
    id.value = newId ?? '';
  }

  bool validateFields() {
    if (newusernameController.text.trim().isEmpty ||
        newpasswordController.text.trim().isEmpty ||
        newemailController.text.trim().isEmpty) {
      Get.snackbar(
        'Validation Error',
        'All fields must be filled.',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    }

    // if (newpasswordController.text.trim() !=
    //     newretypePasswordController.text.trim()) {
    //   Get.snackbar(
    //     'Validation Error',
    //     'Password and confirm password must be the same.',
    //     snackPosition: SnackPosition.TOP,
    //     backgroundColor: Colors.red,
    //     colorText: Colors.white,
    //   );
    //   return false;
    // }

    return true;
  }

  void showUpdateAccountConfirmationDialog(
      BuildContext context, String userId){
    if (!validateFields()) return;
    showDialog(
        context: context,
        builder: (BuildContext cotext){
          return AlertDialog(
            title: Text('Update Account'),
            content: Text('Are you sure you want to update this account?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('Cancel'),
              ),
              TextButton(
                onPressed: () async {
                  Navigator.of(context).pop();
                  await updateProfile(userId);
                },
                child: Text('Update', style: TextStyle(color: Colors.green)),
              ),
            ],
          );
        },
    );
  }

  Future<void> updateProfile(String userId) async {
    isLoading.value = true;
    final url = Uri.parse('https://capstone-be-zeta.vercel.app/api/$userId/update');

    try {
      final request = http.MultipartRequest(
        'PATCH',
        Uri.parse('https://capstone-be-zeta.vercel.app/api/$userId/update')
      );

      request.fields['username'] = newusernameController.text.trim();
      request.fields['email'] = newemailController.text.trim();
      request.fields['password'] = newpasswordController.text.trim();

      if (selectedImage.value != null) {
        request.files.add(
          await http.MultipartFile.fromPath(
            'image',
            selectedImage.value!.path,
          ),
        );
      }

      request.headers['Content-Type'] = 'multipart/form-data';

      var response = await request.send();

      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        final decoded = jsonDecode(responseBody);
        final updatedUserData = decoded['user'];
        setUsername(updatedUserData['username']);
        setEmail(updatedUserData['email']);
        setPassword(updatedUserData['password']);
        if (updatedUserData['image'] != null) {
          setUserImage(updatedUserData['image']);
        }
        newpasswordController.clear();
        Get.snackbar(
          'Success',
          'Profile updated successfully.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        Get.offAllNamed(AppRoutesNamed.pageProfile);
      } else {
        Get.snackbar(
          'Error',
          'Failed to update profile. Please try again.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'An error occurred: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

}
