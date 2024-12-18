import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ArticleController extends GetxController {
  var isLoading = true.obs;
  var articles = <Map<String, dynamic>>[].obs; // A list of articles
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchArticles(); // Change to fetch articles
  }

  Future<void> fetchArticles() async {
    isLoading(true);
    errorMessage('');
    try {
      final url = Uri.parse('https://capstone-be-zeta.vercel.app/api/articles');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseBody = json.decode(response.body);
        if (responseBody.containsKey('data') && responseBody['data'] is List) {
          final List<dynamic> data = responseBody['data'];
          if (data.isNotEmpty) {
            articles.value = List<Map<String, dynamic>>.from(data);
          } else {
            errorMessage.value = 'No articles found';
          }
        } else {
          errorMessage.value = 'Unexpected data format';
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

