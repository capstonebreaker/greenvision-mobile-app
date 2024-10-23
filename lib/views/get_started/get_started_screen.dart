import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_vision/constants/colors.dart';

import '../../routes/app_routes_named.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black,
          ),
          Positioned(
            right: 0,
            left: 0,
            child: Container(
              child: Image.asset(
                'assets/images/backgrounds/get_started/paddy.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 465,
            right: 0,
            left: 0,
            child: Stack(
              children: [
                Container(
                  child: Image.asset(
                      'assets/images/backgrounds/get_started/container.png'),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 24, top: 24, right: 24, bottom: 142),
                    child: Column(
                      children: [
                        Text(
                          'Detect the  \nProblem, Harvest  \nthe Solution',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.sora(
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Welcome to an innovative platform where  \ntechnology empowers you to detect crop \nissues and find timely solutions.',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.sora(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Color(0xffA2A2A2)),
                        ),
                        SizedBox(height: 32),
                        SizedBox(
                          width: 327,
                          height: 56,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColorsDark.third,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16))),
                              onPressed: () {
                                Get.toNamed(AppRoutesNamed.pageRegister);
                              },
                              child: Text(
                                "Get Started",
                                style: GoogleFonts.sora(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              )),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ));
  }
}
