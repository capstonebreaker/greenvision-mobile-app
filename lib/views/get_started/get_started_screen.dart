import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_vision/constants/colors.dart';
import 'package:green_vision/routes/app_routes_named.dart';
import 'package:green_vision/views/login/login_page.dart';

class GetStartedScreen extends StatelessWidget {
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
                            fontWeight: FontWeight.w700,
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
                            key: const Key("tombol"),
                            onTap: () {
                              Navigator.pushNamed(context, AppRoutesNamed.pageLogin);
                              // Navigator.of(context).push(
                              //   PageRouteBuilder(
                              //     pageBuilder: (
                              //         context,
                              //         animation,
                              //         secondaryAnimation) => const LoginPage(),
                              //     // transitionsBuilder: (context, animation, secondaryAnimation, child) {
                              //     //   const begin = 0.0;
                              //     //   const end = 1.0;
                              //     //   const curve = Curves.easeInOut;
                              //     //   final tween = Tween(
                              //     //       begin: begin,
                              //     //       end: end
                              //     //   )
                              //     //       .chain(CurveTween(curve: curve));
                              //     //   final opacityAnimation = animation.drive(tween);
                              //     //   return FadeTransition(
                              //     //     opacity: opacityAnimation,
                              //     //     child: child,
                              //     //   );
                              //     // },
                              //     // transitionDuration: const Duration(milliseconds: 500),
                              //   ),
                              // );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: AppColorsLight.third,
                                boxShadow: const [
                                  BoxShadow(
                                      color: Color(0xFFffffff),
                                      offset: Offset(-2, -2),
                                      blurRadius: 1,
                                    // inset: true
                                  ),
                                  BoxShadow(
                                      color: Color(0xFFbebebe),
                                      offset: Offset(2, 2),
                                      blurRadius: 1,
                                    // inset: true
                                  )
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  key: const Key("gatel"),
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
