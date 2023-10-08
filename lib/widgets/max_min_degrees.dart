import 'package:flutter/material.dart';

class MaxMinDegreesWidget extends StatelessWidget {
  const MaxMinDegreesWidget({super.key});

  @override
  Widget build(BuildContext context) {
	 return const Row(
		mainAxisAlignment: MainAxisAlignment.spaceEvenly,
		children: [
			 Text("Maksimum : " + "20", style: TextStyle(fontSize: 20),),
			 Text("Minimum : " + "10", style: TextStyle(fontSize: 20),),
		],
	 );
  }
}