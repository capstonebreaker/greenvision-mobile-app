import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:green_vision/services/store_service.dart';
import 'package:green_vision/services/weather_services.dart';

class StoreController extends GetxController {
  var locations = <Map<String, dynamic>>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _getCoordinates().then((coordinates) {
      fetchLocations(coordinates);
    });
  }

  Future<String> _getCoordinates() async {
    WeatherService weatherService = WeatherService();
    Position position = await weatherService.getCurrentPosition();
    return '@${position.latitude},${position.longitude},1z';
  }

  void fetchLocations(String coordinates) async {
    isLoading.value = true;
    try {
      Map<String, dynamic> data = await StoreService().searchLocations(
        'pupuk',
        1,
        coordinates,
        'id',
        'id',
      );
      if (data['data'] != null) {
        locations.value = List<Map<String, dynamic>>.from(data['data']);
      } else {
        errorMessage.value = 'No data found';
      }
    } catch (e) {
      errorMessage.value = 'Error: $e';
    } finally {
      isLoading.value = false;
    }
  }
}
