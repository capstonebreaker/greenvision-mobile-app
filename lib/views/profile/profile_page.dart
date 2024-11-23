import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColorsLight.primary,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(0),
          height: size.height,
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 55),
                child: Container(
                  width: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.black.withOpacity(.5),
                      width: 2.0
                    )
                  ),
                  child: const CircleAvatar(
                    radius: 60,
                    backgroundImage: ExactAssetImage('assets/images/avatar/avatar.png'),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: size.width,
                child: const Center(
                  child: Column(
                    children: [
                      Text(
                        'Loki Laufeyson',
                        style: TextStyle(
                          color: AppColorsLight.teksPrimary,
                          fontSize: 21,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      Text(
                        'Loki@gmail.com',
                        style: TextStyle(
                          color: AppColorsLight.teksPrimary,
                          fontSize: 16,
                          fontWeight: FontWeight.w300
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 70.0,
              ),
              Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColorsLight.aksen,
                      border: Border.all(
                          color: Colors.black.withOpacity(.5),
                          width: 2.0
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(45.0),
                        topRight: Radius.circular(45.0),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 23, right: 24, left: 24, bottom: 0),
                          child: Container(
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Settings & Preferences',
                                  style: TextStyle(
                                      color: AppColorsLight.teksPrimary,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w300
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.person, color: Colors.black, size: 28),
                                        SizedBox(
                                          width: 16,
                                        ),
                                        Text('Profile', style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16
                                        ),
                                        )
                                      ],
                                    ),
                                    Icon(Icons.arrow_forward_ios_outlined)
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.person, color: Colors.black, size: 28),
                                        SizedBox(
                                          width: 16,
                                        ),
                                        Text('Profile', style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16
                                        ),
                                        )
                                      ],
                                    ),
                                    Icon(Icons.arrow_forward_ios_outlined)
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.person, color: Colors.black, size: 28),
                                        SizedBox(
                                          width: 16,
                                        ),
                                        Text('Profile', style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16
                                        ),
                                        )
                                      ],
                                    ),
                                    Icon(Icons.arrow_forward_ios_outlined)
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.person, color: Colors.black, size: 28),
                                        SizedBox(
                                          width: 16,
                                        ),
                                        Text('Profile', style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16
                                        ),
                                        )
                                      ],
                                    ),
                                    Icon(Icons.arrow_forward_ios_outlined)
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.person, color: Colors.black, size: 28),
                                        SizedBox(
                                          width: 16,
                                        ),
                                        Text('Profile', style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16
                                        ),
                                        )
                                      ],
                                    ),
                                    Icon(Icons.arrow_forward_ios_outlined)
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Support',
                                  style: TextStyle(
                                      color: AppColorsLight.teksPrimary,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w300
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.person, color: Colors.black, size: 28),
                                        SizedBox(
                                          width: 16,
                                        ),
                                        Text('Profile', style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16
                                        ),
                                        )
                                      ],
                                    ),
                                    Icon(Icons.arrow_forward_ios_outlined)
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.person, color: Colors.black, size: 28),
                                        SizedBox(
                                          width: 16,
                                        ),
                                        Text('Profile', style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16
                                        ),
                                        )
                                      ],
                                    ),
                                    Icon(Icons.arrow_forward_ios_outlined)
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.person, color: Colors.black, size: 28),
                                        SizedBox(
                                          width: 16,
                                        ),
                                        Text('Profile', style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16
                                        ),
                                        )
                                      ],
                                    ),
                                    Icon(Icons.arrow_forward_ios_outlined)
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
              )
            ],
          ),
        ),
      ),
    );
  }
}