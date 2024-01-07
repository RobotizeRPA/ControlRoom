import 'package:flutter/material.dart';

class ButtonLogin extends StatelessWidget {
  final void Function()? onTap;
  final Widget child;

  const ButtonLogin({super.key, required this.onTap, required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.white),
          padding: const EdgeInsets.all(15),
          width: 500,
          alignment: AlignmentDirectional.center,
          child: child,
        ),
      ),
    );
  }
}
