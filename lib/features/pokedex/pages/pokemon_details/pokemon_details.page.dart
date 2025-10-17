import 'package:fl_pokedex/core/theme/app_theme.controller.dart';
import 'package:fl_pokedex/domain/entities/pokemon.entity.dart';
import 'package:fl_pokedex/features/pokedex/controller/pokedex.controller.dart';
import 'package:fl_pokedex/shared/widgets/widgets.index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './widgets/widgets.index.dart';

PokedexController _pokedexController = Get.put(PokedexController());
ThemeController _themeController = Get.put(ThemeController());
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
                child: RowButtons(
                  onFavoritePressed: () {},
                ),
              ),
          
              Positioned(
                top: 390, left: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  width: size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
          
                      PokemonName(name: selectedPokemon.name),
                      const SizedBox(height: 10),
                      PokemonTypes(selectedPokemon: selectedPokemon),
                      const SizedBox(height: 10),
                      _RowDetails(selectedPokemon: selectedPokemon, size: size),
                      const SizedBox(height: 20),
          
                      ...selectedPokemon.stats.map((stat) => 
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: PokemonStatRow(
                            statName: stat.name, 
                            statValue: stat.value.toDouble(), 
                            barValue: size.width * 0.6
                          ),
                        )
                      ),
          
                      ...selectedPokemon.abilities.isNotEmpty ? [
                        const SizedBox(height: 20),
                        const Text('Habilidades', 
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                          )
                        ),
                        const SizedBox(height: 10),
                        Wrap(
                          spacing: 8.0,
                          runSpacing: 4.0,
                          children: selectedPokemon.abilities.map((ability) => Chip(
                            label: Text(ability[0].toUpperCase() + ability.substring(1)),
                            backgroundColor: Colors.white10,
                          )).toList(),
                        ),
                      ] : [],
                      
          
                    ],
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

class PokemonStatRow extends StatelessWidget {

  final String statName;
  final double statValue;
  final double barValue;

  const PokemonStatRow({
    super.key,
    required this.statName,
    required this.statValue,
    required this.barValue,
  });


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        SizedBox(
          width: 80,
          child: Text(statName, 
            style: const TextStyle(
              fontSize: 16
            )
          ),
        ),

        Text( statValue.toString(), 
          style: const TextStyle(
            fontWeight: FontWeight.bold, 
            fontSize: 16
          )
        ),

        SizedBox(
          width: barValue,
          child: LinearProgressIndicator(
            value: statValue / 100,
            backgroundColor: Colors.grey[300],
            color: (statValue / 100 >= 0.5) ?Colors.green : Colors.red,
            minHeight: 4,
            semanticsLabel: statName,
          ),
        ),
      ],
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
