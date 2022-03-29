import 'package:flutter/material.dart';
import 'package:pokedex/features/domain/entities/pokemon.dart';
import 'package:pokedex/features/domain/repositories/pokemon_repository.dart';
import 'package:pokedex/features/presentation/home_page/widgets/pokemon_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
    required this.pokemonsList,
    required this.repository,
  }) : super(key: key);

  final List<PokemonEntity> pokemonsList;
  final IPokemonRepository repository;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Pokedéx')),
        ),
        body: GridView.count(
          crossAxisCount: 2,
          children: pokemonsList
              .map(
                (e) => PokemonCard(
                  pokemon: e,
                  repository: repository,
                ),
              )
              .toList(),
        )
        // ListView.builder(
        //   itemCount: pokemonsList.length,
        //   itemBuilder: (BuildContext context, int index) {
        //     return ListTile(
        //       title: GestureDetector(
        //         onTap: () {
        //           Navigator.push(
        //             context,
        //             MaterialPageRoute(
        //                 builder: (context) => DetailsPageContainer(
        //                       pokemonName: pokemonsList[index].name,
        //                       repository: repository,
        //                     )),
        //           );
        //         },
        //         child: PokemonCard(pokemon: pokemonsList[index]),
        //       ),
        //     );
        //   },
        // ),
        );
  }
}
