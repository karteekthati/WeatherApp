import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/ui/WeatherController.dart';

import 'data/WeatherDataProvider.dart';
import 'ui/WeatherPage.dart';
import 'data/WeatherRepository.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Dependency injection with GetX
    Get.lazyPut(() => WeatherDataProvider());
    Get.lazyPut(() => WeatherRepository(dataProvider: Get.find()));
    Get.lazyPut(() => WeatherController(repository: Get.find()));

    return GetMaterialApp(
      title: 'Flutter Weather App',
      home: WeatherPage(),
    );
  }
}
