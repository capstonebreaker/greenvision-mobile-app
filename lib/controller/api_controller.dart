import 'package:get/get.dart';
import '../services/api_service.dart';

class ApiController extends GetxController {
  final ApiService _apiService = ApiService();

  var detectionAPI = "".obs;
  var geminiAPI = "".obs;
  var openWeatherAPI = "".obs;
  var storeAPI = "".obs;

  @override
  void onInit() {
    super.onInit();
    fetchAPIData();
  }

  Future<void> fetchAPIData() async {
    const String documentId = 'BRoVC87fVHdR1JZoZJTV'; // Ganti dengan ID dokumen Anda
    try {
      final data = await _apiService.fetchAPIData(documentId);
      detectionAPI.value = data['detectionAPI'] ?? "Not Available";
      geminiAPI.value = data['geminiAPI'] ?? "Not Available";
      openWeatherAPI.value = data['openWeatherAPI'] ?? "Not Available";
      storeAPI.value = data['storeAPI'] ?? "Not Available";
    } catch (e) {
      print("Error fetching API data: $e");
    }
  }
}
