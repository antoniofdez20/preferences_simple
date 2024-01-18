import 'package:flutter/material.dart';
import 'package:preferences_simple/preferences/preferences.dart';
import 'package:preferences_simple/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); //este widget nos asegura que se han establecido unos canales primitivos a bajo nivel para ejecutar el metodo asincrono para inicializar
  await Preferences.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // DENTRO DEL BUILD NUNCA PUEDE HABER UN METODO ASINCRONO PORQUE LA APLICACION PODRIA QUEDARSE BLOQUEADA
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ejemplo Shared Preferences',
      initialRoute: HomeScreen.routerName,
      routes: {
        HomeScreen.routerName: (_) => HomeScreen(),
      },
      theme: ThemeData.dark(),
    );
  }
}
