import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app_estudios_calidad/Screens/introductionScreen.dart';
import 'package:app_estudios_calidad/Screens/mainPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool show = true;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  show = prefs.getBool('ON_BOARDING') ?? true;
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter On Boarding',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: show ? IntroScreen() : const HomePage(),
    );
  }
}
