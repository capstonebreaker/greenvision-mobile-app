import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SizedBox(
          height: 140,
          width: 142,
          child: Image.asset('assets/logo/logo.png'),
        ),
      ),
    );
  }
}
