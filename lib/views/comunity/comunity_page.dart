import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_vision/constants/colors.dart';
import 'package:green_vision/shared/widgets/buttom_nav_bar.dart';
import '../../controller/comunity_controller.dart';
import '../../controller/user_controller.dart';
import '../chat_bot/chat_bot_page_model.dart';
import 'CreateComunity_page.dart';

class ComunityPage extends StatelessWidget {
  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    final communityController = Get.put(ComunityController());

    return Scaffold(
      floatingActionButton: Stack(
        children: [
          Positioned(
            bottom: 16, // Jarak tombol bawah dari bawah layar
            right: 16,  // Jarak tombol dari kanan layar
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Floating Button Atas
                FloatingActionButton(
                  onPressed: () {
                    Get.to(() => const CreatecomunityPage());
                  },
                  backgroundColor: AppColorsLight.third,
                  child: const Icon(Icons.group_add),
                ),
                const SizedBox(height: 16), // Jarak antara tombol atas dan bawah
                // Floating Button Bawah
                FloatingActionButton(
                  onPressed: () {
                    Get.to(() => const ChatBotPageModel());
                  },
                  backgroundColor: AppColorsLight.third,
                  child: const Icon(Icons.chat),
                ),
              ],
            ),
          ),
        ],
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
                const SizedBox(height: 20),
                Center(
                  child: Text(
                    "Comunity",
                    style: GoogleFonts.dmSans(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ...communities.map((community) => Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                    child: Stack(
                      children: [
                        Container(
                          width: 360,
                          height: 380,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: AppColorsLight.primary,
                            boxShadow: const [
                              BoxShadow(
                                  color: Color(0xFFffffff),
                                  offset: Offset(-2, -2),
                                  blurRadius: 2
                              ),
                              BoxShadow(
                                  color: Color(0xFFbebebe),
                                  offset: Offset(2, 2),
                                  blurRadius: 2
                              )
                            ],
                          ),
                          child: Column(
                            children: [
                              Container(
                                width: 360,
                                height: 160,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(25),
                                    topRight: Radius.circular(25),
                                  ),
                                  image: DecorationImage(
                                    image: NetworkImage(community['img'] ?? ''),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Obx(() => Row(
                                      children: [
                                        const SizedBox(
                                          height: 40,
                                          width: 40,
                                          child: CircleAvatar(
                                            backgroundImage: AssetImage('assets/images/avatar/image.png'),
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Text(
                                          userController.username.value,
                                          style: GoogleFonts.dmSans(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    )),
                                    const SizedBox(height: 10),
                                    Text(
                                      community['title'] ?? "No title",
                                      style: GoogleFonts.dmSans(
                                        fontSize: 12,
                                        color: AppColorsLight.teksThird,
                                      ),
                                    ),
                                    Text(
                                      community['description']!.split(' ').length > 15
                                          ? '${community['description']!.split(' ').sublist(0, 15).join(' ')}...'
                                          : community ['description']!,
                                      style: GoogleFonts.dmSans(
                                        fontSize: 12,
                                        color: AppColorsLight.teksThird,
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Row(
                                          children: [
                                            const Icon(Icons.ac_unit_sharp, color: Colors.grey, size: 16),
                                            const SizedBox(width: 4),
                                            Text(
                                              "12rb",
                                              style: GoogleFonts.dmSans(fontSize: 12, color: Colors.black),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Icon(Icons.chat, size: 16, color: Colors.grey),
                                            const SizedBox(width: 4),
                                            Text(
                                              "160",
                                              style: GoogleFonts.dmSans(fontSize: 12, color: Colors.black),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Icon(Icons.share, size: 16, color: Colors.grey),
                                            const SizedBox(width: 4),
                                            Text(
                                              "200",
                                              style: GoogleFonts.dmSans(fontSize: 12, color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
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
