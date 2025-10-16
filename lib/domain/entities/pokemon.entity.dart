class Pokemon {
  final int id;
  final String name;
  final String imageUrl;
  final String? animationUrl;
  final List<String> types;
  final List<Stats> stats;
  final String? description;
  final String? height;
  final String? weight;

  Pokemon({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.types,
    required this.stats,
    this.animationUrl,
    this.description,
    this.height,
    this.weight,
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