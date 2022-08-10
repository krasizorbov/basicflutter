import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/pages/home_page.dart';
import 'package:qr_scanner/pages/map_page.dart';
import 'package:qr_scanner/providers/ui_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UIProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR Scanner',
        initialRoute: 'home', 
        routes: {
          'home': (context) => const HomePage(),
          'map': (context) => const MapPage(),
        },
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: Colors.deepPurple)
        ),
      ),
    );
  }
}