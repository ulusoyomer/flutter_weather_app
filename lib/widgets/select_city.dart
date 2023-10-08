import 'package:flutter/material.dart';

class SelectCityWidget extends StatefulWidget {
  const SelectCityWidget({super.key});

  @override
  State<SelectCityWidget> createState() => _SelectCityWidgetState();
}

class _SelectCityWidgetState extends State<SelectCityWidget> {
	final _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
	 return Scaffold(
		appBar: AppBar(
		  title: const Text("Şehir Seç"),
		),
		body: Form(child: Row(
		  mainAxisSize: MainAxisSize.max,
		  mainAxisAlignment: MainAxisAlignment.center,
		  children: [
			 Expanded(
				child: Padding(
				  padding: const EdgeInsets.all(8.0),
				  child: TextFormField(
					 decoration: const InputDecoration(
						labelText: "Şehir",
						hintText: "Şehir Seçin",
						prefixIcon: Icon(Icons.search),
						border: OutlineInputBorder(),
					 ),
					 controller: _textController,
				  ),
				),
			 ),
			 IconButton(
				icon: const Icon(Icons.search),
				onPressed: () {
				  Navigator.pop(context,_textController.text);
				},
			 ),
		  ],
		),
		),
	 );
  }
}