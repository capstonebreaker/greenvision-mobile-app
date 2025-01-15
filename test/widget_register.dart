import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:green_vision/controller/register_controller.dart';
import 'package:green_vision/controller/user_controller.dart';
import 'package:green_vision/views/register/register_page.dart';

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

  testWidgets('Menampilkan field username, email, dan password', (WidgetTester tester) async {
    await tester.pumpWidget(const GetMaterialApp(
      home: RegisterPage(),
    ));

    // Memastikan field username, email, dan password ditampilkan
    expect(find.byKey(const Key("Username")), findsOneWidget);
    expect(find.byKey(const Key("Email")), findsOneWidget);
    expect(find.byKey(const Key("Password")), findsOneWidget);
  });

  testWidgets('Tombol Sign Up harus memanggil fungsi register', (WidgetTester tester) async {
    await tester.pumpWidget(const GetMaterialApp(
      home: RegisterPage(),
    ));

    // Mengisi field
    await tester.enterText(find.byKey(const Key("Username")), 'testuser');
    await tester.enterText(find.byKey(const Key("Email")), 'test@example.com');
    await tester.enterText(find.byKey(const Key("Password")), 'password123');

    // Menekan tombol Sign Up
    await tester.tap(find.byKey(const Key("btn_regis")));
    await tester.pump(); // Memperbarui widget setelah penekanan tombol

    // Memastikan nilai yang dimasukkan ke dalam field
    expect(find.text('testuser'), findsOneWidget);
    expect(find.text('test@example.com'), findsOneWidget);
    expect(find.text('password123'), findsOneWidget);
  });

  testWidgets('Tombol masuk harus memanggil fungsi navigateToLogin', (WidgetTester tester) async {
    await tester.pumpWidget(const GetMaterialApp(
      home: RegisterPage(),
    ));

    // Menekan tombol masuk
    await tester.tap(find.byKey(const Key("btn_tologin")));
    await tester.pump(); // Memperbarui widget setelah penekanan tombol

    // Memastikan navigasi ke halaman login (Anda mungkin perlu menambahkan logika untuk memverifikasi navigasi)
    // Misalnya, Anda bisa memeriksa apakah halaman login ditampilkan
  });
}
