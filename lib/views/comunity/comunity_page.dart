import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green_vision/constants/colors.dart';
import 'package:green_vision/routes/app_routes_named.dart';
import 'package:green_vision/shared/widgets/buttom_nav_bar.dart';

class ComunityPage extends StatelessWidget {
  const ComunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(AppRoutesNamed.pageChatBot);
          },
          child: Text(
            "AI",
            style: GoogleFonts.dmSans(fontWeight: FontWeight.bold,
            color: AppColorsLight.primary)
            ,
          ),
      backgroundColor: AppColorsLight.third,),
      backgroundColor: AppColorsLight.primary,
      body: SafeArea(
        child: SingleChildScrollView(
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
                          fontWeight: FontWeight.normal,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: 319,
                          height: 317,
                          decoration: BoxDecoration(
                            color: AppColorsLight.aksen,
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(0, 4),
                                blurRadius: 10,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Column(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 150,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          height: 23,
                                          width: 23,
                                          child: Image.asset(
                                              'assets/images/avatar/david.png'),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text("BumsYa ",
                                                    style: GoogleFonts.dmSans(
                                                        fontSize: 11,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Colors.black)),
                                                SizedBox(width: 10),
                                                Text("•",
                                                    style: GoogleFonts.dmSans(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black)),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text("Indonesia",
                                                    style: GoogleFonts.dmSans(
                                                        fontSize: 8,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color: Colors.black87)),
                                              ],
                                            ),
                                            Text("2 hr ago",
                                                style: GoogleFonts.dmSans(
                                                    fontSize: 6,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.black87)),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Bantu identifikasi masalah padi",
                                        style: GoogleFonts.dmSans(
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold,
                                            color: AppColorsLight.teksPrimary)),
                                    SizedBox(
                                      height:10,
                                    ),
                                    Text(
                                        "Tips for designing and building a consistent design system. Without doubt, I \nget asked about design systems more than anything else. So, having spent the \nmajority of the past few years thinking about how to...",
                                        style: GoogleFonts.dmSans(
                                            fontSize: 7,
                                            fontWeight: FontWeight.normal,
                                            color: AppColorsLight.teksThird)),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.ac_unit_sharp,
                                          color: Colors.grey,
                                          size: 13,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text("12rb",
                                            style: GoogleFonts.dmSans(
                                                fontSize: 8,
                                                fontWeight: FontWeight.normal,
                                                color: Colors.grey)),
                                        SizedBox(
                                          width: 7,
                                        ),
                                        Icon(
                                          Icons.share,
                                          color: Colors.grey,
                                          size: 13,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text("160",
                                            style: GoogleFonts.dmSans(
                                                fontSize: 8,
                                                fontWeight: FontWeight.normal,
                                                color: Colors.grey)),
                                        SizedBox(
                                          width: 7,
                                        ),
                                        Icon(
                                          Icons.chat,
                                          color: Colors.grey,
                                          size: 13,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text("100",
                                            style: GoogleFonts.dmSans(
                                                fontSize: 8,
                                                fontWeight: FontWeight.normal,
                                                color: Colors.grey)),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 319,
                          height: 145,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(25),
                                  topRight: Radius.circular(25))),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 38,
                    ),
                    Stack(
                      children: [
                        Container(
                          width: 319,
                          height: 317,
                          decoration: BoxDecoration(
                            color: AppColorsLight.aksen,
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(0, 4),
                                blurRadius: 10,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Column(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 150,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          height: 23,
                                          width: 23,
                                          child: Image.asset(
                                              'assets/images/avatar/david.png'),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              children: [
                                                Text("BumsYa ",
                                                    style: GoogleFonts.dmSans(
                                                        fontSize: 11,
                                                        fontWeight:
                                                        FontWeight.w400,
                                                        color: Colors.black)),
                                                SizedBox(width: 10),
                                                Text("•",
                                                    style: GoogleFonts.dmSans(
                                                        fontSize: 15,
                                                        fontWeight:
                                                        FontWeight.bold,
                                                        color: Colors.black)),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text("Indonesia",
                                                    style: GoogleFonts.dmSans(
                                                        fontSize: 8,
                                                        fontWeight:
                                                        FontWeight.normal,
                                                        color: Colors.black87)),
                                              ],
                                            ),
                                            Text("2 hr ago",
                                                style: GoogleFonts.dmSans(
                                                    fontSize: 6,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.black87)),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Bantu identifikasi masalah padi",
                                        style: GoogleFonts.dmSans(
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold,
                                            color: AppColorsLight.teksPrimary)),
                                    SizedBox(
                                      height:10,
                                    ),
                                    Text(
                                        "Tips for designing and building a consistent design system. Without doubt, I \nget asked about design systems more than anything else. So, having spent the \nmajority of the past few years thinking about how to...",
                                        style: GoogleFonts.dmSans(
                                            fontSize: 7,
                                            fontWeight: FontWeight.normal,
                                            color: AppColorsLight.teksThird)),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.ac_unit_sharp,
                                          color: Colors.grey,
                                          size: 13,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text("12rb",
                                            style: GoogleFonts.dmSans(
                                                fontSize: 8,
                                                fontWeight: FontWeight.normal,
                                                color: Colors.grey)),
                                        SizedBox(
                                          width: 7,
                                        ),
                                        Icon(
                                          Icons.share,
                                          color: Colors.grey,
                                          size: 13,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text("160",
                                            style: GoogleFonts.dmSans(
                                                fontSize: 8,
                                                fontWeight: FontWeight.normal,
                                                color: Colors.grey)),
                                        SizedBox(
                                          width: 7,
                                        ),
                                        Icon(
                                          Icons.chat,
                                          color: Colors.grey,
                                          size: 13,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text("100",
                                            style: GoogleFonts.dmSans(
                                                fontSize: 8,
                                                fontWeight: FontWeight.normal,
                                                color: Colors.grey)),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 319,
                          height: 145,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(25),
                                  topRight: Radius.circular(25))),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 38,
                    ),
                    Stack(
                      children: [
                        Container(
                          width: 319,
                          height: 317,
                          decoration: BoxDecoration(
                            color: AppColorsLight.aksen,
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(0, 4),
                                blurRadius: 10,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Column(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 150,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          height: 23,
                                          width: 23,
                                          child: Image.asset(
                                              'assets/images/avatar/david.png'),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              children: [
                                                Text("BumsYa ",
                                                    style: GoogleFonts.dmSans(
                                                        fontSize: 11,
                                                        fontWeight:
                                                        FontWeight.w400,
                                                        color: Colors.black)),
                                                SizedBox(width: 10),
                                                Text("•",
                                                    style: GoogleFonts.dmSans(
                                                        fontSize: 15,
                                                        fontWeight:
                                                        FontWeight.bold,
                                                        color: Colors.black)),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text("Indonesia",
                                                    style: GoogleFonts.dmSans(
                                                        fontSize: 8,
                                                        fontWeight:
                                                        FontWeight.normal,
                                                        color: Colors.black87)),
                                              ],
                                            ),
                                            Text("2 hr ago",
                                                style: GoogleFonts.dmSans(
                                                    fontSize: 6,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.black87)),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Bantu identifikasi masalah padi",
                                        style: GoogleFonts.dmSans(
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold,
                                            color: AppColorsLight.teksPrimary)),
                                    SizedBox(
                                      height:10,
                                    ),
                                    Text(
                                        "Tips for designing and building a consistent design system. Without doubt, I \nget asked about design systems more than anything else. So, having spent the \nmajority of the past few years thinking about how to...",
                                        style: GoogleFonts.dmSans(
                                            fontSize: 7,
                                            fontWeight: FontWeight.normal,
                                            color: AppColorsLight.teksThird)),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.ac_unit_sharp,
                                          color: Colors.grey,
                                          size: 13,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text("12rb",
                                            style: GoogleFonts.dmSans(
                                                fontSize: 8,
                                                fontWeight: FontWeight.normal,
                                                color: Colors.grey)),
                                        SizedBox(
                                          width: 7,
                                        ),
                                        Icon(
                                          Icons.share,
                                          color: Colors.grey,
                                          size: 13,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text("160",
                                            style: GoogleFonts.dmSans(
                                                fontSize: 8,
                                                fontWeight: FontWeight.normal,
                                                color: Colors.grey)),
                                        SizedBox(
                                          width: 7,
                                        ),
                                        Icon(
                                          Icons.chat,
                                          color: Colors.grey,
                                          size: 13,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text("100",
                                            style: GoogleFonts.dmSans(
                                                fontSize: 8,
                                                fontWeight: FontWeight.normal,
                                                color: Colors.grey)),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 319,
                          height: 145,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(25),
                                  topRight: Radius.circular(25))),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 38,
                    ),
                    Stack(
                      children: [
                        Container(
                          width: 319,
                          height: 317,
                          decoration: BoxDecoration(
                            color: AppColorsLight.aksen,
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(0, 4),
                                blurRadius: 10,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Column(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 150,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          height: 23,
                                          width: 23,
                                          child: Image.asset(
                                              'assets/images/avatar/david.png'),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              children: [
                                                Text("BumsYa ",
                                                    style: GoogleFonts.dmSans(
                                                        fontSize: 11,
                                                        fontWeight:
                                                        FontWeight.w400,
                                                        color: Colors.black)),
                                                SizedBox(width: 10),
                                                Text("•",
                                                    style: GoogleFonts.dmSans(
                                                        fontSize: 15,
                                                        fontWeight:
                                                        FontWeight.bold,
                                                        color: Colors.black)),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text("Indonesia",
                                                    style: GoogleFonts.dmSans(
                                                        fontSize: 8,
                                                        fontWeight:
                                                        FontWeight.normal,
                                                        color: Colors.black87)),
                                              ],
                                            ),
                                            Text("2 hr ago",
                                                style: GoogleFonts.dmSans(
                                                    fontSize: 6,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.black87)),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Bantu identifikasi masalah padi",
                                        style: GoogleFonts.dmSans(
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold,
                                            color: AppColorsLight.teksPrimary)),
                                    SizedBox(
                                      height:10,
                                    ),
                                    Text(
                                        "Tips for designing and building a consistent design system. Without doubt, I \nget asked about design systems more than anything else. So, having spent the \nmajority of the past few years thinking about how to...",
                                        style: GoogleFonts.dmSans(
                                            fontSize: 7,
                                            fontWeight: FontWeight.normal,
                                            color: AppColorsLight.teksThird)),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.ac_unit_sharp,
                                          color: Colors.grey,
                                          size: 13,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text("12rb",
                                            style: GoogleFonts.dmSans(
                                                fontSize: 8,
                                                fontWeight: FontWeight.normal,
                                                color: Colors.grey)),
                                        SizedBox(
                                          width: 7,
                                        ),
                                        Icon(
                                          Icons.share,
                                          color: Colors.grey,
                                          size: 13,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text("160",
                                            style: GoogleFonts.dmSans(
                                                fontSize: 8,
                                                fontWeight: FontWeight.normal,
                                                color: Colors.grey)),
                                        SizedBox(
                                          width: 7,
                                        ),
                                        Icon(
                                          Icons.chat,
                                          color: Colors.grey,
                                          size: 13,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text("100",
                                            style: GoogleFonts.dmSans(
                                                fontSize: 8,
                                                fontWeight: FontWeight.normal,
                                                color: Colors.grey)),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 319,
                          height: 145,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(25),
                                  topRight: Radius.circular(25))),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
