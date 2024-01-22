import 'package:flutter/material.dart';

enum Status {
  enabled,
  disable;
}

class MyStatusMenu extends StatefulWidget {
  final TextEditingController controller;

  const MyStatusMenu({super.key, required this.controller});

  @override
  State<MyStatusMenu> createState() => _MyStatusMenuState();
}

class _MyStatusMenuState extends State<MyStatusMenu> {
  final TextEditingController statusController = TextEditingController();
  Status selectedStatus =
      Status.enabled; // Variable para almacenar el estado seleccionado

  // Constructor
  _MyStatusMenuState() : selectedStatus = Status.enabled; // Valor inicial

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownButton<Status>(
            value: selectedStatus, // Usa la variable para el valor actual
            onChanged: (Status? newValue) {
              setState(() {
                selectedStatus = newValue!;
                widget.controller.text = newValue.toString().split('.').last;
              });
            },
            items: Status.values.map<DropdownMenuItem<Status>>((Status status) {
              return DropdownMenuItem<Status>(
                value: status,
                child: Text(status.toString().split('.').last),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
