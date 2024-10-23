import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_vision/routes/app_routes.dart';
import 'package:green_vision/views/get_started/get_started_screen.dart';
import 'package:green_vision/views/login/login_page.dart';
import 'package:green_vision/views/register/register_page.dart';

void main() {
  runApp(const MyApp(
    initialRoutes: '/page-home',
  ));
}

class MyApp extends StatelessWidget {
  final String initialRoutes;

  const MyApp({super.key, required this.initialRoutes});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: initialRoutes,
      getPages: AppRoutes.routes,
    );
  }
}
