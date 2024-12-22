import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_vision/controller/register_controller.dart';
import 'package:green_vision/routes/app_routes_named.dart';
import 'package:green_vision/views/login/login_page.dart';

import '../../constants/colors.dart';
import '../../shared/widgets/custom_text_field.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final RegisterController controller = Get.put(RegisterController());

    return Scaffold(
      backgroundColor: AppColorsLight.primary,
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 137,
            ),
            SizedBox(
              height: 140,
              width: 142,
              child: Image.asset('assets/logo/logo.png'),
            ),
            const SizedBox(
              height: 61,
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(45.0),
                      topRight: Radius.circular(45.0),
                    ),
                    color: AppColorsLight.primary,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 12.0,
                        offset: Offset(-8, -8),
                        color: Colors.white,
                        // inset: true
                      ),
                      BoxShadow(
                        blurRadius: 12.0,
                        offset: Offset(8, 8),
                        color: Color(0xFFD4D4D4),
                        // inset: true
                      )
                    ]
                ),
                child: ListView(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 23, right: 24, left: 24, bottom: 0),
                          child: CustomTextField(
                            hintText: 'Username',
                            controller: controller.usernameController,
                            leadingIconPath: 'assets/icons/account.png',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20, right: 24, left: 24, bottom: 0),
                          child: CustomTextField(
                            hintText: 'Email',
                            controller: controller.emailController,
                            leadingIconPath: 'assets/icons/mail.png',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20, right: 24, left: 24, bottom: 0),
                          child: CustomTextField(
                            hintText: 'Password',
                            controller: controller.passwordController,
                            obscureText: true,
                            leadingIconPath: 'assets/icons/lock.png',
                          ),
                        ),
                        const SizedBox(height: 40),
                        SizedBox(
                          width: 360,
                          height: 55,
                          child: InkWell(
                            onTap: () {
                              controller.register();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColorsLight.primary,
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 12.0,
                                    offset: Offset(-8, -8),
                                    color: Colors.white,
                                  ),
                                  BoxShadow(
                                    blurRadius: 12.0,
                                    offset: Offset(8, 8),
                                    color: Color(0xFFD4D4D4),
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  "Sign Up",
                                  style: GoogleFonts.dmSans(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Sudah punya akun?',
                              style: GoogleFonts.dmSans(
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(width: 2),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  PageRouteBuilder(
                                    pageBuilder: (
                                        context,
                                        animation,
                                        secondaryAnimation) => const LoginPage(),
                                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                      const begin = 0.0;
                                      const end = 1.0;
                                      const curve = Curves.easeInSine;
                                      final tween = Tween(
                                          begin: begin,
                                          end: end
                                      )
                                          .chain(CurveTween(curve: curve));
                                      final opacityAnimation = animation.drive(tween);
                                      return FadeTransition(
                                        opacity: opacityAnimation,
                                        child: child,
                                      );
                                    },
                                    transitionDuration: const Duration(milliseconds: 500),
                                  ),
                                );
                              },
                              child: Text(
                                'masuk',
                                style: GoogleFonts.dmSans(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 52),
                        Text(
                          '© GreenVision',
                          style: GoogleFonts.dmSans(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
