import 'package:flutter/material.dart';

class MyRow extends StatelessWidget {
  final String name;
  final String output;

  const MyRow({super.key, required this.name, required this.output});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$output:',
          style: const TextStyle(
              color: Color.fromRGBO(68, 30, 174, 1),
              fontWeight: FontWeight.bold,
              fontSize: 18),
        ),
        Text(
          name,
          style: const TextStyle(
              color: Color.fromRGBO(68, 30, 174, 1),
              fontWeight: FontWeight.bold,
              fontSize: 16),
        )
      ],
    );
  }
}
