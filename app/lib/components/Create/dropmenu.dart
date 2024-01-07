import 'package:app/components/Create/Widgets/runtimes_drop.dart';
import 'package:app/components/Create/Widgets/status_drop.dart';
import 'package:flutter/material.dart';

class MyDropMenu extends StatefulWidget {
  final TextEditingController runTimesController;
  final TextEditingController statusController;

  const MyDropMenu(
      {super.key,
      required this.runTimesController,
      required this.statusController});

  @override
  State<MyDropMenu> createState() => _MyDropMenuState();
}

class _MyDropMenuState extends State<MyDropMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Status:',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Color.fromRGBO(68, 30, 174, 1)),
          ),
          MyStatusMenu(
            controller: widget.statusController,
          ),
          const SizedBox(
            width: 25,
          ),
          const Text(
            'Run Times:',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Color.fromRGBO(68, 30, 174, 1)),
          ),
          const SizedBox(
            width: 10,
          ),
          MyRunTimesMenu(controller: widget.runTimesController)
        ],
      ),
    );
  }
}
