import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_vision/constants/colors.dart';
import 'package:green_vision/routes/app_routes_named.dart';
import 'package:green_vision/shared/widgets/buttom_nav_bar.dart';

import '../../controller/comunity_controller.dart';
import 'CreateComunity_page.dart';

class ComunityPage extends StatelessWidget {
  const ComunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    final communityController = Get.put(ComunityController());

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => const CreatecomunityPage());
        },
        backgroundColor: AppColorsLight.third,
        child: Image.asset(
            'assets/icons/create.png',
          width: 22,
          height: 22,
        ),
      ),
      backgroundColor: AppColorsLight.primary,
      body: SafeArea(
        child: Obx(() {
          if (communityController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          if (communityController.errorMessage.isNotEmpty) {
            return Center(
              child: Text(
                communityController.errorMessage.value,
                style: GoogleFonts.dmSans(
                  fontSize: 14,
                  color: Colors.red,
                ),
              ),
            );
          }

          final communities = communityController.communities;

          return SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Container(
                    height: 38,
                    width: 335,
                    child: Center(
                      child: Text(
                        "Comunity",
                        style: GoogleFonts.dmSans(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                ...communities.map((community) => Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: 360,
                              height: 317,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: AppColorsLight.primary,
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 4.0,
                                    offset: Offset(-4, -4),
                                    color: Colors.white,
                                  ),
                                  BoxShadow(
                                    blurRadius: 4.0,
                                    offset: Offset(4, 4),
                                    color: Color(0xFFD4D4D4),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 50, right: 20),
                                      child: SizedBox(
                                          height: 28,
                                          width: 29,
                                          child: Image.asset('assets/images/avatar/image.png')),
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: 150),
                                        Text(
                                          community['name'] ?? "Unknown",
                                          style: GoogleFonts.dmSans(
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold,
                                            color: AppColorsLight.teksPrimary,
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          community['description'] ?? "No description",
                                          style: GoogleFonts.dmSans(
                                            fontSize: 7,
                                            fontWeight: FontWeight.normal,
                                            color: AppColorsLight.teksThird,
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                        Row(
                                          children: [
                                            const Icon(Icons.ac_unit_sharp, color: Colors.grey, size: 13),
                                            const SizedBox(width: 5),
                                            Text(
                                              "12rb",
                                              style: GoogleFonts.dmSans(
                                                fontSize: 8,
                                                fontWeight: FontWeight.normal,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            const SizedBox(width: 7),
                                            const Icon(Icons.share, color: Colors.grey, size: 13),
                                            const SizedBox(width: 5),
                                            Text(
                                              "160",
                                              style: GoogleFonts.dmSans(
                                                fontSize: 8,
                                                fontWeight: FontWeight.normal,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            const SizedBox(width: 7),
                                            const Icon(Icons.chat, color: Colors.grey, size: 13),
                                            const SizedBox(width: 5),
                                            Text(
                                              "100",
                                              style: GoogleFonts.dmSans(
                                                fontSize: 8,
                                                fontWeight: FontWeight.normal,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: 360,
                              height: 155,
                              decoration: BoxDecoration(
                                color: AppColorsLight.primary,
                                image: DecorationImage(
                                  image: NetworkImage(community['img'] ?? ''),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )),
              ],
            ),
          );
        }),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
