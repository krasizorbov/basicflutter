import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  // properties
  int counter = 10;

  void increaseCounter() {
    counter++;
    setState(() {});
  }

  void decreaseCounter() {
    counter--;
    setState(() {});
  }

  void resetCounter() {
    counter = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // variables
    const fontSize30 = TextStyle(fontSize: 30);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
        elevation: 10,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Clicks Counter', style: fontSize30),
            Text(counter.toString(), style: fontSize30)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomFloatingActions(
        increaseFn: increaseCounter,
        decreaseFn: decreaseCounter,
        resetFn: resetCounter,
      ),
    );
  }
}

class CustomFloatingActions extends StatelessWidget {
  final Function increaseFn, decreaseFn, resetFn;

  const CustomFloatingActions({
    Key? key,
    required this.increaseFn,
    required this.decreaseFn,
    required this.resetFn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton(
          onPressed: () => increaseFn(),
          child: const Icon(Icons.add),
        ),
        FloatingActionButton(
          onPressed: () => resetFn(),
          child: const Icon(Icons.reset_tv),
        ),
        FloatingActionButton(
          onPressed: () => decreaseFn(),
          child: const Icon(Icons.exposure_minus_1),
        ),
      ],
    );
  }
}
