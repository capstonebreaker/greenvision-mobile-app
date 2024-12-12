import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
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
                          height: 48,
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
                        // SizedBox(
                        //   width: 360,
                        //   height: 48,
                        //   child: InkWell(
                        //     onTap: () {
                        //       // Navigator.pushAndRemoveUntil(
                        //       //   context,
                        //       //   MaterialPageRoute(
                        //       //       builder: (context) => LoginScreen()),
                        //       //       (route) => false,
                        //       // );
                        //     },
                        //     child: Container(
                        //       decoration: BoxDecoration(
                        //         borderRadius: BorderRadius.circular(10),
                        //         color: AppColorsLight.third,
                        //         boxShadow: const [
                        //           BoxShadow(
                        //             blurRadius: 12.0,
                        //             offset: Offset(-8, -8),
                        //             color: Colors.white,
                        //           ),
                        //           BoxShadow(
                        //             blurRadius: 12.0,
                        //             offset: Offset(8, 8),
                        //             color: Color(0xFFD4D4D4),
                        //           ),
                        //         ],
                        //       ),
                        //       child: Center(
                        //         child: Text(
                        //           "Sign In with Google",
                        //           style: GoogleFonts.dmSans(
                        //             fontSize: 14,
                        //             fontWeight: FontWeight.w600,
                        //             color: Colors.black,
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
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
                                controller.navigateToRegister();
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
