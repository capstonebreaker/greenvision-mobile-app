import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_vision/constants/colors.dart';
import 'package:green_vision/shared/widgets/buttom_nav_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 55, bottom: 92, left: 17, right: 25),
          child: SafeArea(
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                        height: 48,
                        width: 49,
                        child: Image.asset('assets/images/avatar/avatar.png')),
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
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          "Loki Laufeyson",
                          style: GoogleFonts.dmSans(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
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
                        child: Image.asset('assets/icons/notification.png'))
                  ],
                ),
                SizedBox(
                  height: 46.5,
                ),
                // Container(
                //   width: 340,
                //   height: 121,
                //   decoration: BoxDecoration(
                //     color: AppColorsDark.aksen,
                //     borderRadius: BorderRadius.circular(
                //         25), // Setting the border radius here
                //   ),
                //   child: Padding(
                //     padding: EdgeInsets.only(
                //         top: 22, bottom: 21, right: 32.5, left: 32.5),
                //     child: Obx(() {
                //       final weather = weatherController.weather.value;
                //
                //       if (weather != null) {
                //         return Row(
                //           children: [
                //             Column(
                //               crossAxisAlignment:
                //               CrossAxisAlignment.start,
                //               children: [
                //                 // Display dynamic current temperature
                //                 Text(
                //                   '${weather.temperature}°', // Rounded to 1 decimal
                //                   style: GoogleFonts.sora(
                //                       fontSize: 30,
                //                       fontWeight: FontWeight.normal,
                //                       color: Colors.white),
                //                 ),
                //                 // Display high and low temperatures
                //                 Text(
                //                   'H:${weather.highTemperature}°  L:${weather.lowTemperature}°',
                //                   style: GoogleFonts.sora(
                //                       fontSize: 12,
                //                       fontWeight: FontWeight.normal,
                //                       color: Colors.white),
                //                 ),
                //                 // Display city name
                //                 Text(
                //                   weather.cityName,
                //                   style: GoogleFonts.sora(
                //                       fontSize: 12,
                //                       fontWeight: FontWeight.normal,
                //                       color: Colors.white),
                //                 ),
                //               ],
                //             ),
                //             SizedBox(
                //               width: 80,
                //             ),
                //             Column(
                //               mainAxisAlignment: MainAxisAlignment.center,
                //               children: [
                //                 Container(
                //                   width: 69,
                //                   height: 54,
                //                   // Display the weather animation based on the main condition
                //                   child: Lottie.asset(weatherController
                //                       .getWeatherAnimation(
                //                       weather.mainCondition)),
                //                 ),
                //               ],
                //             )
                //           ],
                //         );
                //       } else if (weatherController
                //           .errorMessage.value.isNotEmpty) {
                //         return Text(
                //           weatherController.errorMessage.value,
                //           style: GoogleFonts.sora(
                //               fontSize: 12,
                //               fontWeight: FontWeight.normal,
                //               color: Colors.red),
                //         );
                //       } else {
                //         return const CircularProgressIndicator(); // Loading state
                //       }
                //     }),
                //   ),
                // ),
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
                SizedBox(
                  height: 19,
                ),
                Container(
                    height: 247,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Container(
                          width: 154,
                          height: 187,
                          decoration: BoxDecoration(
                            color: AppColorsDark.aksen,
                            borderRadius: BorderRadius.circular(
                                8), // Setting the border radius here
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 9, bottom: 0, right: 6.5, left: 6.5),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 141,
                                      height: 94,
                                      child: Image.asset(
                                          'assets/images/news/image1.png'),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      '100 Hektare Lahan Pertanian di \nDenpasar Lenyap Akibat Alih \nFungsi Lahan',
                                      style: GoogleFonts.sora(
                                          fontSize: 7,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      'Denpasar - Sebanyak 100 hektare (ha) \nlahan pertanian di Kota Denpasar \nberkurang pada 2023. Hal itu diakibatkan \noleh masifnya alih fungsi lahan',
                                      style: GoogleFonts.sora(
                                          fontSize: 6,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.white),
                                    ),
                                    SizedBox(
                                      height: 17,
                                    ),
                                    Container(
                                      height: 14,
                                      width: 100,
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  AppColorsDark.third,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10))),
                                          onPressed: () {},
                                          child: Text(
                                            "Baca Selengkapnya",
                                            style: GoogleFonts.dmSans(
                                                fontSize: 5,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white),
                                          )),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Container(
                          width: 154,
                          height: 187,
                          decoration: BoxDecoration(
                            color: AppColorsDark.aksen,
                            borderRadius: BorderRadius.circular(
                                8), // Setting the border radius here
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 9, bottom: 0, right: 6.5, left: 6.5),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 141,
                                      height: 94,
                                      child: Image.asset(
                                          'assets/images/news/image1.png'),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      '100 Hektare Lahan Pertanian di \nDenpasar Lenyap Akibat Alih \nFungsi Lahan',
                                      style: GoogleFonts.sora(
                                          fontSize: 7,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      'Denpasar - Sebanyak 100 hektare (ha) \nlahan pertanian di Kota Denpasar \nberkurang pada 2023. Hal itu diakibatkan \noleh masifnya alih fungsi lahan',
                                      style: GoogleFonts.sora(
                                          fontSize: 6,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.white),
                                    ),
                                    SizedBox(
                                      height: 17,
                                    ),
                                    Container(
                                      height: 14,
                                      width: 100,
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                              AppColorsDark.third,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(10))),
                                          onPressed: () {},
                                          child: Text(
                                            "Baca Selengkapnya",
                                            style: GoogleFonts.dmSans(
                                                fontSize: 5,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white),
                                          )),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Container(
                          width: 154,
                          height: 187,
                          decoration: BoxDecoration(
                            color: AppColorsDark.aksen,
                            borderRadius: BorderRadius.circular(
                                8), // Setting the border radius here
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 9, bottom: 0, right: 6.5, left: 6.5),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 141,
                                      height: 94,
                                      child: Image.asset(
                                          'assets/images/news/image1.png'),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      '100 Hektare Lahan Pertanian di \nDenpasar Lenyap Akibat Alih \nFungsi Lahan',
                                      style: GoogleFonts.sora(
                                          fontSize: 7,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      'Denpasar - Sebanyak 100 hektare (ha) \nlahan pertanian di Kota Denpasar \nberkurang pada 2023. Hal itu diakibatkan \noleh masifnya alih fungsi lahan',
                                      style: GoogleFonts.sora(
                                          fontSize: 6,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.white),
                                    ),
                                    SizedBox(
                                      height: 17,
                                    ),
                                    Container(
                                      height: 14,
                                      width: 100,
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                              AppColorsDark.third,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(10))),
                                          onPressed: () {},
                                          child: Text(
                                            "Baca Selengkapnya",
                                            style: GoogleFonts.dmSans(
                                                fontSize: 5,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white),
                                          )),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
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
