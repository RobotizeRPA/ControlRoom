import 'package:app/components/Bots/Widget/my_row.dart';
import 'package:flutter/material.dart';

class BotsComplete extends StatelessWidget {
  final String name;
  final String status;
  final String lastRun;
  final String nextRun;
  final int runHours;
  final List<dynamic> runDays;
  final String path;
  final int runTimes;

  const BotsComplete(
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
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            border: Border.all(
                width: 2, color: const Color.fromRGBO(68, 30, 174, 1)),
            borderRadius: BorderRadius.circular(20)),
        child: ListView(
          children: [
            MyRow(name: name, output: 'Name'),
            const SizedBox(
              height: 25,
            ),
            MyRow(name: status, output: 'Status'),
            const SizedBox(
              height: 25,
            ),
            MyRow(name: lastRun, output: 'Last Run'),
            const SizedBox(
              height: 25,
            ),
            MyRow(name: nextRun, output: 'Next Run'),
            const SizedBox(
              height: 25,
            ),
            MyRow(name: runHours.toString(), output: 'Run Every'),
            const SizedBox(
              height: 5,
            ),
            const Text(
              '*Applys to hours',
              style: TextStyle(
                  fontSize: 10,
                  color: Color.fromRGBO(68, 30, 174, 1),
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 25,
            ),
            MyRow(name: runTimes.toString(), output: 'Run Times'),
            const SizedBox(
              height: 5,
            ),
            const Text(
              '*If 0, always active. If 1, only runes one time. If 2, inactive',
              style: TextStyle(
                  fontSize: 10,
                  color: Color.fromRGBO(68, 30, 174, 1),
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/bots');
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromRGBO(68, 30, 174, 1)),
                      padding: const EdgeInsets.all(15),
                      width: 150,
                      alignment: AlignmentDirectional.center,
                      child: const Text(
                        'Back',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromRGBO(68, 30, 174, 1)),
                      padding: const EdgeInsets.all(15),
                      width: 150,
                      alignment: AlignmentDirectional.center,
                      child: const Text(
                        'Change',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
