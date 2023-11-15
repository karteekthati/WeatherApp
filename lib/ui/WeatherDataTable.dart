import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/WeatherForecast.dart';

class WeatherDataTable extends StatelessWidget {
  final WeatherForecast weather;

  const WeatherDataTable({Key? key, required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String formattedDate = weather.date != null
        ? DateFormat('dd/MM/yyyy').format(weather.date)
        : 'Unavailable';

    return Card(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Table(
            border: TableBorder.all(
              color: Colors.black26, // Border color
              width: 1, // Border width
              style: BorderStyle.solid, // Border style
            ),
            children: [
              _buildCenteredTableRow('Date : ', formattedDate,
                decoration: const BoxDecoration(color: Colors.orange),),
              _buildCenteredTableRow('Min Temp', 'Max Temp',
                decoration: const BoxDecoration(color: Colors.grey),),
              _buildCenteredTableRow('${weather.minTemperature}°C', '${weather.maxTemperature}°C',
                decoration: const BoxDecoration(color: Colors.grey),),
              _buildCenteredTableRow('Pressure', '${weather.pressure} hPa'),
              _buildCenteredTableRow('Humidity', '${weather.humidity}%'),
            ],
          ),
        ),
      ),
    );
  }

  TableRow _buildCenteredTableRow(String label, String value, {BoxDecoration? decoration}) {
    return TableRow(
      decoration: decoration ?? const BoxDecoration(color: Colors.white),
      children: [
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(label, textAlign: TextAlign.center),
            ),
          ),
        ),
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(value, textAlign: TextAlign.center),
            ),
          ),
        ),
      ],
    );
  }
}
