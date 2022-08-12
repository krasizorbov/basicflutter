import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_preferences/providers/theme_provider.dart';
import 'package:user_preferences/widgets/widgets.dart';

import '../shared_preferences/preferences.dart';

class SettingsScreen extends StatefulWidget {
  static const String routeName = 'Settings';
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // bool isDarkMode = false;
  // int gender = 1;
  // String name = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Settings'),
      ),
      drawer: const SideMenu(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Settings',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w300),
              ),
              const Divider(),
              SwitchListTile.adaptive(
                  value: Preferences.isDarkMode,
                  title: const Text('Dark Mode'),
                  onChanged: (value) {
                    Preferences.isDarkMode = value;
                    final themeProvider =
                        Provider.of<ThemeProvider>(context, listen: false);
                    if (value) {
                      themeProvider.setDarkmode();
                    } else {
                      themeProvider.setLightMode();
                    }
                    setState(() {});
                  }),
              const Divider(),
              RadioListTile<int>(
                  value: 1,
                  groupValue: Preferences.gender,
                  title: const Text('Male'),
                  onChanged: (value) {
                    Preferences.gender = value ?? 1;
                    setState(() {});
                  }),
              const Divider(),
              RadioListTile<int>(
                  value: 2,
                  groupValue: Preferences.gender,
                  title: const Text('Female'),
                  onChanged: (value) {
                    Preferences.gender = value ?? 2;
                    setState(() {});
                  }),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  onChanged: (value) {
                    Preferences.name = value;
                    setState(() {});
                  },
                  decoration: const InputDecoration(labelText: 'Username'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
