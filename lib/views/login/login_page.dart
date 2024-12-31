import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_vision/constants/colors.dart';
import 'package:green_vision/views/register/register_page.dart';

import '../../controller/login_controller.dart';
import '../../shared/widgets/custom_text_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());

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
              height: 100,
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
                              top: 20, right: 24, left: 24, bottom: 0),
                          child: CustomTextField(
                            hintText: 'Email',
                            controller: controller.emailController,
                            leadingIconPath: 'assets/icons/mail.png',
                          ),
                        ),
                        const SizedBox(
                          height: 5,
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
                        const SizedBox(height: 50),
                        SizedBox(
                          width: 360,
                          height: 55,
                          child: InkWell(
                            onTap: () {
                              controller.login();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColorsLight.primary,
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 4,
                                    offset: Offset(-4, -4),
                                    color: Colors.white,
                                  ),
                                  BoxShadow(
                                    blurRadius: 4,
                                    offset: Offset(4, 4),
                                    color: Color(0xFFD4D4D4),
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  "Sign In",
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

                        const SizedBox(height: 20),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Belum punya akun?',
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
                                        secondaryAnimation) => const RegisterPage(),
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
                                'daftar',
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
