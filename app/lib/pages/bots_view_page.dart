import 'dart:convert';
import 'package:app/components/Bots/bots_complete.dart';
import 'package:app/components/Widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BotViewPage extends StatelessWidget {
  BotViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)?.settings.arguments as String;

    Future getBotData() async {
      var response =
          await http.get(Uri.http('192.168.0.195:3001', 'tasks/$routeArgs'));

      var jsonData = jsonDecode(response.body);
      return jsonData;
    }

    return Scaffold(
      appBar: const MyAppBar(data: 'Complete view', boolData: true),
      body: FutureBuilder(
        future: getBotData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return BotsComplete(
              name: snapshot.data['name'],
              status: snapshot.data['status'],
              lastRun: snapshot.data['lastRun'],
              nextRun: snapshot.data['nextRun'],
              runDays: snapshot.data['runDays'],
              runTimes: snapshot.data['runTimes'],
              path: snapshot.data['path'],
              runHours: snapshot.data['runHours'],
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
