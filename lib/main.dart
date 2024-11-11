import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:green_vision/routes/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:green_vision/routes/app_routes_named.dart';
import 'firebase_options.dart';

void main() async {


  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final User? user = FirebaseAuth.instance.currentUser;

  print(user);
  print(User);


  runApp(MyApp(
      initialRoutes:
      user != null ? AppRoutesNamed.pageHome : AppRoutesNamed.pageRegister));
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
