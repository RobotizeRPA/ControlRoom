import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String data;
  final bool boolData;

  const MyAppBar({super.key, required this.data, required this.boolData});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // leading: boolData
      //     ? IconButton(
      //         icon: const Icon(Icons.menu),
      //         onPressed: () {
      //           Navigator.pushNamed(context, '/home');
      //         },
      //       )
      //     : null,
      automaticallyImplyLeading: boolData,
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      backgroundColor: const Color.fromRGBO(68, 30, 174, 1),
      title: Text(data, style: const TextStyle(color: Colors.white)),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
