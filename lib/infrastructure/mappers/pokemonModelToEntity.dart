import 'package:fl_pokedex/domain/entities/pokemon.entity.dart';
import 'package:fl_pokedex/infrastructure/models/pokeapi_pokemon_response.dart';

class PokemonModelToEntity {
  static Pokemon fromModel(PokeapiPokemonResponse model) {
    return Pokemon(
      id: model.id ?? 0,
      name: model.name ?? '',
      imageUrl: model.sprites?.frontDefault ?? '',
      types: model.types?.map((type) => type.type?.name ?? '').toList() ?? [],
    );
  }
}
