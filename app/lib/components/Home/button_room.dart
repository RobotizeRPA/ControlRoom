import 'package:flutter/material.dart';

class ButtonRoom extends StatelessWidget {
  final String onTap;
  final Widget child;

  const ButtonRoom({super.key, required this.onTap, required this.child});

  void onTaap(context) {
    Navigator.pushNamed(context, onTap);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, onTap);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromRGBO(68, 30, 174, 1),
          ),
          // padding: const EdgeInsets.all(15),
          alignment: AlignmentDirectional.center,
          width: 250,
          child: child,
        ),
      ),
    );
  }
}
