import 'package:flutter/material.dart';
import 'package:flutter_weather_app/widgets/last_update.dart';
import 'package:flutter_weather_app/widgets/location.dart';
import 'package:flutter_weather_app/widgets/max_min_degrees.dart';
import 'package:flutter_weather_app/widgets/select_city.dart';
import 'package:flutter_weather_app/widgets/weather_image.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Weather App')),
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          IconButton(
            onPressed: () {
					Navigator.push(context, MaterialPageRoute(builder: (context) => const SelectCityWidget()));
				},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: ListView(
        children: const [
          Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Center(child: LocationWidget()),
          ),
			 Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Center(child: LastUpdateWidget()),
          ),
			 Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Center(child: WeatherImageWidget()),
          ),
			 Padding(
            padding: EdgeInsets.only(top: 16.0),
            child: Center(child: MaxMinDegreesWidget()),
          ),
        ],
      ),
    );
  }
}
