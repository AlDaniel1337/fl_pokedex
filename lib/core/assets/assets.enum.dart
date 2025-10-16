enum Assets {
  pokeballBackground(imageUrl: 'assets/pokeball.png');

  const Assets({ 
    required String imageUrl,
  }) : _imageUrl = imageUrl;

  final String _imageUrl;
  String get imageUrl => _imageUrl;

}

enum TypesAssets {
  bug(type: 'Bug', imageUrl: 'assets/types/Pokemon_Type_Icon_Bug.png'),
  dark(type: 'Dark', imageUrl: 'assets/types/Pokemon_Type_Icon_Dark.png'),
  dragon(type: 'Dragon', imageUrl: 'assets/types/Pokemon_Type_Icon_Dragon.png'),
  electric(type: 'Electric', imageUrl: 'assets/types/Pokemon_Type_Icon_Electric.png'),
  fairy(type: 'Fairy', imageUrl: 'assets/types/Pokemon_Type_Icon_Fairy.png'),
  fighting(type: 'Fighting', imageUrl: 'assets/types/Pokemon_Type_Icon_Fighting.png'),
  fire(type: 'Fire', imageUrl: 'assets/types/Pokemon_Type_Icon_Fire.png'),
  flying(type: 'Flying', imageUrl: 'assets/types/Pokemon_Type_Icon_Flying.png'),
  ghost(type: 'Ghost', imageUrl: 'assets/types/Pokemon_Type_Icon_Ghost.png'),
  grass(type: 'Grass', imageUrl: 'assets/types/Pokemon_Type_Icon_Grass.png'),
  ground(type: 'Ground', imageUrl: 'assets/types/Pokemon_Type_Icon_Ground.png'),
  ice(type: 'Ice', imageUrl: 'assets/types/Pokemon_Type_Icon_Ice.png'),
  normal(type: 'Normal', imageUrl: 'assets/types/Pokemon_Type_Icon_Normal.png'),
  poison(type: 'Poison', imageUrl: 'assets/types/Pokemon_Type_Icon_Poison.png'),
  psychic(type: 'Psychic', imageUrl: 'assets/types/Pokemon_Type_Icon_Psychic.png'),
  rock(type: 'Rock', imageUrl: 'assets/types/Pokemon_Type_Icon_Rock.png'),
  steel(type: 'Steel', imageUrl: 'assets/types/Pokemon_Type_Icon_Steel.png'),
  water(type: 'Water', imageUrl: 'assets/types/Pokemon_Type_Icon_Water.png'),
  unknown(type: 'Unknown', imageUrl: 'assets/pokeball.png');

  const TypesAssets({ 
    required String type,
    required String imageUrl,
  }) : _imageUrl = imageUrl;

  final String _imageUrl;
  String get imageUrl => _imageUrl;

  // Método estático para obtener el enum en base al nombre (String)
  static TypesAssets getAssetByName(String name) {
    final lowerCaseName = name.toLowerCase();
    try {
      return TypesAssets.values.firstWhere(
        (typeAsset) => typeAsset.name == lowerCaseName,
      );
    } catch (e) {
      print('Warning: Asset not found for type: $name');
      return TypesAssets.unknown; // Retorna un valor por defecto
    }
  }

}