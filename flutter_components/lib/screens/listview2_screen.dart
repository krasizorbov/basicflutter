import 'package:flutter/material.dart';

class Listview2Screen extends StatelessWidget {
  final options = const ['super man', 'spider man', 'bat man'];

  const Listview2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('List View 1'),
          elevation:  0,
        ),
        body: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: const Icon(Icons.list_alt_rounded, color: Colors.indigo),
              title: Text(options[index]),
              trailing: const Icon(Icons.arrow_circle_right_outlined, color: Colors.indigo),
              onTap: () {},
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider();
          },
          itemCount: options.length,
        ));
  }
}
