import 'package:flutter/material.dart';
import 'package:pokedex/features/domain/entities/pokemon.dart';
import 'package:pokedex/features/domain/repositories/pokemon_repository.dart';
import 'package:pokedex/features/presentation/details_page/details_page_container.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({Key? key, required this.pokemon, required this.repository})
      : super(key: key);

  final PokemonEntity pokemon;
  final IPokemonRepository repository;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailsPageContainer(
                    pokemonName: pokemon.name,
                    repository: repository,
                  )),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: pokemon.baseColor?.withOpacity(0.65),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              pokemon.name,
              style: TextStyle(
                color: pokemon.baseColor?.withOpacity(0.6),
                fontWeight: FontWeight.bold,
                shadows: const [
                  Shadow(
                    color: Color.fromARGB(255, 46, 45, 45),
                    blurRadius: 1,
                  ),
                ],
                fontSize: 17,
              ),
            ),
            Text(
              pokemon.number,
              style: TextStyle(
                color: pokemon.baseColor?.withOpacity(0.6),
                fontWeight: FontWeight.bold,
                //backgroundColor: Colors.white,
                shadows: const [
                  Shadow(
                    color: Color.fromARGB(255, 46, 45, 45),
                    blurRadius: 1,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                PokemonType(
                  pokemon: pokemon,
                ),
                Flexible(child: Image.network(pokemon.image)),
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
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(18)),
                child: Padding(
                  padding: const EdgeInsets.all(6),
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
