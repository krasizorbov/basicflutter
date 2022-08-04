import 'package:flutter/material.dart';

class ScrollDesignScreen extends StatelessWidget {
  const ScrollDesignScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.5,0.5],
            colors: [Color(0xff7EEBCB), Color(0xff3ABAD4)],
          ),
        ),
        child: PageView(scrollDirection: Axis.vertical, children: const [
          _Page1(),
          _Page2(),
        ]),
      ),
    );
  }
}

class _Page1 extends StatelessWidget {
  const _Page1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [_Background(), _MainContent()],
    );
  }
}

class _Page2 extends StatelessWidget {
  const _Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff30BAD6),
      child: Center(
        child: TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            backgroundColor: Colors.blue, 
            shape: const StadiumBorder(), 
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10)
          ),
          child: const Text('Welcome', style: TextStyle(fontSize: 30, color: Colors.black87),),
        ),
      )
    );
  }
}

class _MainContent extends StatelessWidget {
  const _MainContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return SafeArea(
      bottom: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(padding: EdgeInsets.symmetric(horizontal: mq.width * 0.5)),
          const Text(
            '38°',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text('Monday',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
          Expanded(child: Column()),
          const Icon(
            Icons.arrow_drop_down,
            size: 100,
          )
        ],
      ),
    );
  }
}

class _Background extends StatelessWidget {
  const _Background({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color(0xff30BAD6),
        height: double.infinity,
        alignment: Alignment.topCenter,
        child: const Image(image: AssetImage('assets/scroll-1.png')));
  }
}
