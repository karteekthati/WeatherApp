import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'WeatherController.dart';
import 'WeatherDataTable.dart';

class WeatherPage extends StatelessWidget {

  final WeatherController weatherController = Get.find<WeatherController>();
  final TextEditingController cityController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Scaffold(
      appBar: AppBar(title: const Text('Weather in Your City')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: cityController,
                    decoration: const InputDecoration(
                      labelText: 'Search the city',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(onPressed: (){
                  if(cityController.text.isNotEmpty){
                    weatherController.fetchWeather(cityController.text);
                  }
                }, child: const Text('Search')),
              ],
            ),
          ),
          Obx(() {
            if (weatherController.isLoading.isTrue) {
              return const Center(child: CircularProgressIndicator());
            } else {
              // Use a GridView.builder for responsiveness
              return Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    // Adjust the number of columns based on the screen size
                    crossAxisCount: isMobile ? 1 : 3,
                    childAspectRatio: isMobile ? 2.2 : 1.8,
                  ),
                  itemCount: weatherController.weatherForecasts.length,
                  itemBuilder: (context, index) {
                    final weather = weatherController.weatherForecasts[index];
                    return WeatherDataTable(weather: weather);
                  },
                ),
              );
            }
          }),
        ],
      ),
    );
  }
}

