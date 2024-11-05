import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_vision/controller/register_controller.dart';
import 'package:green_vision/routes/app_routes_named.dart';

import '../../constants/colors.dart';
import '../../controller/login_controller.dart';
import '../../shared/widgets/custom_text_field.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final RegisterController controller = Get.put(RegisterController());

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
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20, right: 24, left: 24, bottom: 0),
                          child: CustomTextField(
                            hintText: 'Confirm Password',
                            controller: controller.confirmPasswordController,
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
                              controller.createUser();
                            },
                            child: Text(
                              "Register",
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
                              Get.toNamed(AppRoutesNamed.pageLogin);
                            },
                            child: Text(
                              "Register with Google",
                              style: GoogleFonts.dmSans(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Atau',
                              style: GoogleFonts.dmSans(
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 2),
                            InkWell(
                              onTap: () {
                                controller.navigateToLogin();
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
                            SizedBox(width: 2),
                            Text(
                              'sekarang jika belum memiliki akun',
                              style: GoogleFonts.dmSans(
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                                color: Colors.white,
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
