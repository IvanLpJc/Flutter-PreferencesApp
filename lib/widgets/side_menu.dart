import 'package:flutter/material.dart';
import 'package:preferences_app/screens/screens.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const _DrawerHeader(),
          ListTile(
            leading: const Icon(Icons.pages_outlined),
            title: const Text('Home'),
            onTap: () {
              Navigator.pushReplacementNamed(context, HomeScreen.routeName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.people_outlined),
            title: const Text('People'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: const Text('Settings'),
            onTap: () {
              //Con este pop cerramos el drawer
              //Navigator.pop(context);
              Navigator.pushReplacementNamed(context, SettingsScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}

class _DrawerHeader extends StatelessWidget {
  const _DrawerHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      child: Container(),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/menu-img.jpg'), fit: BoxFit.cover)),
    );
  }
}
