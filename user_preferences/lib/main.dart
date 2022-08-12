import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_preferences/providers/theme_provider.dart';
import 'package:user_preferences/screens/screens.dart';
import 'package:user_preferences/shared_preferences/preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: ((context) => ThemeProvider(isDarkMode: Preferences.isDarkMode)))
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
        HomeScreen.routeName: ((context) => const HomeScreen()),
        SettingsScreen.routeName: ((context) => const SettingsScreen())
      },
      theme: Provider.of<ThemeProvider>(context).currentTheme,
    );
  }
}
