import 'package:flutter/material.dart';

class InputLogin extends StatelessWidget {
  final controller;
  final String hintText;
  final bool osbscureText;

  const InputLogin(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.osbscureText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: osbscureText,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white)),
          filled: true,
          hintText: hintText,
        ),
      ),
    );
  }
}
