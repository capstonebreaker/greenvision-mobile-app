
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:green_vision/constants/colors.dart';

import '../../../routes/app_routes_named.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      buttonBackgroundColor: AppColorsDark.third,
      backgroundColor: Colors.black,
      color: AppColorsDark.aksen, // Change this to your desired active color
      height: 60.0,
      index: _getCurrentIndex(),
      onTap: (index) {
        switch (index) {
          case 0:
            Get.toNamed(AppRoutesNamed.pageHome);
            break;
          case 1:
            Get.toNamed(AppRoutesNamed.pageHome);
            break;
          case 2:
            Get.toNamed(AppRoutesNamed.pageComunity);
            break;
        }
      },
      items: <Widget>[
        SizedBox(
          width: 24,
          height: 24,
          child: Image.asset('assets/images/navbar/home.png'),
        ),
        SizedBox(
          width: 24,
          height: 24,
          child: Image.asset('assets/images/navbar/scan.png'),
        ),
        SizedBox(
          width: 24,
          height: 24,
          child: Image.asset('assets/images/navbar/chats.png'),
        ),
      ],
    );
  }

  int _getCurrentIndex() {
    var currentRoute = Get.currentRoute;
    switch (currentRoute) {
      case AppRoutesNamed.pageHome:
        return 0;
      case AppRoutesNamed.pageHome:
        return 1;
      case AppRoutesNamed.pageComunity:
        return 2;
      default:
        return 0;
    }
  }
}
