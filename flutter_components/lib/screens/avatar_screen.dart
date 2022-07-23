import 'package:flutter/material.dart';

class AvatarScreen extends StatelessWidget {
   
  const AvatarScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Avatars'), actions: [
        Container(
          margin: const EdgeInsets.all(8.0),
          child: const CircleAvatar(backgroundColor: Colors.black12, child: Text('KZ')),
        )
      ],),
  
      body: const Center(
         child: CircleAvatar(
          radius: 150,
          backgroundImage: NetworkImage('https://images.unsplash.com/photo-1624391673156-a7b7f6c5fb12?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Z3VpdGFyc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60'),
         ),
      ),
    );
  }
}