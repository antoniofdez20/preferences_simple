import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs; //objeto de tipo SharedPreferences

  static int _number = 0; //variable de la cual queremos persistir el valor

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static int get number {
    return _prefs.getInt('number') ?? _number;
  }

  static set number(int value) {
    _number = value;
    _prefs.setInt('number', value);
  }
}
