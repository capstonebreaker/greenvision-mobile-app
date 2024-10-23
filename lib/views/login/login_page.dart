import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_vision/constants/colors.dart';

import '../../controller/login_controller.dart';
import '../../routes/app_routes_named.dart';
import '../../shared/widgets/custom_text_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());

    return Scaffold(
      backgroundColor: Colors.black,
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
              height: 81,
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColorsDark.aksen,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(45.0),
                    topRight: Radius.circular(45.0),
                  ),
                ),
                child: ListView(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 43, right: 24, left: 24, bottom: 0),
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
                        const SizedBox(height: 20),
                        SizedBox(
                          width: 325,
                          height: 48,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColorsDark.third,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            onPressed: () {
                              // controller.login();
                              Get.toNamed(AppRoutesNamed.pageHome);
                            },
                            child: Text(
                              "Sign In",
                              style: GoogleFonts.dmSans(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: 325,
                          height: 48,
                          child: ElevatedButton(
                            style: OutlinedButton.styleFrom(
                              backgroundColor: AppColorsDark.aksen,
                              side: const BorderSide(
                                  color: AppColorsDark.third, width: 2),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            onPressed: () {
                              // Navigator.pushAndRemoveUntil(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => LoginScreen()),
                              //       (route) => false,
                              // );
                              Get.toNamed(AppRoutesNamed.pageHome);
                            },
                            child: Text(
                              "Sign In with Google",
                              style: GoogleFonts.dmSans(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 52),
                        Text(
                          '© GreenVision',
                          style: GoogleFonts.dmSans(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
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
