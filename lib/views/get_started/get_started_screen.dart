import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_vision/constants/colors.dart';
import 'package:green_vision/views/login/login_page.dart';

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
            color: AppColorsLight.primary,
          ),
          Positioned(
            right: 0,
            left: 0,
            child: Image.asset(
              'assets/images/backgrounds/get_started/getstarted.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 465,
            right: 0,
            left: 0,
            child: Stack(
              children: [
                Image.asset(
                    'assets/images/backgrounds/get_started/ShadowContainer.png'),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 24, top: 15, right: 24, bottom: 142),
                    child: Column(
                      children: [
                        Text(
                          'Detect the  \nProblem, Harvest  \nthe Solution',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.sora(
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Welcome to an innovative platform where  \ntechnology empowers you to detect crop \nissues and find timely solutions.',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.sora(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: const Color(0xffA2A2A2)),
                        ),
                        const SizedBox(height: 55),
                        SizedBox(
                          width: 330,
                          height: 64,
                          child: InkWell(
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
                                    const curve = Curves.easeInOut;
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
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: AppColorsLight.third,
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
                                  "Get Started",
                                  style: GoogleFonts.sora(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
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
