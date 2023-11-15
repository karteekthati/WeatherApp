import 'package:get/get.dart';

import '../data/WeatherRepository.dart';
import '../model/WeatherForecast.dart';


class WeatherController extends GetxController {
  var isLoading = false.obs;
  var weatherForecasts = <WeatherForecast>[].obs;
  final WeatherRepository repository;

  WeatherController({required this.repository});

  void fetchWeather(String city) async {
    try {
      isLoading(true);
      final weathers = await repository.fetchWeather(city);
      weatherForecasts.value = weathers;
    } catch (e) {
      Get.snackbar('Error', 'Could not fetch weather data');
    } finally {
      isLoading(false);
    }
  }
}