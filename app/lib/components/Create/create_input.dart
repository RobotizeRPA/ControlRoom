import 'package:flutter/material.dart';

class CreateInput extends StatelessWidget {
  final TextEditingController controller;
  final String keyboard;

  final String hintText;

  const CreateInput(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.keyboard});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
          controller: controller,
          keyboardType:
              keyboard == 'text' ? TextInputType.text : TextInputType.number,
          obscureText: false,
          decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromRGBO(68, 30, 174, 1))),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color.fromRGBO(68, 30, 174, 1))),
            filled: true,
            hintText: hintText,
          )),
    );
  }
}
