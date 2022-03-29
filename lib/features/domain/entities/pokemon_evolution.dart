class PokemonEvolutionEntity {
  final String number;
  final String name;

  PokemonEvolutionEntity({
    required this.number,
    required this.name,
  });

  factory PokemonEvolutionEntity.fromMap(Map<String, dynamic> json) {
    return PokemonEvolutionEntity(name: json['name'], number: json['num']);
  }
}
