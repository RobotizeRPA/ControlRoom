import 'package:flutter/material.dart';

class IndividualButton extends StatelessWidget {
  final void Function()? onTap;
  final String child;

  const IndividualButton({super.key, required this.child, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: const Color.fromRGBO(68, 30, 174, 1),
            borderRadius: BorderRadius.circular(10)),
        width: 75,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        alignment: AlignmentDirectional.center,
        child: Text(
          child,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
