import 'dart:convert';
import 'package:get/get.dart';
import 'package:green_vision/services/session_service.dart';
import 'package:http/http.dart' as http;

class ComunityController extends GetxController {
  final SessionService _sessionService = SessionService();
  var isLoading = true.obs;
  var communities = <Map<String, dynamic>>[].obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCommunities();
  }

  // Fungsi untuk mengambil daftar komunitas
  Future<void> fetchCommunities() async {
    isLoading(true);
    errorMessage('');
    try {
      final url = Uri.parse('https://capstone-be-zeta.vercel.app/api/komunitas');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> responseBody = json.decode(response.body);
        if (responseBody.isNotEmpty) {
          communities.value = List<Map<String, dynamic>>.from(responseBody);
        } else {
          errorMessage.value = 'No communities found';
        }
      } else {
        errorMessage.value = 'Failed to load data';
      }
    } catch (e) {
      errorMessage.value = 'Error occurred: $e';
    } finally {
      isLoading(false);
    }
  }

  // Fungsi untuk membuat komunitas
  Future<bool> createComunity({
    required String title,
    required String description,
    required String img,
    required String authorId,

  }) async {
    try {
      final token = await _sessionService.getToken();  // Ambil token dari session
      final userInfo = await _sessionService.getUserInfo();  // Ambil info user dari session
      final authorId = userInfo?['id'];  // Ambil authorId dari info user

      if (authorId == null) {
        return false;  // Jika authorId tidak ditemukan, return false
      }

      // Setup request untuk create komunitas
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('https://capstone-be-zeta.vercel.app/api/komunitas'),
      );

      request.headers['Authorization'] = 'Bearer $token';
      request.fields['title'] = title;
      request.fields['description'] = description;
      request.fields['author_id'] = authorId;
      request.fields['img'] = img;

      request.files.add(await http.MultipartFile.fromPath('photo', img));

      final response = await request.send();

      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Error creating community: $e');
      return false;
    }
  }

}
