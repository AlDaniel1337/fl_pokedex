import 'package:fl_pokedex/core/storage/get_storage.plugin.dart';
import 'package:fl_pokedex/core/theme/app_theme.controller.dart';
import 'package:fl_pokedex/domain/entities/pokemon.entity.dart';
import 'package:fl_pokedex/features/pokedex/controller/pokedex.controller.dart';
import 'package:fl_pokedex/shared/widgets/widgets.index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './widgets/widgets.index.dart';

PokedexController _pokedexController = Get.put(PokedexController());
ThemeController _themeController = Get.put(ThemeController());
FavoritesController _favController = Get.put(FavoritesController());

class PokemonDetailsPage extends StatelessWidget {

  static const String route = "/PokemonDetailsPage";
   
  const PokemonDetailsPage({super.key});
  
  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    final selectedPokemon = _pokedexController.selectedPokemon;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(

      body: SingleChildScrollView(
        child: SizedBox(
          height: 1000,
          width: size.width,
          child: Stack(
            children: [
          
              Positioned(
                top: 0, left: 0, right: 0,
                child: UContainer(
                  color: _themeController.isDarkMode.value ? colorScheme.secondary : colorScheme.primary,
                  size: size,
                  child: const Center(
                    child: PokeballBackgroundImage(),
                  ),
                ),
              ),
          
              Positioned(
                top: 150, left: (size.width / 2) - 75,
                child: SizedBox(
                  width: 150,
                  height: 150,
                  child: Image.network(
                    selectedPokemon.animationUrl ?? selectedPokemon.imageUrl,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
          
          
              Positioned(
                top: 40, left: 0, right: 0,
                child: Obx( () => RowButtons(
                  isFavorite: _favController.isFavorite(selectedPokemon.id),
                  onFavoritePressed: () {
                    _favController.toggleFavorite(selectedPokemon);
                  },
                )),
              ),
          
              Positioned(
                top: 390, left: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  width: size.width,
                  height: size.height - 400,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                            
                        PokemonName(name: selectedPokemon.name),
                        const SizedBox(height: 10),
                        PokemonTypes(selectedPokemon: selectedPokemon),
                        const SizedBox(height: 10),
                        _RowDetails(selectedPokemon: selectedPokemon, size: size),
                        const SizedBox(height: 20),
                            
                        StatsList(stats: selectedPokemon.stats, size: size),
                        AbilitiesList(
                          data: selectedPokemon.abilities,
                          title: 'Habilidades',
                        ),
                        
                        AbilitiesList(
                          data: selectedPokemon.moves,
                          title: 'Movimientos',
                        ),
                  
                      ],
                    ),
                  ),
                )
              ),
          
              
          
            ],
          ),
        ),
      ),
    );
  }
}


class _RowDetails extends StatelessWidget {
  const _RowDetails({
    required this.selectedPokemon,
    required this.size,
  });

  final Pokemon selectedPokemon;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return PokemonRowImportanData(
      children: [
        InfoBox(
          label: 'Altura',
          value: selectedPokemon.height ?? 'N/A',
          width: size.width * 0.3,
        ),
        InfoBox(
          label: 'Peso',
          value: selectedPokemon.weight ?? 'N/A',
          width: size.width * 0.3,
        ),
      ],
    );
  }
}
