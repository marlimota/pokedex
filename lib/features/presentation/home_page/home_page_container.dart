import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pokedex/features/presentation/cubit/pokemon_cubit.dart';
import 'package:pokedex/features/presentation/home_page/home_page.dart';
import 'package:pokedex/features/presentation/widgets/error_component.dart';
import 'package:pokedex/features/presentation/widgets/loading_component.dart';

//Faz o controle do que é mostrado na HomePage de acordo com o estado
class HomePageContainer extends StatelessWidget {
  const HomePageContainer({Key? key,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonCubit, PokemonState>(
      builder: (context, state){

        if(state is PokemonInitial)
        {
          return Container();
        }

        if(state is PokemonLoading)
        {
          return const LoadingComponent();
        }

        if(state is PokemonLoaded)
        {
          return HomePage(
              pokemonsList: state.pokemonList,
            );
        }

        if(state is PokemonError)
        {
          return const ErrorComponent( errorMessage: ("Erro"));
        }

        return Container(color: Colors.blue);

      }
    );
  }
}
