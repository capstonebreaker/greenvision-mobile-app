import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_vision/constants/colors.dart';
import 'package:green_vision/shared/widgets/buttom_nav_bar.dart';
import 'package:lottie/lottie.dart';

import '../../controller/article_controller.dart';
import '../../controller/user_controller.dart';
import '../../controller/weather_controller.dart';
import 'detail_article_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final UserController userController = Get.put(UserController());
  final WeatherController weatherController = Get.put(WeatherController());
  final ArticleController articleController = Get.put(ArticleController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorsLight.primary,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 55, bottom: 25, left: 25, right: 25),
          child: SafeArea(
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: SizedBox(
                          height: 48,
                          width: 49,
                          child: Image.asset('assets/images/avatar/image.png')),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello, Welcome  🎉",
                          style: GoogleFonts.dmSans(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        Obx(() => Text(
                          userController.username.value,
                          style: GoogleFonts.dmSans(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                          ),
                        ))
                      ],
                    ),
                    const SizedBox(
                      width: 100,
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 20,
                      height: 20,
                      child: ColorFiltered(
                        colorFilter: const ColorFilter.mode(
                          Colors.black,
                          BlendMode.srcIn,
                        ),
                        child: Image.asset('assets/icons/notification.png'),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 46.5,
                ),
                // Weather Section
                Container(
                  width: 340,
                  height: 128,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
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
                        )
                      ]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 22, bottom: 21, right: 31.5, left: 31.5),
                    child: Obx(() {
                      final weather = weatherController.weather.value;

                      if (weather != null) {
                        return Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${weather.temperature}°',
                                  style: GoogleFonts.sora(
                                      fontSize: 30,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black),
                                ),
                                Text(
                                  'H:${weather.highTemperature}°  L:${weather.lowTemperature}°',
                                  style: GoogleFonts.sora(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black),
                                ),
                                Text(
                                  weather.cityName,
                                  style: GoogleFonts.sora(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 80,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 74,
                                  height: 68,
                                  child: Lottie.asset(weatherController
                                      .getWeatherAnimation(
                                      weather.mainCondition)),
                                ),
                              ],
                            )
                          ],
                        );
                      } else if (weatherController.errorMessage.value.isNotEmpty) {
                        return Text(
                          weatherController.errorMessage.value,
                          style: GoogleFonts.sora(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: Colors.red),
                        );
                      } else {
                        return const CircularProgressIndicator();
                      }
                    }),
                  ),
                ),
                const SizedBox(
                  height: 46.5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        'Education',
                        style: GoogleFonts.dmSans(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black),
                      ),
                    ),
                  ],
                ),
                Obx(() {
                  if (articleController.isLoading.value) {
                    return const Center(
                        child: CircularProgressIndicator(),
                    );
                  } else if (articleController.errorMessage.isNotEmpty) {
                    return Center(
                      child: Text(
                        articleController.errorMessage.value,
                        style: const TextStyle(fontSize: 12, color: Colors.red),
                      ),
                    );
                  } else if (articleController.articles.isEmpty) {
                    return const Center(child: Text('No articles found.'));
                  } else {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: articleController.articles.length,
                      padding: const EdgeInsets.all(8.0),
                      itemBuilder: (context, index) {
                        final article = articleController.articles[index];
                        return Container(
                          width: 340,
                          height: 106,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
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
                                    color: Color(0xFFD4D4D4)
                                )
                              ]
                          ),
                          margin: const EdgeInsets.symmetric(vertical: 11.0),
                          padding: const EdgeInsets.symmetric(horizontal: 19.0, vertical: 15.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Image.network(
                                    article['img'] ?? 'https://via.placeholder.com/75',
                                    width: 70,
                                    height: 70,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 14.0),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      article['title']!.split(' ').length > 4
                                          ? '${article['title']!.split(' ').sublist(0, 4).join(' ')}...'
                                          : article['title']!,
                                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black87),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      article['deskripsi']!.split(' ').length > 10
                                          ? '${article['deskripsi']!.split(' ').sublist(0, 10).join(' ')}...'
                                          : article['deskripsi']!,
                                      style: const TextStyle(fontSize: 9, color: Colors.black54),
                                    ),
                                    const SizedBox(height: 8),
                                    GestureDetector(
                                      onTap: () {
                                        Get.to(() => DetailArticlePage(articleData: article));
                                        },
                                      child: const Text(
                                        'Baca selengkapnya >',
                                        style: TextStyle(
                                          fontSize: 8,
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }
                }),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
