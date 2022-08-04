
import 'package:designs/screens/basic_design.dart';
import 'package:designs/screens/scroll_design.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'scroll_design',
      routes: {
        'basic_design': (context) => const BasicDesignScreen(),
        'scroll_design': (context) => const ScrollDesignScreen(),
      },
    );
  }
}

