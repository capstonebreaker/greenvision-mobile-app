import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:green_vision/views/register/register_page.dart';
import 'package:integration_test/integration_test.dart';
import 'package:green_vision/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Login Page Integration Test', () {

    testWidgets('User can input email and password and tap login button', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Locate email field and input text
      final emailField = find.byType(TextField).first;
      await tester.enterText(emailField, 'bias@gmail.com');
      await tester.pump();

      // Verify entered text
      expect(find.text('bias@gmail.com'), findsOneWidget);

      // Locate password field and input text
      final passwordField = find.byType(TextField).at(1);
      await tester.enterText(passwordField, '123456');
      await tester.pump();

      // Verify entered text
      expect(find.text('123456'), findsOneWidget);z`

      // Locate and tap login button
      final loginButton = find.text('Sign In');
      expect(loginButton, findsOneWidget);
      await tester.tap(find.text('Sign In'));
      await tester.pumpAndSettle();

      // Check for expected result after login
      expect(find.text('daftar'), findsOneWidget);
    });

    testWidgets('User can navigate to register page', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      final registerLink = find.text('daftar');
      expect(registerLink, findsOneWidget);
      await tester.tap(registerLink);

      await tester.pumpAndSettle();

      expect(find.byType(RegisterPage), findsOneWidget);
    });
  });
}
