import 'package:app/components/Widgets/list_menu.dart';
import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                  child: Center(
                child: Image.asset('lib/assets/imagenPerfil.png'),
              )),
              MyListMenu(
                  text: 'View Bots',
                  onTap: () {
                    Navigator.pushNamed(context, '/bots');
                  }),
              MyListMenu(
                  text: 'Create Bot',
                  onTap: () {
                    Navigator.pushNamed(context, '/create');
                  }),
              MyListMenu(
                  text: 'Settings',
                  onTap: () {
                    Navigator.pushNamed(context, '/settings');
                  }),
              MyListMenu(
                  text: 'Account',
                  onTap: () {
                    Navigator.pushNamed(context, '/account');
                  }),
            ],
          ),
          // Exist buttom
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: ListTile(
              leading: const Icon(
                Icons.exit_to_app,
                color: Color.fromRGBO(68, 30, 174, 1),
              ),
              title: const Text('Cerrar sesion'),
              onTap: () {
                Navigator.pushNamed(context, '/login');
              },
            ),
          )
        ],
      ),
    );
  }
}
