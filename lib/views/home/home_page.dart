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

class HomePage extends StatelessWidget {

  final UserController userController = Get.put(UserController());
  final WeatherController weatherController = Get.put(WeatherController());
  final ArticleController articleController = Get.put(ArticleController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorsLight.primary,
      body: SingleChildScrollView(
        child: Padding(
          padding:
          const EdgeInsets.only(top: 55, bottom: 92, left: 17, right: 25),
          child: SafeArea(
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, ),
                      child: Container(
                          height: 48,
                          width: 49,
                          child: Image.asset('assets/images/avatar/avatar.png')),
                    ),
                    SizedBox(
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
                        SizedBox(
                          width: 2,
                        ),
                        Obx(() => Text(
                          userController.username.value,
                          style: GoogleFonts.dmSans(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        )
                      ],
                    ),
                    SizedBox(
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
                SizedBox(
                  height: 46.5,
                ),
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
                    padding: EdgeInsets.only(
                        top: 22, bottom: 21, right: 32.5, left: 32.5),
                    child: Obx(() {
                      final weather = weatherController.weather.value;

                      if (weather != null) {
                        return Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Display dynamic current temperature
                                Text(
                                  '${weather.temperature}°', // Rounded to 1 decimal
                                  style: GoogleFonts.sora(
                                      fontSize: 30,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black),
                                ),
                                // Display high and low temperatures
                                Text(
                                  'H:${weather.highTemperature}°  L:${weather.lowTemperature}°',
                                  style: GoogleFonts.sora(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black),
                                ),
                                // Display city name
                                Text(
                                  weather.cityName,
                                  style: GoogleFonts.sora(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 80,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 74,
                                  height: 68,
                                  // Display the weather animation based on the main condition
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
                        return const CircularProgressIndicator(); // Loading state
                      }
                    }),
                  ),
                ),
                SizedBox(
                  height: 46.5,

                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
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
                SizedBox(
                  height: 19,
                ),
                Container(
                    child: Column(
                      children: [
                        Container(
                          width: 340,
                          height: 106,
                          decoration: BoxDecoration(
                            color: AppColorsLight.cardPrimary,
                            borderRadius: BorderRadius.circular(
                                8), // Setting the border radius here
                          ),
                          child: Obx(() {
                            if (articleController.isLoading.value) {
                              return  const Center(
                                child: CircularProgressIndicator(), // Loading spinner
                              );
                            } else if (articleController.errorMessage.isNotEmpty) {
                              return Center(
                                child: Text(
                                  articleController.errorMessage.value,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.red,
                                  ),
                                ),
                              );
                            } else if (articleController.articles.isEmpty) {
                              return const Center(
                                child: Text('No articles found.'),
                              );
                            } else {
                              final article = articleController.articles[0];
                              return Container(
                                width: 325,
                                height: 110,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
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
                                padding: const EdgeInsets.all(19.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Gambar dari API
                                    Center(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15.0),
                                        child: Image.network(
                                          article['img'] ?? 'https://via.placeholder.com/75',
                                          width: 60,
                                          height: 60,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 14.0),
                                    // Teks di sebelah kanan gambar
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            article['title'] ?? 'No Title',
                                            style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black87,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            article['deskripsi'] ?? 'No description available.',
                                            style: const TextStyle(
                                              fontSize: 7,
                                              color: Colors.black54,
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          GestureDetector(
                                            onTap: () {

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
                            }
                          }),

                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          width: 340,
                          height: 106,
                          decoration: BoxDecoration(
                            color: AppColorsLight.cardPrimary,
                            borderRadius: BorderRadius.circular(
                                8),
                          ),
                          child: Obx(() {
                            if (articleController.isLoading.value) {
                              return const Center(
                                child: CircularProgressIndicator(), // Loading spinner
                              );
                            } else if (articleController.errorMessage.isNotEmpty) {
                              return Center(
                                child: Text(
                                  articleController.errorMessage.value,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.red,
                                  ),
                                ),
                              );
                            } else if (articleController.articles.isEmpty) {
                              return const Center(
                                child: Text('No articles found.'),
                              );
                            } else {
                              final article = articleController.articles[0];
                              return Container(
                                width: 325,
                                height: 110,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
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
                                padding: const EdgeInsets.all(19.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Gambar dari API
                                    Center(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15.0),
                                        child: Image.network(
                                          article['img'] ?? 'https://via.placeholder.com/75',
                                          width: 60,
                                          height: 60,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 14.0),
                                    // Teks di sebelah kanan gambar
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            article['title'] ?? 'No Title',
                                            style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black87,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            article['deskripsi'] ?? 'No description available.',
                                            style: const TextStyle(
                                              fontSize: 7,
                                              color: Colors.black54,
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          GestureDetector(
                                            onTap: () {

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
                            }
                          }),

                        ),

                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          width: 340,
                          height: 106,
                          decoration: BoxDecoration(
                            color: AppColorsLight.cardPrimary,
                            borderRadius: BorderRadius.circular(
                                8),
                          ),
                          child: Obx(() {
                            if (articleController.isLoading.value) {
                              return const Center(
                                child: CircularProgressIndicator(), // Loading spinner
                              );
                            } else if (articleController.errorMessage.isNotEmpty) {
                              return Center(
                                child: Text(
                                  articleController.errorMessage.value,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.red,
                                  ),
                                ),
                              );
                            } else if (articleController.articles.isEmpty) {
                              return const Center(
                                child: Text('No articles found.'),
                              );
                            } else {
                              final article = articleController.articles[0];
                              return Container(
                                width: 325,
                                height: 110,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
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
                                padding: const EdgeInsets.all(19.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Gambar dari API
                                    Center(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15.0),
                                        child: Image.network(
                                          article['img'] ?? 'https://via.placeholder.com/75',
                                          width: 60,
                                          height: 60,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 14.0),
                                    // Teks di sebelah kanan gambar
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            article['title'] ?? 'No Title',
                                            style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black87,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            article['deskripsi'] ?? 'No description available.',
                                            style: const TextStyle(
                                              fontSize: 7,
                                              color: Colors.black54,
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          GestureDetector(
                                            onTap: () {

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
                            }
                          }),

                        ),

                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          width: 340,
                          height: 106,
                          decoration: BoxDecoration(
                            color: AppColorsLight.cardPrimary,
                            borderRadius: BorderRadius.circular(
                                8),
                          ),
                          child: Obx(() {
                            if (articleController.isLoading.value) {
                              return const Center(
                                child: CircularProgressIndicator(), // Loading spinner
                              );
                            } else if (articleController.errorMessage.isNotEmpty) {
                              return Center(
                                child: Text(
                                  articleController.errorMessage.value,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.red,
                                  ),
                                ),
                              );
                            } else if (articleController.articles.isEmpty) {
                              return const Center(
                                child: Text('No articles found.'),
                              );
                            } else {
                              final article = articleController.articles[0];
                              return Container(
                                width: 325,
                                height: 110,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
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
                                padding: const EdgeInsets.all(19.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Gambar dari API
                                    Center(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15.0),
                                        child: Image.network(
                                          article['img'] ?? 'https://via.placeholder.com/75',
                                          width: 60,
                                          height: 60,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 14.0),
                                    // Teks di sebelah kanan gambar
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            article['title'] ?? 'No Title',
                                            style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black87,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            article['deskripsi'] ?? 'No description available.',
                                            style: const TextStyle(
                                              fontSize: 7,
                                              color: Colors.black54,
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          GestureDetector(
                                            onTap: () {

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
                            }
                          }),

                        ),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
