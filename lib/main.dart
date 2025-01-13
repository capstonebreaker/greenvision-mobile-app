import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_vision/firebase_options.dart';
import 'package:green_vision/routes/app_routes.dart';
import 'package:green_vision/routes/app_routes_named.dart';
import 'controller/user_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put(UserController());

  bool isLoggedIn = await checkLoginStatus();

  runApp(MyApp(
      initialRoutes: isLoggedIn ? AppRoutesNamed.pageHome : AppRoutesNamed.pageLogin));
}

Future<bool> checkLoginStatus() async {
  final userController = Get.find<UserController>();

  if (userController.username.value.isNotEmpty) {
    return true;
  }

  return false;
}

class MyApp extends StatelessWidget {
  final String initialRoutes;

  const MyApp({super.key, required this.initialRoutes});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: initialRoutes,
      getPages: AppRoutes.routes,
    );
  }
}