import 'package:flutter/material.dart';
import 'package:pokedex/features/domain/entities/pokemon.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({Key? key, required this.pokemon}) : super(key: key);

  final PokemonEntity pokemon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: pokemon.baseColor?.withOpacity(0.80),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              pokemon.name,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Text(
              pokemon.number,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                PokemonType(
                  pokemon: pokemon,
                ),
                Flexible(
                  child: CachedNetworkImage(
                    imageUrl: pokemon.image,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(
                      color: Colors.amber,
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                )
                //Image.network(pokemon.image),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PokemonType extends StatelessWidget {
  const PokemonType({Key? key, required this.pokemon}) : super(key: key);

  final PokemonEntity pokemon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 82,
      width: 80,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: pokemon.type.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 60,
                height: 26,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(18)),
                child: Center(
                  child: Text(
                    pokemon.type[index],
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          );
        },
      ),
    );
  }
}
