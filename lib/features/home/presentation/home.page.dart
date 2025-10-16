import 'package:fl_pokedex/features/home/widgets/widgtes.index.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  static const String route = "/HomePage";
   
  const HomePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(   
      body: Stack(
        children: [
          Pokeball(),
          PokedexTitle(),
          PokedexGridList()
        ],
      ),
    );
  }
}
