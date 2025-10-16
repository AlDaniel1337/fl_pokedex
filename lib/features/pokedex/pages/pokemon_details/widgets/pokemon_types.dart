import 'package:fl_pokedex/core/assets/assets.enum.dart';
import 'package:fl_pokedex/domain/entities/pokemon.entity.dart';
import 'package:fl_pokedex/features/pokedex/pages/pokemon_details/widgets/widgets.index.dart';
import 'package:flutter/material.dart';


class PokemonTypes extends StatelessWidget {
  const PokemonTypes({
    super.key,
    required this.selectedPokemon,
  });

  final Pokemon selectedPokemon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...selectedPokemon.types.map((type) => Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: TypeContainer(
            typeName: type[0].toUpperCase() + type.substring(1),
            typeColor: Colors.white10,
            child: Image.asset(
              TypesAssets.getAssetByName(type).imageUrl,
              fit: BoxFit.contain,
            ),
          ),
        )),
      ],
    );
  }
}
