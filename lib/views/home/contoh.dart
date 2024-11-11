import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_vision/constants/colors.dart';
import 'package:green_vision/shared/widgets/buttom_nav_bar.dart';
import 'package:lottie/lottie.dart';
import '../../controller/article_controller.dart'; // Import the new controller

class HomePage extends StatelessWidget {
  final ArticleController articleController = Get.put(ArticleController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 55, bottom: 92, left: 17, right: 25),
          child: SafeArea(
            child: Column(
              children: [
                // Other UI elements...
                SizedBox(height: 46.5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Education',
                      style: GoogleFonts.dmSans(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(height: 19),
                Container(
                  height: 247,
                  child: Obx(() {
                    if (articleController.isLoading.value) {
                      return Center(child: CircularProgressIndicator());
                    } else if (articleController.errorMessage.isNotEmpty) {
                      return Center(
                        child: Text(
                          articleController.errorMessage.value,
                          style: GoogleFonts.sora(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            color: Colors.red,
                          ),
                        ),
                      );
                    } else if (articleController.articles.isEmpty) {
                      return Center(child: Text('No articles found.'));
                    } else {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: articleController.articles.length,
                        itemBuilder: (context, index) {
                          final article = articleController.articles[index];
                          return Container(
                            width: 154,
                            height: 187,
                            margin: EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                              color: AppColorsDark.aksen,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(top: 9, bottom: 0, right: 6.5, left: 6.5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 141,
                                    height: 94,
                                    child: Image.network(
                                      article['img'] ?? 'https://via.placeholder.com/141x94',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    article['title'] ?? 'No Title',
                                    style: GoogleFonts.sora(
                                      fontSize: 7,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    article['deskripsi'] ?? 'No description available.',
                                    style: GoogleFonts.sora(
                                      fontSize: 6,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 17),
                                  Container(
                                    height: 14,
                                    width: 100,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColorsDark.third,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                      ),
                                      onPressed: () {},
                                      child: Text(
                                        "Baca Selengkapnya",
                                        style: GoogleFonts.dmSans(
                                          fontSize: 5,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
