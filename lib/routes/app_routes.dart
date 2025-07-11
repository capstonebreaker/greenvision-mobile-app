import 'package:get/get.dart';
import 'package:green_vision/routes/app_routes_named.dart';
import 'package:green_vision/views/comunity/comunity_page.dart';
import 'package:green_vision/views/get_started/get_started_screen.dart';
import 'package:green_vision/views/home/home_page.dart';
import 'package:green_vision/views/login/login_page.dart';
import 'package:green_vision/views/paddy_disease/image_upload_page.dart';
import 'package:green_vision/views/register/register_page.dart';
import 'package:green_vision/views/store/store_page.dart';

import '../views/chat_bot/chat_bot_page.dart';
import '../views/profile/profile_page.dart';

class AppRoutes {
  static final routes = [
    GetPage(name: AppRoutesNamed.pageGetStarted, page: () => GetStartedScreen()),
    GetPage(name: AppRoutesNamed.pageRegister, page: () => RegisterPage()),
    GetPage(name: AppRoutesNamed.pageLogin, page: () => LoginPage()),
    GetPage(name: AppRoutesNamed.pageHome, page: () => HomePage()),
    GetPage(name: AppRoutesNamed.pageComunity, page: () => ComunityPage()),
    GetPage(name: AppRoutesNamed.pageChatBot, page: () => ChatBotPage()),
    GetPage(name: AppRoutesNamed.pageProfile, page: () => ProfilePage()),
    GetPage(name: AppRoutesNamed.pageStore, page: () => StorePage()),
    GetPage(name: AppRoutesNamed.pageDisease, page: () => ImageUploadPage()),
  ];
}