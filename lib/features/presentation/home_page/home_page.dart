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
                    ..color = const Color.fromARGB(255, 52, 102, 175),
                ),
              ),
              const Text(
                'Pokedéx',
                style: TextStyle(
                  fontFamily: 'Pokemon',
                  fontSize: 32,
                  color: Color.fromARGB(255, 255, 203, 5),
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
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(16, 243, 52, 38),
        selectedFontSize: 14,
        selectedIconTheme: const IconThemeData(
            color: Color.fromARGB(255, 251, 36, 21), size: 30),
        selectedItemColor: const Color.fromARGB(255, 251, 36, 21),
        selectedLabelStyle: const TextStyle(),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.badge_sharp),
            label: 'Time',
          ),
        ],
      ),
    );
  }
}
