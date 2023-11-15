

import 'WeatherDataProvider.dart';
import '../model/WeatherForecast.dart';

class WeatherRepository {
  final WeatherDataProvider dataProvider;

  WeatherRepository({required this.dataProvider});

  Future<List<WeatherForecast>> fetchWeather(String city) async {
    final weatherData = await dataProvider.fetchWeatherData(city);
    return weatherData.map<WeatherForecast>((json) => WeatherForecast.fromJson(json)).toList();
  }
}
