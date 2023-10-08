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
	String? selectedCity = "Ankara";
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          IconButton(
            onPressed: () async {
					selectedCity = await Navigator.push(context, 
					MaterialPageRoute(builder: (context) => const SelectCityWidget()));
					print(selectedCity);
				},
            icon: const Icon(Icons.search),
          ),
        ],
      ), 
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Center(child: LocationWidget(selectedCity: selectedCity ?? "Ankara",)),
          ),
			 const Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Center(child: LastUpdateWidget()),
          ),
			 const Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Center(child: WeatherImageWidget()),
          ),
			 const Padding(
            padding: EdgeInsets.only(top: 16.0),
            child: Center(child: MaxMinDegreesWidget()),
          ),
        ],
      ),
    );
  }
}
