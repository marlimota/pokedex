import 'package:flutter/material.dart';
import 'package:pokedex/features/domain/entities/pokemon.dart';
import 'package:pokedex/features/presentation/home_page/widgets/pokemon_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.pokemonsList}) : super(key: key);

  final List<PokemonEntity> pokemonsList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Stack(
            children: [
              Text(
                'Pokedéx',
                style: TextStyle(
                  fontFamily: 'Pokemon',
                  fontSize: 32,
                  //color: Colors.amber,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 8
                    ..color = const Color.fromARGB(255, 41, 108, 209),
                ),
              ),
              const Text(
                'Pokedéx',
                style: TextStyle(
                  fontFamily: 'Pokemon',
                  fontSize: 32.5,
                  color: Color.fromARGB(255, 250, 210, 48),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: pokemonsList
              .map(
                (e) => PokemonCard(
                  pokemon: e,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
