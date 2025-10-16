import 'package:flutter/material.dart';

class PokedexTitle extends StatelessWidget {
  const PokedexTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Positioned(
      top: 100,
      left: 20,
      child: Text('Pokedex', 
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.black54,
        ),
      ),
    );
  }
}