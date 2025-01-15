import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:green_vision/controller/register_controller.dart';
import 'package:green_vision/controller/user_controller.dart';
import 'package:green_vision/views/login/login_page.dart';

void main() {
  setUp((){
    Get.testMode = true;
    Get.put(UserController());
    Get.put(RegisterController());
  });

  tearDown(() {
    Get.delete<UserController>();
    Get.delete<RegisterController>();
  });

  testWidgets('Menampilkan field email, dan password', (WidgetTester tester) async {
    await tester.pumpWidget(const GetMaterialApp(
      home: LoginPage(),
    ));

    expect(find.byKey(const Key("Email")), findsOneWidget);
    expect(find.byKey(const Key("Password")), findsOneWidget);
  });

  testWidgets('Tombol Sign In harus memanggil fungsi login', (WidgetTester tester) async {
    await tester.pumpWidget(const GetMaterialApp(
      home: LoginPage(),
    ));

    await tester.enterText(find.byKey(const Key("Email")), 'test@example.com');
    await tester.enterText(find.byKey(const Key("Password")), 'password123');

    await tester.tap(find.byKey(const Key("btn_login")));
    await tester.pump();

    expect(find.text('test@example.com'), findsOneWidget);
    expect(find.text('password123'), findsOneWidget);
  });

  testWidgets('Tombol daftar harus memanggil fungsi navigateToRegister', (WidgetTester tester) async {
    await tester.pumpWidget(const GetMaterialApp(
      home: LoginPage(),
    ));

    await tester.tap(find.byKey(const Key("btn_toRegist")));
    await tester.pump();

  });
}
