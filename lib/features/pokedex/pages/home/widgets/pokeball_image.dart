import 'package:fl_pokedex/shared/widgets/pokeball_background_image.dart';
import 'package:flutter/material.dart';

class Pokeball extends StatelessWidget {
  const Pokeball({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Positioned(
      top: -50,
      right: -50,
      child: PokeballBackgroundImage()
    );
  }
}