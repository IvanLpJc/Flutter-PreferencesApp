import 'package:flutter/material.dart';
import 'package:preferences_app/providers/theme_provider.dart';
import 'package:preferences_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../shared_preferences/preferences.dart';

class SettingsScreen extends StatefulWidget {
  static String routeName = 'Settings';

  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      drawer: const SideMenu(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text(
              'Ajustes',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 45, fontWeight: FontWeight.w300),
            ),
            const Divider(),
            SwitchListTile.adaptive(
                value: Preferences.isDarkmode,
                title: const Text('Darkmode'),
                onChanged: (value) {
                  Preferences.isDarkmode = value;
                  //Necesitamos el provider para que se redibujen los widgets
                  final themeProvider =
                      Provider.of<ThemeProvider>(context, listen: false);
                  value
                      ? themeProvider.setDarkMode()
                      : themeProvider.setLightMode();
                  setState(() {});
                }),
            const Divider(),
            RadioListTile<int>(
                title: const Text('Masculino'),
                value: 1,
                groupValue: Preferences.gender,
                onChanged: (value) {
                  Preferences.gender = value ?? 1;
                  setState(() {});
                }),
            const Divider(),
            RadioListTile<int>(
                title: const Text('Femenino'),
                value: 2,
                groupValue: Preferences.gender,
                onChanged: (value) {
                  Preferences.gender = value ?? 1;
                  setState(() {});
                }),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                initialValue: Preferences.name,
                onChanged: (value) {
                  Preferences.name = value;
                  setState(() {});
                },
                decoration: const InputDecoration(
                    labelText: 'Nombre', helperText: 'Nombre del usuario'),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
