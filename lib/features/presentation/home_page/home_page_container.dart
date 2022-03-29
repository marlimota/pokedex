import 'package:flutter/material.dart';
import 'package:pokedex/core/failure/failures.dart';

import 'package:pokedex/features/domain/entities/pokemon.dart';
import 'package:pokedex/features/domain/repositories/pokemon_repository.dart';
import 'package:pokedex/features/presentation/home_page/home_page.dart';
import 'package:pokedex/features/presentation/widgets/error_component.dart';
import 'package:pokedex/features/presentation/widgets/loading_component.dart';

//Faz o controle do que é mostrado na HomePage de acordo com o estado
class HomePageContainer extends StatelessWidget {
  const HomePageContainer({Key? key, required this.repository})
      : super(key: key);
  final IPokemonRepository repository;

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
            return HomePage(
              pokemonsList: snapshot.data!,
              repository: repository,
            );
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
