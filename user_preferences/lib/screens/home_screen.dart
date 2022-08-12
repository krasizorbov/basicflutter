import 'package:flutter/material.dart';
import 'package:user_preferences/widgets/widgets.dart';

import '../shared_preferences/preferences.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'Home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Home Screen'),
      ),
      drawer: const SideMenu(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('isDarkMode: ${Preferences.isDarkMode}'),
          const Divider(),
          Text('Gender: ${Preferences.gender}'),
          const Divider(),
          Text('Username: ${Preferences.name}'),
          const Divider(),
        ],)
    );
  }
}
