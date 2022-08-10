import 'package:flutter/material.dart';

class ScannButton extends StatelessWidget {
  const ScannButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      child: const Icon(Icons.filter_center_focus), onPressed: () {},
    );
  }
}
