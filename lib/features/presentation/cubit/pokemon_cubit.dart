import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:pokedex/features/domain/entities/pokemon.dart';

import '../../data/repositories/pokemon_repository_impl.dart';
import '../../domain/repositories/pokemon_repository.dart';

part 'pokemon_state.dart';

class PokemonCubit extends Cubit<PokemonState> {

  PokemonCubit() : super(PokemonInitial())
  {
    GetPokemons();
  }

  Future<void> GetPokemons() async
  {
    emit(PokemonLoading());

    final IPokemonRepository repository = PokemonRepositoryImpl(dio: Dio());

    List<PokemonEntity> pokemonList = await repository.getAllPokemons();

    emit(PokemonLoaded(pokemonList));
  }
}
