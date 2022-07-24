import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Cards')),
        body: ListView(padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20), children: const [
          CustomCardType1(),
          SizedBox(
            height: 10,
          ),
          CustomCardType2(
            imageName: 'a beautiful car',
            imageUrl:
              'https://images.pexels.com/photos/170811/pexels-photo-170811.jpeg?cs=srgb&dl=pexels-mike-b-170811.jpg&fm=jpg',
          ),
          SizedBox(
            height: 10,
          ),
          CustomCardType2(
            imageName: 'a monster',
            imageUrl:
              'https://images.unsplash.com/photo-1580273916550-e323be2ae537?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzR8fGNhcnN8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
          ),
          SizedBox(
            height: 10,
          ),
          CustomCardType2(
            imageName: null,
            imageUrl:
              'https://images.unsplash.com/photo-1581020296922-1f7baa581f12?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OTh8fGNhcnN8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60')
        ])
      );
  }
}
