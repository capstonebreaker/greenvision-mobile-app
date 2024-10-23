import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_vision/routes/app_routes.dart';

void main() {
  runApp(const MyApp(
    initialRoutes: '/page-get-started',
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
