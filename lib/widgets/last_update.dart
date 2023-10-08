import 'package:flutter/material.dart';

class LastUpdateWidget extends StatelessWidget {
  const LastUpdateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Son Güncelleme : ${TimeOfDay.now().format(context)}",
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    );
  }
}
