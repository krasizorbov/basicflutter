import 'package:flutter/material.dart';

class Background extends StatelessWidget {
   
  const Background({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    var boxDecoration = const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.2, 0.7],
                colors: [Color(0xff2E305F), Color(0xff202333)],
              ),
            );

    return Stack(
      children: [
        Container(
          decoration: boxDecoration,
        ),
        const Positioned(
          top: -100,
          left: -30,
          child: _PinkBox()
        ),
      ],
    );
  }
}


class _PinkBox extends StatelessWidget {
   
  const _PinkBox({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 45,
      child: Container(
        width: 360,
        height: 360,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(80),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color.fromRGBO(236, 88, 188, 1), Color.fromRGBO(241, 142, 172, 1)],
          ),
        ),
      ),
    );
  }
}