import 'package:flutter/material.dart';
import 'package:preferences_app/providers/theme_provider.dart';
import 'package:preferences_app/screens/screens.dart';
import 'package:preferences_app/shared_preferences/preferences.dart';
import 'package:provider/provider.dart';

//Hacemos que el main sea asincrono para así poder llamar a la inicialización
//de las preferencias ya que el build de myapp no puede ser asíncrono
//! Los métodos build no pueden ser asíncronos
void main() async {
  //Debemos usar esto para que se asegure de inicializar los widgets antes
  // de iniciar por completo la aplicacion

  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => ThemeProvider(isDarkmode: Preferences.isDarkmode))
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (_) => const HomeScreen(),
        SettingsScreen.routeName: (_) => const SettingsScreen(),
      },
      theme: Provider.of<ThemeProvider>(context).currentTheme,
    );
  }
}
