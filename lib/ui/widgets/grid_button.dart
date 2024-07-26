import 'package:flutter/material.dart';

class NumberWidget extends StatelessWidget {
  final String number;
  const NumberWidget({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.teal,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        number,
        style: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
      ),
    );
  }
}
