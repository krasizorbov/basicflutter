import 'package:flutter/material.dart';

class Listview1Screen extends StatelessWidget {
  final options = const ['super man', 'spider man', 'bat man'];

  const Listview1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('List View 1'),
        ),
        body: ListView(
          children: [
            ...options.map((e) => ListTile(
              leading: const Icon(Icons.list_alt_rounded),
              title: Text(e),
              trailing: const Icon(Icons.arrow_right_rounded),
            )).toList(),
            
          ],
          
        ));
  }
}
