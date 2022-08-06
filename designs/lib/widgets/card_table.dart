import 'dart:ui';

import 'package:flutter/material.dart';

class CardTable extends StatelessWidget {
  const CardTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      children: const [
        TableRow(
          children: [
            _SingleCard(icon: Icons.account_box, color: Colors.blue, text: 'User data',), 
            _SingleCard(icon: Icons.account_balance_wallet_sharp, color: Colors.red, text: 'Transfer',)
          ]
        ),
        TableRow(
          children: [
            _SingleCard(icon: Icons.add_a_photo, color: Color.fromARGB(255, 173, 57, 211), text: 'Add photo',), 
            _SingleCard(icon: Icons.add_call, color: Colors.lightGreen, text: 'Add call',)
          ]
        ),
        TableRow(
          children: [
            _SingleCard(icon: Icons.airplane_ticket_outlined, color: Color.fromARGB(255, 205, 228, 58), text: 'Airplane ticket',), 
            _SingleCard(icon: Icons.android_rounded, color: Color.fromARGB(255, 94, 69, 67), text: 'Android',)
          ]
        ),
        TableRow(
          children: [
            _SingleCard(icon: Icons.facebook_sharp, color: Color.fromARGB(255, 18, 143, 139), text: 'Facebook',), 
            _SingleCard(icon: Icons.headset, color: Color.fromARGB(255, 233, 236, 28), text: 'Headset',)
          ]
        ),
      ],
    );
  }
}

class _SingleCard extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;
  const _SingleCard({Key? key, required this.icon, required this.color, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            height: 180,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(62, 66, 107, 0.7),
              borderRadius: BorderRadius.circular(20)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, 
                children: [
                  CircleAvatar(
                    backgroundColor: color,
                    radius: 40,
                    child: Icon(icon, size: 50,),
                ),
              const SizedBox(
                height: 20,
              ),
              Text(
                text,
                style: TextStyle(color: color, fontSize: 18),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
