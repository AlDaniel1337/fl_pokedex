import 'package:flutter/material.dart';

class PokemonName extends StatelessWidget {
  const PokemonName({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return Text(
      name[0].toUpperCase() + name.substring(1),
      style: const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
