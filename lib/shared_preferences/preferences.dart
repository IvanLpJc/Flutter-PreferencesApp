import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs;

  static String _name = '';
  static int _gender = 1;
  static bool _isDarkmode = false;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static String get name {
    //Devolvemos el valor que tenemos almacenado en las preferencias
    //pero puede ser que nunca se haya guardado así que condicionamos para
    //que en tal caso devuelva el valor que tenemos aquí
    return _prefs.getString('name') ?? _name;
  }

  static set name(String name) {
    _name = name;
    _prefs.setString('name', name);
  }

  static bool get isDarkmode {
    //Devolvemos el valor que tenemos almacenado en las preferencias
    //pero puede ser que nunca se haya guardado así que condicionamos para
    //que en tal caso devuelva el valor que tenemos aquí
    return _prefs.getBool('isDarkmode') ?? _isDarkmode;
  }

  static set isDarkmode(bool isDarkmode) {
    _isDarkmode = isDarkmode;
    _prefs.setBool('isDarkmode', isDarkmode);
  }

  static int get gender {
    //Devolvemos el valor que tenemos almacenado en las preferencias
    //pero puede ser que nunca se haya guardado así que condicionamos para
    //que en tal caso devuelva el valor que tenemos aquí
    return _prefs.getInt('gender') ?? _gender;
  }

  static set gender(int gender) {
    _gender = gender;
    _prefs.setInt('gender', gender);
  }
}
