import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../controller/api_controller.dart';

class StoreService {
  final ApiController controller = Get.put(ApiController());
  final String apiUrl = 'https://cloud.gmapsextractor.com/api/v1/search';

  Future<Map<String, dynamic>> searchLocations(String query, int page, String ll, String hl, String gl) async {
    // Membuat body request JSON
    final Map<String, dynamic> requestBody = {
      'q': query,
      'page': page,
      'll': ll,
      'hl': hl,
      'gl': gl,
    };

    try {
      // Melakukan request POST ke API
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${controller.storeAPI.value}', // Menyertakan token API di header
        },
        body: json.encode(requestBody), // Mengirimkan body dalam format JSON
      );

      if (response.statusCode == 200) {
        // Jika request berhasil, parse response JSON dan kembalikan data
        return json.decode(response.body);
      } else {
        // Jika terjadi error, lempar exception
        throw Exception('Failed to fetch data: ${response.statusCode}');
      }
    } catch (e) {
      // Menangani kesalahan jaringan atau lainnya
      throw Exception('Error fetching data: $e');
    }
  }
}
