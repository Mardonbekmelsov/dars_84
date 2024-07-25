import 'package:flutter/material.dart';

class Gridbutton extends StatelessWidget {
  final String number;
  const Gridbutton({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: number == '' ? null : Colors.blue,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        number,
        style: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
      ),
    );
  }
}
