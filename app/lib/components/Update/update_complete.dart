import 'package:app/components/Create/Widgets/label_text.dart';
import 'package:app/components/Create/create_input.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:app/components/Create/dropmenu.dart';
import 'package:app/components/Update/bots_days_selected.dart';
import 'package:flutter/material.dart';

class UpdateBotComplete extends StatefulWidget {
  final String name;
  final String status;
  final String lastRun;
  final String nextRun;
  final String runHours;
  final List<dynamic> runDays;
  final String path;
  final String runTimes;

  const UpdateBotComplete(
      {super.key,
      required this.name,
      required this.status,
      required this.lastRun,
      required this.nextRun,
      required this.path,
      required this.runDays,
      required this.runHours,
      required this.runTimes});

  @override
  State<UpdateBotComplete> createState() => _UpdateBotCompleteState();
}

class _UpdateBotCompleteState extends State<UpdateBotComplete> {
  late List<dynamic> selectedDays = widget.runDays;
  final nameController = TextEditingController();
  final statusController = TextEditingController();
  final runEveryController = TextEditingController();
  final runTimesController = TextEditingController();
  final pathController = TextEditingController();

  void _handleDaySelection(List<dynamic> days) {
    setState(() {
      selectedDays = days;
    });
    // Additional logic for selected days can be added here
  }

  void _createBot() async {
    String name = widget.name;
    String status = statusController.text;
    String runEvery = runEveryController.text;
    String runTimes = runTimesController.text;
    String path = pathController.text;
    var response = await http.patch(
      Uri.http('192.168.0.195:3001', 'tasks/$name'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'status': status,
        'runTimes': runTimes,
        'runHours': runEvery,
        'runDays': selectedDays,
        'path': path,
      }),
    );
    if (response.statusCode == 200) {
      Navigator.pushNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(
          height: 10,
        ),
        const LabelText(text: 'Run every:'),
        CreateInput(
          controller: runEveryController,
          hintText: 'Run Every (in hours)',
          keyboard: 'hours',
        ),
        const SizedBox(
          height: 10,
        ),
        const LabelText(text: 'Script path:'),
        CreateInput(
          controller: pathController,
          hintText: 'Path',
          keyboard: 'text',
        ),
        MyDropMenu(
          statusController: statusController,
          runTimesController: runTimesController,
        ),
        const SizedBox(
          height: 25,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
              '*In run times 0 is for always, 1 is for one time and 2 is for disable',
              style: TextStyle(
                  color: Color.fromRGBO(68, 30, 174, 1), fontSize: 12)),
        ),
        const SizedBox(
          height: 25,
        ),
        const LabelText(text: 'Run days:'),
        const SizedBox(
          height: 10,
        ),
        UpdateDaysButton(
            onDaysChanged: _handleDaySelection, selectedDays: selectedDays),
        const SizedBox(
          height: 25,
        ),
        // Button to create Bot
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: GestureDetector(
            // onTap: () {},
            onTap: _createBot,
            child: Container(
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(68, 30, 174, 1),
                  borderRadius: BorderRadius.circular(10)),
              width: 250,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              alignment: AlignmentDirectional.center,
              child: const Text(
                'Update Bot',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        )
      ],
    );
  }
}
