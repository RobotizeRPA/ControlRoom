import 'package:app/components/Create/Widgets/label_text.dart';
import 'package:app/components/Create/create_input.dart';
import 'package:app/components/Create/days_button.dart';
import 'package:app/components/Create/dropmenu.dart';
import 'package:app/components/Widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final nameController = TextEditingController();
  final statusController = TextEditingController();
  final runEveryController = TextEditingController();
  final runTimesController = TextEditingController();
  final pathController = TextEditingController();
  final firtRunController = TextEditingController();
  // final days = TextEditingController();
  List<String> selectedDays = [];

  void _handleDaySelection(List<String> days) {
    setState(() {
      selectedDays = days;
    });
    // Additional logic for selected days can be added here
  }

  void _createBot() async {
    String name = nameController.text;
    String status = statusController.text;
    String runEvery = runEveryController.text;
    String runTimes = runTimesController.text;
    String path = pathController.text;
    String nextRun = firtRunController.text;

    if (status == '') status = 'enabled';
    if (runTimes == '') runTimes = '0';

    var response = await http.post(
      Uri.http('192.168.0.195:3001', 'tasks'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'name': name,
        'status': status,
        'runTimes': runTimes,
        'runHours': runEvery,
        'runDays': selectedDays,
        'path': path,
        'nextRun': nextRun
      }),
    );

    if (response.statusCode == 201) {
      Navigator.pushNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(data: 'Create bot', boolData: true),
      body: SafeArea(
        child: Center(
            child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            const SizedBox(
              height: 10,
            ),
            const LabelText(text: 'Bot name:'),
            CreateInput(
              controller: nameController,
              hintText: 'Name',
              keyboard: 'text',
            ),
            const SizedBox(
              height: 10,
            ),
            const LabelText(text: 'Run every:'),
            CreateInput(
              controller: runEveryController,
              hintText: 'Run Every (in hours)',
              keyboard: 'number',
            ),
            const SizedBox(
              height: 10,
            ),
            const LabelText(text: 'First Run:'),
            CreateInput(
              controller: firtRunController,
              hintText: 'Next Run',
              keyboard: 'number',
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
            const LabelText(text: 'Select the run days:'),
            const SizedBox(
              height: 10,
            ),
            MyDaysButton(onDaysChanged: _handleDaySelection),
            const SizedBox(
              height: 25,
            ),
            // Button to create Bot
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: GestureDetector(
                onTap: _createBot,
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(68, 30, 174, 1),
                      borderRadius: BorderRadius.circular(10)),
                  width: 250,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  alignment: AlignmentDirectional.center,
                  child: const Text(
                    'Create Bot',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
