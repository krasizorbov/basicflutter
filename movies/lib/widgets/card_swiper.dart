import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import '../models/movie.dart';

class CardSwiper extends StatelessWidget {
  final List<Movie> movies;
  const CardSwiper({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: mediaQuery.height * 0.45,
      child: Swiper(
        itemCount: movies.length,
        layout: SwiperLayout.STACK,
        itemWidth: mediaQuery.width * 0.6,
        itemHeight: mediaQuery.height * 0.5,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details',
                arguments: 'movies-in-cinema'),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/no-image.jpg'),
                image: NetworkImage(movie.fullPosterPath),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
