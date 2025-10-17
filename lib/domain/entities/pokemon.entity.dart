class Pokemon {
  final int id;
  final String name;
  final String imageUrl;
  final String? animationUrl;
  final List<String> types;
  final List<String> abilities;
  final List<Stats> stats;
  final List<String> moves;
  final String? description;
  final String? height;
  final String? weight;
  final String? evolutionChain;

  Pokemon({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.types,
    required this.stats,
    required this.abilities,
    required this.moves,
    this.animationUrl,
    this.description,
    this.height,
    this.weight,
    this.evolutionChain,
  });
}

class Stats {
  final String name;
  final int value;

  Stats({
    required this.name,
    required this.value,
  });
}