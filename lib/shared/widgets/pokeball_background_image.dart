import 'package:fl_pokedex/core/assets/assets.enum.dart';
import 'package:flutter/material.dart';

class PokeballBackgroundImage extends StatelessWidget {

  final double size;

  const PokeballBackgroundImage({
    super.key, 
    this.size = 250
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset( 
      Assets.pokeballBackground.imageUrl,
      fit: BoxFit.fitWidth,
      width: size,
    );
  }
}