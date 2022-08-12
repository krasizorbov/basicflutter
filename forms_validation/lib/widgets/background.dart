import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(children: [
        const _PurpleBox(),
        SafeArea(
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 50),
            child: const Icon(
              Icons.person_pin,
              color: Colors.white,
              size: 100,
            ),
          ),
        ),
        child
      ]),
    );
  }
}

class _PurpleBox extends StatelessWidget {
  const _PurpleBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: mq.height * 0.4,
      decoration: _purpleBoxDecoration(),
      child: Stack(
        children: const [
          Positioned(
            top: 90,
            left: 30,
            child: _Bubble(),
          ),
          Positioned(
            top: 150,
            left: 250,
            child: _Bubble(),
          ),
          Positioned(
            top: 300,
            left: 70,
            child: _Bubble(),
          ),
        ],
      ),
    );
  }

  BoxDecoration _purpleBoxDecoration() => const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(63, 63, 156, 1),
            Color.fromRGBO(90, 70, 178, 1),
          ],
        ),
      );
}

class _Bubble extends StatelessWidget {
  const _Bubble({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: const Color.fromRGBO(255, 255, 255, 0.05)),
    );
  }
}
