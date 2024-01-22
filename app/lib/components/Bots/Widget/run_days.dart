import 'package:flutter/material.dart';

class ButtonRender extends StatelessWidget {
  final List<dynamic> days;

  const ButtonRender({super.key, required this.days});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 100,
        height: 50,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: days.length,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              height: 40,
              margin: index == 0
                  ? const EdgeInsets.only(right: 5)
                  : const EdgeInsets.symmetric(horizontal: 5),
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(68, 30, 174, 1),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Center(
                child: Text(
                  days[index],
                  style: TextStyle(color: Colors.white),
                ),
              ),
            );
          },
        ));
  }
}
