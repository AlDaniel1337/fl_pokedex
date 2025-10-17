import 'package:fl_pokedex/features/pokedex/controller/pokedex.controller.dart';
import 'package:fl_pokedex/features/pokedex/pages/home/widgets/pokemon_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


PokedexController _pokedexController = Get.put(PokedexController());
class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 70, left: 10, right: 10,
      child: Obx( () => PokemonSearchBar(
        isLoading: _pokedexController.isLoading.value,
        onSearch: (query) => _pokedexController.searchPokemon(query),
        onClear: () => _pokedexController.clearSearch(),
      )),
    );
  }
}
