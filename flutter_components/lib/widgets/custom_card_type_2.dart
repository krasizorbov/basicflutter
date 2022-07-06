import 'package:flutter/material.dart';

import '../themes/app.theme.dart';

class CustomCardType2 extends StatelessWidget {
  const CustomCardType2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      elevation: 10,
      shadowColor: AppTheme.primary.withOpacity(0.5),
      child: Column(
        children: [
          const FadeInImage(
            image: NetworkImage(
                'https://images.pexels.com/photos/170811/pexels-photo-170811.jpeg?cs=srgb&dl=pexels-mike-b-170811.jpg&fm=jpg'), 
                placeholder: AssetImage('assets/jar-loading.gif'),
                width: double.infinity,
                height: 230,
                fit: BoxFit.cover,
                fadeInDuration: Duration(milliseconds: 300),
          ),
          Container(
            alignment: AlignmentDirectional.centerEnd,
            padding: const EdgeInsets.only(top: 10, bottom: 10, right: 20),
            child: const Text('A beautiful car'))
        ],
      ),
    );
  }
}
