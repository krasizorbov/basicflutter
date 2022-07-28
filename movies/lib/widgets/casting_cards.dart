import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/providers/movies_provider.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';

class CastingCards extends StatelessWidget {
  final int movieID;
  const CastingCards({Key? key, required this.movieID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);
    return FutureBuilder(
      future: moviesProvider.getMovieCast(movieID),
      builder: (context, AsyncSnapshot<List<Cast>> snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox(
              height: 180, child: CupertinoActivityIndicator());
        }
        final cast = snapshot.data!;
        return Container(
          margin: const EdgeInsets.only(bottom: 20),
          width: double.infinity,
          height: 180,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: cast.length,
              itemBuilder: (context, index) => _SingleCard(cast[index])),
        );
      },
    );
  }
}

class _SingleCard extends StatelessWidget {
  final Cast actor;
  const _SingleCard(this.actor);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 110,
      height: 100,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: FadeInImage(
              placeholder: const AssetImage('assets/no-image.jpg'),
              image: NetworkImage(actor.fullProfilePath),
              height: 120,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            actor.name,
            style: Theme.of(context).textTheme.titleSmall,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
