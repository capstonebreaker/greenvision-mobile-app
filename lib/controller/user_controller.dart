import 'package:get/get.dart';

class UserController extends GetxController {
  var username = 'Guest'.obs;
  var email = 'guest@example.com'.obs;

  void setUsername(String? newUsername) {
    username.value = newUsername ?? 'Guest';
  }

  void setEmail(String? newEmail) {
    email.value = newEmail ?? 'guest@example.com';
  }
}
