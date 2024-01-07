import 'package:flutter/material.dart';

class BotsCard extends StatelessWidget {
  final String name;
  final String status;
  final String lastRun;
  final String nextRun;

  BotsCard(
      {super.key,
      required this.name,
      required this.status,
      required this.lastRun,
      required this.nextRun});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/bots_view', arguments: name);
      },
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 25),
            height: 100,
            decoration: BoxDecoration(
                border: Border.all(
                    color: const Color.fromRGBO(68, 30, 174, 1), width: 2),
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 2,
                ),
                Text(
                  name,
                  style: const TextStyle(
                    color: Color.fromRGBO(68, 30, 174, 1),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
                Text(status == 'enabled' ? 'Active' : 'Inactive',
                    style: TextStyle(
                      color: status == 'enabled' ? Colors.green : Colors.red,
                      fontWeight: FontWeight.bold,
                    )),
                const SizedBox(
                  width: 2,
                )
              ],
            )),
      ),
    );
  }
}
