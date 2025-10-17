import 'package:fl_pokedex/domain/entities/pokemon.entity.dart';
import 'package:fl_pokedex/infrastructure/models/pokeapi_pokemon_response.dart';

class PokemonModelToEntity {
  static Pokemon fromModel(PokeapiPokemonResponse model) {
    return Pokemon(
      id: model.id ?? 0,
      name: model.name ?? '',
      imageUrl: model.sprites?.other?.dreamWorld?.frontDefault ?? model.sprites?.frontDefault ?? '',
      types: model.types?.map((type) => type.type?.name ?? '').toList() ?? [],
      animationUrl: model.sprites?.other?.showdown?.frontDefault ?? model.sprites?.frontDefault,
      description: null,
      height: '${( (model.height ?? 0) / 10)} m',
      weight: _libsToKilos("${model.weight ?? 0}"),
      stats: model.stats?.map((stat) => Stats(
        name: stat.stat?.name ?? '',
        value: stat.baseStat ?? 0,
      )).toList() ?? [],
      abilities: model.abilities?.map((ability) => ability.ability?.name ?? '').toList() ?? [],
      moves: model.moves?.map((move) => move.move?.name ?? '').toList() ?? [],
    );
  }

  static String? _libsToKilos(String libs) {
    final kilos = double.tryParse(libs) != null ? (double.parse(libs) / 10).toStringAsFixed(1) : null;
    return kilos != null ? '$kilos kg' : null;
  }
}
