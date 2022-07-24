import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertScreen extends StatelessWidget {
  void displayDialogIOS(BuildContext context) {
    showCupertinoDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return AlertDialog(
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel', style: TextStyle(color: Colors.red))),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
            elevation: 5,
            shape: RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.circular(10)),
            title: const Text('IOS'),
            content: Column(mainAxisSize: MainAxisSize.min, children: const [
              Text('This is the content of the alert!'),
              SizedBox(height: 10),
              FlutterLogo(size: 120)
            ]),
          );
        });
  }

  void displayDialogAndroid(BuildContext context) {
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return AlertDialog(
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel', style: TextStyle(color: Colors.red))),
              TextButton(onPressed: () => Navigator.pop(context), child: const Text('OK')),
            ],
            elevation: 5,
            shape: RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.circular(10)),
            title: const Text('Android'),
            content: Column(mainAxisSize: MainAxisSize.min, children: const [
              Text('This is the content of the alert!'),
              SizedBox(height: 10),
              FlutterLogo(size: 120)
            ]),
          );
        });
  }

  const AlertScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.red, shape: const StadiumBorder(), elevation: 10),
            onPressed: () => Platform.isAndroid ? displayDialogAndroid(context) : displayDialogIOS(context),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text('Show Alert', style: TextStyle(fontSize: 16)),
            )),
      ),
      floatingActionButton:
        FloatingActionButton(child: const Icon(Icons.close), onPressed: () => Navigator.pop(context)),
    );
  }
}
