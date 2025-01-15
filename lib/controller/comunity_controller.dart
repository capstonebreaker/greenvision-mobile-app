import 'dart:io';

import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ComunityController extends GetxController {
  var isLoading = true.obs;
  var communities = <Map<String, dynamic>>[].obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCommunities();
  }

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



}
