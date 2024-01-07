import 'package:flutter/material.dart';

enum NumberOption {
  zero,
  one,
  two;
}

class MyRunTimesMenu extends StatefulWidget {
  final TextEditingController controller;

  const MyRunTimesMenu({super.key, required this.controller});

  @override
  State<MyRunTimesMenu> createState() => _MyRunTimesMenuState();
}

class _MyRunTimesMenuState extends State<MyRunTimesMenu> {
  final TextEditingController numberController = TextEditingController();
  NumberOption selectedOption = NumberOption.zero; // Valor inicial

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButton<NumberOption>(
        value: selectedOption,
        onChanged: (NumberOption? newValue) {
          setState(() {
            if (newValue != null) {
              selectedOption = newValue;
              widget.controller.text = getNumberOptionLabel(newValue);
            }
          });
        },
        items: NumberOption.values
            .map<DropdownMenuItem<NumberOption>>((NumberOption option) {
          return DropdownMenuItem<NumberOption>(
            value: option,
            child: Text(getNumberOptionLabel(option)),
          );
        }).toList(),
      ),
    );
  }

  String getNumberOptionLabel(NumberOption option) {
    switch (option) {
      case NumberOption.zero:
        return '0';
      case NumberOption.one:
        return '1';
      case NumberOption.two:
        return '2';
      default:
        return '';
    }
  }
}
