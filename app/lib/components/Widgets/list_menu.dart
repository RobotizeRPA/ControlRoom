import 'package:flutter/material.dart';

class MyListMenu extends StatelessWidget {
  final String text;
  final void Function()? onTap;

  const MyListMenu({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: ListTile(
        title: Text(
          text,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        onTap: onTap,
      ),
    );
  }
}
