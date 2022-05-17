import 'package:flutter/material.dart';
import 'package:preferences_app/shared_preferences/preferences.dart';

import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = 'Home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        drawer: SideMenu(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('isDarkmode: ${Preferences.isDarkmode}'),
            const Divider(),
            Text('Genero: ${Preferences.gender}'),
            const Divider(),
            Text('Nombre de usuario: ${Preferences.name}'),
            const Divider()
          ],
        ));
  }
}
