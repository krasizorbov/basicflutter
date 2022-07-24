import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AnimatedScreen extends StatefulWidget {
  const AnimatedScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double _width = 50;
  double _height = 50;
  Color _color = Colors.indigo;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(10);

  void onChangeShape() {
    final random = Random();
    _width = random.nextInt(300).toDouble() + 50;
    _height = random.nextInt(300).toDouble() + 50;
    _color = Color.fromRGBO(random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
    _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble() + 10);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container'),
      ),
      body: Center(
        child: AnimatedContainer(
          width: _width,
          height: _height,
          decoration: BoxDecoration(color: _color, borderRadius: _borderRadius),
          duration: const Duration(milliseconds: 1000),
          curve: Curves.easeOutBack,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onChangeShape,
        child: const Icon(
          Icons.play_circle_outline_rounded,
          size: 35,
        ),
      ),
    );
  }
}
