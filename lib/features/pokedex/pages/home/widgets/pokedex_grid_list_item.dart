import 'package:fl_pokedex/core/plugins/svg_image/svg.plugin.dart';
import 'package:fl_pokedex/core/theme/app_theme.controller.dart';
import 'package:fl_pokedex/domain/entities/pokemon.entity.dart';
import 'package:fl_pokedex/shared/widgets/pokeball_background_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

ThemeController _themeController = Get.put(ThemeController());
class PokedexGridListItem extends StatelessWidget {

  final int index;
  final double imageSize;
  final Pokemon pokemon;
  final VoidCallback? onTap;

  const PokedexGridListItem({
    super.key,
    required this.index,
    required this.imageSize,
    required this.pokemon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: _themeController.isDarkMode.value ? colorScheme.secondary : colorScheme.primary,
        borderRadius: BorderRadius.circular(15)
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: onTap,
          child: Center(
            child: Stack(
              children: [

                _PokemonNumber(id: pokemon.id),
                _PokemonName(name: pokemon.name),
                _PokeballImage(imageSize: imageSize),
                _PokemonImage(pokemon: pokemon),
                _Types(pokemon: pokemon)

              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Types extends StatelessWidget {
  const _Types({
    required this.pokemon,
  });

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 80,
      left: 10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: pokemon.types.map((type) => Container(

          margin: const EdgeInsets.only(bottom: 5),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.white24,
            borderRadius: BorderRadius.circular(20)
          ),

          child: Text(
            type[0].toUpperCase() + type.substring(1),
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),
          ),
          
        )).toList(),
      ),
    );
  }
}

class _PokemonImage extends StatelessWidget {
  const _PokemonImage({
    required this.pokemon,
  });

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {

    var isSVGImage = pokemon.imageUrl.endsWith('.svg');

    return Positioned(
      bottom: 0,
      right: 0,
      child: SizedBox(
        width: 100, height: 100,
        child: isSVGImage 
        ? SvgImage( imageUrl: pokemon.imageUrl ) 
        : Image.network(
          pokemon.imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PokeballImage extends StatelessWidget {
  const _PokeballImage({
    required this.imageSize,
  });

  final double imageSize;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: -20,
      right: -20,
      child: PokeballBackgroundImage( size: imageSize )
    );
  }
}

class _PokemonName extends StatelessWidget {
  const _PokemonName({
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {

    var pokemonName = name[0].toUpperCase() + name.substring(1);

    return Positioned(
      top: 40,
      left: 10,
      child: Text( pokemonName,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20
        ),
      ),
    );
  }
}

class _PokemonNumber extends StatelessWidget {
  const _PokemonNumber({
    required this.id,
  });

  final int id;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10,
      left: 10,
      child: Text(
        '#$id',
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}