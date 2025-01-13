import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_vision/constants/colors.dart';
import 'package:green_vision/controller/user_controller.dart';

class EditProfilePage extends StatelessWidget {
  final UserController userController = Get.find();

  EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // Text editing controllers for updating user details
    final TextEditingController usernameController = TextEditingController(text: userController.username.value);
    final TextEditingController emailController = TextEditingController(text: userController.email.value);
    final TextEditingController passwordController = TextEditingController(text: userController.password.value);

    // Perbarui nilai ketika TextField berubah
    usernameController.addListener(() {
      userController.setUsername(usernameController.text);
    });

    emailController.addListener(() {
      userController.setEmail(emailController.text);
    });

    return Scaffold(
      backgroundColor: AppColorsLight.primary,
      appBar: AppBar(
        backgroundColor: AppColorsLight.primary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Edit Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(45.0),
              topRight: Radius.circular(45.0),
            ),
            color: AppColorsLight.primary,
            boxShadow: [
              BoxShadow(
                blurRadius: 4.0,
                offset: Offset(-4, -4),
                color: Colors.white,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Center(
                  child: Container(
                    width: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.black.withOpacity(0.5),
                        width: 2.0,
                      ),
                    ),
                    child: Obx(() {
                      return CircleAvatar(
                        radius: 55,
                        backgroundImage: userController.userImage.value.isNotEmpty
                            ? NetworkImage(userController.userImage.value)
                            : const AssetImage('assets/images/avatar/avatar.png') as ImageProvider,
                      );
                    }),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Center(
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
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 24, left: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nama',
                      style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: AppColorsLight.teksPrimary,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: AppColorsLight.primary,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 4,
                            offset: Offset(-4, -4),
                            color: Colors.white,
                            inset: true,
                          ),
                          BoxShadow(
                            blurRadius: 4,
                            offset: Offset(4, 4),
                            color: Color(0xFFD4D4D4),
                            inset: true,
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: usernameController,
                        decoration: InputDecoration(
                          hintText: 'Username',
                          hintStyle: GoogleFonts.dmSans(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 14.0,
                            horizontal: 16.0,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    Text(
                      'Email',
                      style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: AppColorsLight.teksPrimary,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: AppColorsLight.primary,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 4,
                            offset: Offset(-4, -4),
                            color: Colors.white,
                            inset: true,
                          ),
                          BoxShadow(
                            blurRadius: 4,
                            offset: Offset(4, 4),
                            color: Color(0xFFD4D4D4),
                            inset: true,
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: 'Username@gmail.com',
                          hintStyle: GoogleFonts.dmSans(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 14.0,
                            horizontal: 16.0,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    Text(
                      'Password',
                      style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: AppColorsLight.teksPrimary,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: AppColorsLight.primary,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 4,
                            offset: Offset(-4, -4),
                            color: Colors.white,
                            inset: true,
                          ),
                          BoxShadow(
                            blurRadius: 4,
                            offset: Offset(4, 4),
                            color: Color(0xFFD4D4D4),
                            inset: true,
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: '********',
                          hintStyle: GoogleFonts.dmSans(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 14.0,
                            horizontal: 16.0,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 200),
                    SizedBox(
                      width: 360,
                      height: 55,
                      child: InkWell(
                        onTap: () {
                          String username = usernameController.text;
                          String email = emailController.text;
                          String password = passwordController.text;

                          // Panggil fungsi updateProfile di UserController
                          userController.updateProfile(
                            userController.userId.value,
                            usernameController.text,
                            emailController.text,
                            passwordController.text.isNotEmpty ? passwordController.text : null,
                          );
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
                              "Simpan Perubahan",
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
