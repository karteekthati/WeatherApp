import 'package:http/http.dart' as http;
import 'dart:convert';

import '../core/APIConstants.dart';

class WeatherDataProvider {
  final httpClient = http.Client();

  Future<List<dynamic>> fetchWeatherData(String city) async {
    final url = Uri.parse('${APIConstants.baseUrl}${APIConstants.forecastEndpoint}?q=$city&appid=${APIConstants.apiKey}&units=metric');
    final response = await httpClient.get(url);

    if (response.statusCode == 200) {
      return json.decode(response.body)['list'];
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
