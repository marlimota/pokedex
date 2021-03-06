import 'package:flutter/material.dart';

class PokemonDetailsPage extends StatelessWidget {
  const PokemonDetailsPage({Key? key, required this.pokemonName})
      : super(key: key);

  final String pokemonName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.amber,
        child: Text(pokemonName),
      ),
    );
  }
}
