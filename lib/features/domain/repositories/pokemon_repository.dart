import 'package:pokedex/features/domain/entities/pokemon.dart';

abstract class IPokemonRepository {
  //contrato que faz "meio de campo" com a camada de presentation
  //a implementação se dá na camada de data
  //método que "pega" as infos dos pokemons
  Future<List<PokemonEntity>> getAllPokemons();
}
