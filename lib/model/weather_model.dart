class Weather {
  final String cityName;
  final double temperature; // Current temperature
  final double highTemperature; // High temperature
  final double lowTemperature; // Low temperature
  final String mainCondition; // Weather condition (e.g., Clear, Rain)

  Weather({
    required this.cityName,
    required this.temperature,
    required this.highTemperature,
    required this.lowTemperature,
    required this.mainCondition,
  });

  // You can also add a method to convert from JSON if you are fetching data from an API
  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'],
      temperature: json['main'] ['temp'].toDouble(),
      highTemperature:
      json['main']['temp_max'].toDouble(), // High temp from API
      lowTemperature: json['main']['temp_min'].toDouble(), // Low temp from API
      mainCondition: json['weather'][0]['main'],
    );
  }
}
