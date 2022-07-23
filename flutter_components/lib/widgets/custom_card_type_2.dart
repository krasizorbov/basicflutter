import 'package:flutter/material.dart';

import '../themes/app.theme.dart';

class CustomCardType2 extends StatelessWidget {
  final String imageUrl;
  final String? imageName;
  const CustomCardType2({Key? key, required this.imageUrl, this.imageName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      elevation: 100,
      shadowColor: AppTheme.primary.withOpacity(0.5),
      child: Column(
        children: [
          FadeInImage(
            image: NetworkImage(imageUrl),
            placeholder: const AssetImage('assets/Loading_icon.gif'),
            width: double.infinity,
            height: 230,
            fit: BoxFit.cover,
            fadeInDuration: const Duration(milliseconds: 300),
          ),
          if (imageName != null)
            Container(
              alignment: AlignmentDirectional.centerEnd,
              padding: const EdgeInsets.only(top: 10, bottom: 10, right: 20),
              child: Text(imageName ?? 'No Title'))
        ],
      ),
    );
  }
}
