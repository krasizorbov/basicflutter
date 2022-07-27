import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies In Cinema'),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: (){}, 
            icon: const Icon(Icons.search_outlined)
          )
        ],
      ),
      
      body: SingleChildScrollView(
        child: Column(
        children: const [
          SizedBox(height: 20,),
          // CardSwiper
          CardSwiper(),
          SizedBox(height: 20,),
          // List of movies
          MovieSlider()
        ],
      ),)
    );
  }
}