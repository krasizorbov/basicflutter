import 'package:flutter/material.dart';
import 'package:movies/providers/movies_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MoviesProvider>(context, listen: true);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Movies In Cinema'),
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.search_outlined))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              // CardSwiper
              CardSwiper(movies: movieProvider.onDisplayMovies),
              const SizedBox(
                height: 20,
              ),
              // List of movies
              const MovieSlider()
            ],
          ),
        ));
  }
}
