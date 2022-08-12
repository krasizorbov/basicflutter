import 'package:flutter/material.dart';
import 'package:user_preferences/screens/screens.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: ((context) => const HomeScreen()),
        SettingsScreen.routeName: ((context) => const SettingsScreen())
      },
    );
  }
}