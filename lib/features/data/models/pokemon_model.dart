import 'package:flutter/material.dart';
import 'package:pokedex/features/domain/entities/pokemon.dart';
import 'package:pokedex/features/domain/entities/pokemon_evolution.dart';

class PokemonModel extends PokemonEntity {
  PokemonModel(
      {required int id,
      required String number,
      required List<String> type,
      required List<String> weaknesses,
      required List<PokemonEvolutionEntity>? nextEvolution,
      required List<PokemonEvolutionEntity>? preEvolution,
      required String name,
      required String image})
      : super(
            id: id,
            number: number,
            type: type,
            weaknesses: weaknesses,
            nextEvolution: nextEvolution,
            preEvolution: preEvolution,
            name: name,
            image: image);

  factory PokemonModel.fromMap(Map<String, dynamic> json) {
    return PokemonModel(
        id: json['id'],
        image: json['img'],
        name: json['name'],
        nextEvolution: json['next_evolution'] != null
            ? (json['next_evolution'] as List<dynamic>)
                .map((e) => PokemonEvolutionEntity.fromMap(e))
                .toList()
            : null,
        preEvolution: json['prev_evolution'] != null
            ? (json['prev_evolution'] as List<dynamic>)
                .map((e) => PokemonEvolutionEntity.fromMap(e))
                .toList()
            : null,
        number: json['num'],
        type: (json['type'] as List<dynamic>).map((e) => e as String).toList(),
        weaknesses: (json['weaknesses'] as List<dynamic>)
            .map((e) => e as String)
            .toList());
  }

  @override
  Color? get baseColor => _color(type: type[0]);

  static Color? _color({required String type}) {
    switch (type) {
      case 'Normal':
        return Colors.brown[400];
      case 'Fire':
        return Colors.red;
      case 'Water':
        return Colors.blue;
      case 'Grass':
        return Colors.green;
      case 'Electric':
        return Colors.amber;
      case 'Ice':
        return Colors.cyanAccent[400];
      case 'Fighting':
        return Colors.orange;
      case 'Poison':
        return Colors.purple;
      case 'Ground':
        return Colors.orange[300];
      case 'Flying':
        return Colors.indigo[200];
      case 'Psychic':
        return Colors.pink;
      case 'Bug':
        return Colors.lightGreen[500];
      case 'Rock':
        return Colors.grey;
      case 'Ghost':
        return Colors.indigo[400];
      case 'Dark':
        return Colors.brown;
      case 'Dragon':
        return Colors.indigo[800];
      case 'Steel':
        return Colors.blueGrey;
      case 'Fairy':
        return Colors.pinkAccent[100];
      default:
        return Colors.grey;
    }
  }
}
