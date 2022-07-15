import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pokedex/features/presentation/cubit/pokemon_cubit.dart';
import 'package:pokedex/features/presentation/home_page/home_page.dart';
import 'package:pokedex/features/presentation/widgets/error_component.dart';
import 'package:pokedex/features/presentation/widgets/splash_screen.dart';

//Faz o controle do que é mostrado na HomePage de acordo com o estado
class HomePageController extends StatelessWidget {
  const HomePageController({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonCubit, PokemonState>(builder: (context, state) {
      if (state is PokemonInitial) {
        return const SplashScreen();
      }

      if (state is PokemonLoading) {
        return const SplashScreen();
      }

      if (state is PokemonLoaded) {
        return HomePage(
          pokemonsList: state.pokemonList,
        );
      }

      if (state is PokemonError) {
        return const ErrorComponent(errorMessage: ("Erro"));
      }

      return Container(color: Colors.blue);
    });
  }
}
