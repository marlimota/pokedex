import 'package:flutter/material.dart';
import 'package:pokedex/features/domain/entities/pokemon.dart';
import 'package:pokedex/features/presentation/home_page/widgets/pokemon_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.pokemonsList}) : super(key: key);

  final List<PokemonEntity> pokemonsList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 219, 251, 246),
      appBar: AppBar(
        shadowColor: const Color.fromARGB(255, 33, 60, 56),
        backgroundColor: const Color.fromARGB(255, 0, 157, 120),
        title: Stack(
          children: [
            Center(
              child: Text(
                'Pokedex',
                style: TextStyle(
                  height: 3,
                  fontFamily: 'Moderna',
                  fontSize: 42,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 6
                    ..color = Color.fromARGB(181, 132, 207, 192),
                  //color: Color.fromARGB(255, 232, 249, 247),
                ),
              ),
            ),
            const Center(
              child: Text(
                'Pokedex',
                style: TextStyle(
                  height: 3,
                  fontFamily: 'Moderna',
                  fontSize: 42,
                  color: Color.fromARGB(255, 232, 249, 247),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Expanded(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image.asset(
                'assets/images/logo.png',
                repeat: ImageRepeat.repeat,
                scale: 3,
                color: const Color.fromARGB(30, 17, 187, 173),
              ),
            ),
          ),
          GridView.count(
            crossAxisCount: 2,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            children: pokemonsList
                .map(
                  (e) => PokemonCard(
                    pokemon: e,
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

//font pokemon com contorno no texto
      //title:
      // Center(
      //   child: Stack(
      //     children: [
      //       Text(
      //         'Pokedéx',
      //         style: TextStyle(
      //           fontFamily: 'Pokemon',
      //           fontSize: 32,
      //           //color: Colors.amber,
      //           foreground: Paint()
      //             ..style = PaintingStyle.stroke
      //             ..strokeWidth = 8
      //             ..color = const Color.fromARGB(255, 41, 108, 209),
      //         ),
      //       ),
      //       const Text(
      //         'Pokedéx',
      //         style: TextStyle(
      //           fontFamily: 'Pokemon',
      //           fontSize: 32.5,
      //           color: Color.fromARGB(255, 250, 210, 48),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      //),