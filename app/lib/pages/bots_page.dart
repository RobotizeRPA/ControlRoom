import 'dart:convert';
import 'package:app/components/Bots/bots_view.dart';
import 'package:app/components/Widgets/app_bar.dart';
import 'package:app/models/bots_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BotsPage extends StatefulWidget {
  BotsPage({super.key});

  @override
  _BotsPageState createState() => _BotsPageState();
}

class _BotsPageState extends State<BotsPage> {
  List<BotViewModel> botsList = [];
  late Future botsFuture;

  @override
  void initState() {
    super.initState();
    botsFuture = getBots();
  }

  Future getBots() async {
    var response = await http.get(Uri.http('192.168.0.195:3001', 'tasks'));

    var jsonData = jsonDecode(response.body);
    print(jsonData);
    List<BotViewModel> tempBotsList = [];
    for (var eachBot in jsonData) {
      final bot = BotViewModel(
        name: eachBot['name'],
        status: eachBot['status'],
        lastRun: eachBot['lastRun'],
        nextRun: eachBot['nextRun'],
      );
      tempBotsList.add(bot);
    }

    setState(() {
      botsList = tempBotsList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MyAppBar(data: 'View Bots', boolData: true),
        body: FutureBuilder(
          future: botsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Padding(
                  padding: const EdgeInsets.only(
                      left: 5.0, top: 10.0, bottom: 15, right: 5),
                  child: ListView.builder(
                      itemCount: botsList.length,
                      itemBuilder: (context, index) {
                        return BotsCard(
                          name: botsList[index].name,
                          status: botsList[index].status,
                          lastRun: botsList[index].lastRun,
                          nextRun: botsList[index].nextRun,
                        );
                      }));
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
