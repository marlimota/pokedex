import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:pokedex/core/consts/api_endpoints.dart';
import 'package:pokedex/core/failure/failures.dart';
import 'package:pokedex/features/data/models/pokemon_model.dart';
import 'package:pokedex/features/domain/repositories/pokemon_repository.dart';

class PokemonRepositoryImpl implements IPokemonRepository {
  final Dio dio;

  PokemonRepositoryImpl({required this.dio});

  @override
  Future<List<PokemonModel>> getAllPokemons() async {
    try {
      final reponse = await dio.get(ApiConsts.allPokemonsURL);
      final json = jsonDecode(reponse.data) as Map<String, dynamic>;
      final list = json['pokemon'] as List<dynamic>;
      return list.map((e) => PokemonModel.fromMap(e)).toList();
    } catch (e) {
      throw GeneralFailure(message: e.toString());
    }
  }
}
