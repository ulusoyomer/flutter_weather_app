import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather_app/bloc/weather_bloc_bloc.dart';
import 'package:flutter_weather_app/screens/home_screen.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: FutureBuilder(future: _determinePosition(),
		 builder: (context,snap){
			 if(snap.hasData){
				 return BlocProvider(
					 create: (context) => WeatherBlocBloc()..add(
						FetchWeather(position: snap.data as Position)),
					 child: const HomeScreen(),
				 );
			 }else{
				 return const Scaffold(
					 body: Center(
						 child: CircularProgressIndicator(),
					 ),
				 );
			 }
		 })
    );
  }
  _determinePosition() async {
		bool serviceEnabled;
		LocationPermission permission;
		
		serviceEnabled = await Geolocator.isLocationServiceEnabled();
		if (!serviceEnabled) {
			return Future.error('Location services are disabled.');
		}

		permission = await Geolocator.checkPermission();
		if (permission == LocationPermission.deniedForever) {
			return Future.error(
				'Location permissions are permantly denied, we cannot request permissions.');
		}

		if (permission == LocationPermission.denied) {
			permission = await Geolocator.requestPermission();
			if (permission != LocationPermission.whileInUse &&
					permission != LocationPermission.always) {
				return Future.error(
					'Location permissions are denied (actual value: $permission).');
			}
		}

		return await Geolocator.getCurrentPosition();
  }
}
