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

      // Add an extra pump to wait for any potential animations
      await tester.pumpAndSettle();

      // Locate and tap the "Get Started" button (make sure the text matches exactly)
      final getStartedButton = find.text('Get Started');
      expect(getStartedButton, findsOneWidget);  // Ensure it is found
      await tester.tap(getStartedButton);
      await tester.pumpAndSettle();  // Wait for the transition

      // Now locate the email field and input text
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
      expect(find.text('123456'), findsOneWidget);

      // Locate and tap login button
      final loginButton = find.text('Sign In');
      expect(loginButton, findsOneWidget);
      await tester.tap(loginButton);
      await tester.pumpAndSettle();

      // Check for expected result after login
      expect(find.text('daftar'), findsOneWidget);
    });

  });
}