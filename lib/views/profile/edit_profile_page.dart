import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_vision/constants/colors.dart';

import '../../controller/user_controller.dart';

class EditProfilePage extends StatelessWidget {
  final UserController userController = Get.find();

  EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
                // inset: true
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
                    child: const CircleAvatar(
                      radius: 55,
                      backgroundImage: ExactAssetImage('assets/images/avatar/avatar.png'),
                    ),
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
                    ))
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
                          color: AppColorsLight.teksPrimary,),
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
                              inset: true
                          ),
                          BoxShadow(
                              blurRadius: 4,
                              offset: Offset(4, 4),
                              color: Color(0xFFD4D4D4),
                              inset: true
                          ),
                        ],
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Username',
                          hintStyle: GoogleFonts.dmSans(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 14.0, horizontal: 16.0
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
                        color: AppColorsLight.teksPrimary,),
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
                              inset: true
                          ),
                          BoxShadow(
                              blurRadius: 4,
                              offset: Offset(4, 4),
                              color: Color(0xFFD4D4D4),
                              inset: true
                          ),
                        ],
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Username@gmail.com',
                          hintStyle: GoogleFonts.dmSans(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 14.0, horizontal: 16.0
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
                        color: AppColorsLight.teksPrimary,),
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
                              inset: true
                          ),
                          BoxShadow(
                              blurRadius: 4,
                              offset: Offset(4, 4),
                              color: Color(0xFFD4D4D4),
                              inset: true
                          ),
                        ],
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: '********',
                          hintStyle: GoogleFonts.dmSans(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 14.0, horizontal: 16.0
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    Text(
                      'Confirm Password',
                      style: GoogleFonts.dmSans(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: AppColorsLight.teksPrimary,),
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
                              inset: true
                          ),
                          BoxShadow(
                              blurRadius: 4,
                              offset: Offset(4, 4),
                              color: Color(0xFFD4D4D4),
                              inset: true
                          ),
                        ],
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: '********',
                          hintStyle: GoogleFonts.dmSans(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 14.0, horizontal: 16.0
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 90),
                    SizedBox(
                      width: 360,
                      height: 55,
                      child: InkWell(
                        onTap: () {
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
