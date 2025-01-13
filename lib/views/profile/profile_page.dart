import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:get/get.dart';
import 'package:green_vision/controller/login_controller.dart';
import 'package:green_vision/views/profile/edit_profile_page.dart';
import 'package:green_vision/views/profile/security_page.dart';
import '../../constants/colors.dart';
import '../../controller/user_controller.dart';
import '../../shared/widgets/buttom_nav_bar.dart';
import 'about_page.dart';

class ProfilePage extends StatelessWidget {

  final UserController userController = Get.find();

  @override
  Widget build(BuildContext context) {

    final LoginController controller = Get.put(LoginController());

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColorsLight.primary,
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(0),
          height: size.height,
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 55),
                child: Obx(() {
                  return CircleAvatar(
                    radius: 60,
                    backgroundColor: AppColorsLight.third,
                    child: CircleAvatar(
                      radius: 58,
                      backgroundImage: userController.userImage.value.isNotEmpty
                          ? NetworkImage(userController.userImage.value)
                          : const AssetImage('assets/images/avatar/avatar.png')
                    ),
                  );
                }),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: size.width,
                child:  Center(
                  child: Column(
                    children: [
                      Obx(() => Text(
                        userController.username.value,
                        style: const TextStyle(
                          color: AppColorsLight.teksPrimary,
                          fontSize: 21,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                      Obx(() => Text(
                        userController.email.value,
                        style: const TextStyle(
                          color: AppColorsLight.teksPrimary,
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                      )),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 70.0,
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0),
                      ),
                      color: AppColorsLight.primary,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4.0,
                          offset: Offset(-4, -4),
                          color: Colors.white,
                          // inset: true
                        ),
                      ]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 35, right: 24, left: 24, bottom: 0
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                            'Settings & Preferences',
                            style: TextStyle(
                                color: AppColorsLight.teksPrimary,
                                fontSize: 12,
                                fontWeight: FontWeight.w500
                            )
                        ),
                        const SizedBox(height: 30),
                        SizedBox(
                          width: 360,
                          height: 55,
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                PageRouteBuilder(
                                  pageBuilder: (
                                      context,
                                      animation,
                                      secondaryAnimation) => EditProfilePage(),
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
                                borderRadius: BorderRadius.circular(10),
                                color: AppColorsLight.primary,
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 3.0,
                                    offset: Offset(-4, -4),
                                    color: Colors.white,
                                  ),
                                  BoxShadow(
                                    blurRadius: 3.0,
                                    offset: Offset(4, 4),
                                    color: Color(0xFFD4D4D4),
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 20),
                                        child: Container(
                                          alignment: Alignment.center,
                                          width: 25,
                                          height: 25,
                                          child: ColorFiltered(
                                            colorFilter: const ColorFilter.mode(
                                              AppColorsLight.teksThird,
                                              BlendMode.srcIn,
                                            ),
                                            child: Image.asset('assets/icons/account.png'),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      const Text(
                                        'Edit Profile',
                                        style: TextStyle(
                                          color: AppColorsLight.teksThird,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(right: 20),
                                    child: Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      color: AppColorsLight.teksThird,
                                      size: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                          ),
                        ),
                        const SizedBox(height: 30),
                        SizedBox(
                          width: 360,
                          height: 55,
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                PageRouteBuilder(
                                  pageBuilder: (
                                      context,
                                      animation,
                                      secondaryAnimation) => const SecurityPage(),
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
                                borderRadius: BorderRadius.circular(10),
                                color: AppColorsLight.primary,
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 3.0,
                                    offset: Offset(-4, -4),
                                    color: Colors.white,
                                  ),
                                  BoxShadow(
                                    blurRadius: 3.0,
                                    offset: Offset(4, 4),
                                    color: Color(0xFFD4D4D4),
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 20),
                                        child: Container(
                                          alignment: Alignment.center,
                                          width: 25,
                                          height: 25,
                                          child: ColorFiltered(
                                            colorFilter: const ColorFilter.mode(
                                              AppColorsLight.teksThird,
                                              BlendMode.srcIn,
                                            ),
                                            child: Image.asset('assets/icons/security.png'),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      const Text(
                                        'Security',
                                        style: TextStyle(
                                          color: AppColorsLight.teksThird,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(right: 20),
                                    child: Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      color: AppColorsLight.teksThird,
                                      size: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                          ),
                        ),
                        const SizedBox(height: 30),
                        SizedBox(
                          width: 360,
                          height: 55,
                          child: InkWell(
                            onTap: () {

                              Navigator.of(context).push(
                                PageRouteBuilder(
                                  pageBuilder: (
                                      context,
                                      animation,
                                      secondaryAnimation) => const AboutScreen(),
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
                                borderRadius: BorderRadius.circular(10),
                                color: AppColorsLight.primary,
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 3.0,
                                    offset: Offset(-4, -4),
                                    color: Colors.white,
                                  ),
                                  BoxShadow(
                                    blurRadius: 3.0,
                                    offset: Offset(4, 4),
                                    color: Color(0xFFD4D4D4),
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 20),
                                        child: Container(
                                          alignment: Alignment.center,
                                          width: 25,
                                          height: 25,
                                          child: ColorFiltered(
                                            colorFilter: const ColorFilter.mode(
                                              AppColorsLight.teksThird,
                                              BlendMode.srcIn,
                                            ),
                                            child: Image.asset('assets/icons/about.png'),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      const Text(
                                        'About GreenVision',
                                        style: TextStyle(
                                          color: AppColorsLight.teksThird,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(right: 20),
                                    child: Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      color: AppColorsLight.teksThird,
                                      size: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                          ),
                        ),
                        const SizedBox(height: 30),
                        SizedBox(
                          width: 360,
                          height: 55,
                          child: InkWell(
                            onTap: () {
                              // Share.share('');
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColorsLight.primary,
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 3.0,
                                    offset: Offset(-4, -4),
                                    color: Colors.white,
                                  ),
                                  BoxShadow(
                                    blurRadius: 3.0,
                                    offset: Offset(4, 4),
                                    color: Color(0xFFD4D4D4),
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 20),
                                        child: Container(
                                          alignment: Alignment.center,
                                          width: 25,
                                          height: 25,
                                          child: ColorFiltered(
                                            colorFilter: const ColorFilter.mode(
                                              AppColorsLight.teksThird,
                                              BlendMode.srcIn,
                                            ),
                                            child: Image.asset('assets/icons/share.png'),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      const Text(
                                        'Share App',
                                        style: TextStyle(
                                          color: AppColorsLight.teksThird,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(right: 20),
                                    child: Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      color: AppColorsLight.teksThird,
                                      size: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                          ),
                        ),
                        const SizedBox(height: 30),
                        SizedBox(
                          width: 360,
                          height: 55,
                          child: InkWell(
                            onTap: () {
                              controller.showLogoutConfirmationDialog(context);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColorsLight.primary,
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 3.0,
                                    offset: Offset(-4, -4),
                                    color: Colors.white,
                                  ),
                                  BoxShadow(
                                    blurRadius: 3.0,
                                    offset: Offset(4, 4),
                                    color: Color(0xFFD4D4D4),
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 20),
                                        child: Container(
                                          alignment: Alignment.center,
                                          width: 25,
                                          height: 25,
                                          child: ColorFiltered(
                                            colorFilter: const ColorFilter.mode(
                                              AppColorsLight.teksThird,
                                              BlendMode.srcIn,
                                            ),
                                            child: Image.asset('assets/icons/logout.png'),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      const Text(
                                        'Log out',
                                        style: TextStyle(
                                          color: AppColorsLight.teksThird,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(right: 20),
                                    child: Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      color: AppColorsLight.teksThird,
                                      size: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                  ),
                ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}