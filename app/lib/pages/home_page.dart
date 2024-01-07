import 'package:app/components/Home/button_room.dart';
import 'package:app/components/Widgets/app_bar.dart';
import 'package:app/components/Widgets/drawer_menu.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final listComplete = [
    {'name': 'View Bots', 'path': '/bots'},
    {'name': 'Create Bot', 'path': '/create'},
    {'name': 'Settings', 'path': '/settings'},
    {'name': 'Account', 'path': '/account'}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(data: 'Control Room', boolData: true),
      drawer: const DrawerMenu(),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: GridView.count(
          crossAxisCount: 1,
          childAspectRatio: 2.2,
          children: List.generate(4, (index) {
            return ButtonRoom(
              child: Text(
                listComplete[index]['name'] ?? 'Error',
                style: const TextStyle(color: Colors.white),
              ),
              onTap: listComplete[index]['path'] ?? 'home',
            );
          }),
        ),
      )),
    );
  }
}
