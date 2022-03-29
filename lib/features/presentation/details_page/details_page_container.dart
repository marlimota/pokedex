import 'package:flutter/material.dart';
import 'package:pokedex/core/failure/failures.dart';

import 'package:pokedex/features/domain/entities/pokemon.dart';
import 'package:pokedex/features/domain/repositories/pokemon_repository.dart';
import 'package:pokedex/features/presentation/details_page/details_page.dart';
import 'package:pokedex/features/presentation/widgets/error_component.dart';
import 'package:pokedex/features/presentation/widgets/loading_component.dart';

//Faz o controle do que é mostrado na HomePage de acordo com o estado
class DetailsPageContainer extends StatelessWidget {
  const DetailsPageContainer(
      {Key? key, required this.repository, required this.pokemonName})
      : super(key: key);
  final IPokemonRepository repository;
  final String pokemonName;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PokemonEntity>>(
        future: repository.getAllPokemons(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingComponent();
          }
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return PokemonDetailsPage(pokemonName: pokemonName);
          }
          if (snapshot.hasError) {
            return ErrorComponent(
              errorMessage: (snapshot.error as GeneralFailure).responseMessage!,
            );
          }
          return Container(color: Colors.blue);
        });
  }
}
