import 'package:get/get.dart';

import '../model/weather_model.dart';
import '../services/weather_services.dart';


class WeatherController extends GetxController {
  var weather = Rxn<Weather>();
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchWeather();
  }

  Future<void> fetchWeather() async {
    WeatherService weatherService = WeatherService();
    try {
      final position = await weatherService.getCurrentPosition();
      Weather fetchedWeather = await weatherService.getWeatherByCoordinates(
          position.latitude, position.longitude);
      weather.value = fetchedWeather;
      errorMessage.value = '';
    } catch (error) {
      weather.value = null;
      errorMessage.value = error.toString();
    }
  }

  String getWeatherAnimation(String? mainCondition) {
    if (mainCondition == null)
      return 'assets/json/sunny.json'; // default to sunny

    switch (mainCondition.toLowerCase()) {
      case 'clouds':
      case 'mist':
      case 'smoke':
      case 'haze':
      case 'dust':
      case 'fog':
        return 'assets/json/clouds1.json';
      case 'rain':
      case 'drizzle':
      case 'shower rain':
        return 'assets/json/rainy1.json';
      case 'thunderstorm':
        return 'assets/json/thunder1.json';
      case 'clear':
        return 'assets/json/sunny1.json';
      default:
        return 'assets/json/sunny1.json';
    }
  }
}
